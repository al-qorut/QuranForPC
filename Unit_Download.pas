unit Unit_Download;

interface
  uses
   Windows, Classes, ShellApi, SysUtils, Winapi.WinInet, Registry;
  type
    THttpDownload = class(TObject)
    private
      FOwner: TComponent;
      FURL: String;
      FLastContent: String;
      FBytesRead: Integer;
      FContentLength: Integer;
      FTimeOut: Cardinal;
      FOnProgress: TNotifyEvent;
    public
      constructor Create(Owner: TComponent);
      procedure SendRequest(Filename: String);
      property OnProgress: TNotifyEvent read FOnProgress write FOnProgress;
      property URL: String read FURL write FURL;
      property TimeOut: Cardinal read FTimeOut write FTimeOut;
      property BytesRead: Integer read FBytesRead;
      property ContentLength: Integer read FContentLength;
      property LastContent: String read FLastContent;
  end;


implementation


constructor THttpDownload.Create(Owner: TComponent);
begin
  FBytesRead := -1;
  FContentLength := -1;
  FOwner := Owner;
  FTimeOut := 10;
end;



procedure THttpDownload.SendRequest(Filename: String);
var
  NetHandle: HINTERNET;
  UrlHandle: HINTERNET;
  Buffer: array[1..4096] of AnsiChar;
  Head: array[1..1024] of Char;
  BytesInChunk, HeadSize, Reserved, TimeOutSeconds: Cardinal;
  LocalFile: File;
  DoStore: Boolean;
  UserAgent, OS: String;
  HttpStatus: Integer;
  ContentChunk: UTF8String;
begin
  DoStore := False;
 // if IsWine then
 //   OS := 'Linux/Wine'
 // else
  OS := 'Windows NT '+IntToStr(Win32MajorVersion)+'.'+IntToStr(Win32MinorVersion);
  //UserAgent := APPNAME+'/'+MainForm.AppVersion+' ('+OS+'; '+ExtractFilename(Application.ExeName)+'; '+FOwner.Name+')';
  NetHandle := InternetOpen(PChar(UserAgent), INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);

  // Do not let the user wait 30s
  TimeOutSeconds := FTimeOut * 1000;
  InternetSetOption(NetHandle, INTERNET_OPTION_CONNECT_TIMEOUT, @TimeOutSeconds, SizeOf(TimeOutSeconds));

  UrlHandle := nil;
  FLastContent := '';
  try
    UrlHandle := InternetOpenURL(NetHandle, PChar(FURL), nil, 0, INTERNET_FLAG_RELOAD, 0);
    if (not Assigned(UrlHandle)) and FURL.StartsWith('https:', true) then begin
      // Try again without SSL. See issue #65 and #1209
     // MainForm.LogSQL(f_('Could not open %s (%s) - trying again without SSL...', [FURL, SysErrorMessage(Windows.GetLastError)]), lcError);
      //FURL := ReplaceRegExpr('^https:', FURL, 'http:');
      UrlHandle := InternetOpenURL(NetHandle, PChar(FURL), nil, 0, INTERNET_FLAG_RELOAD, 0);
    end;
    if not Assigned(UrlHandle) then begin
     // raise Exception.CreateFmt(_('Could not open %s (%s)'), [FURL, SysErrorMessage(Windows.GetLastError)]);
    end;

    // Detect content length
    HeadSize := SizeOf(Head);
    Reserved := 0;
    if HttpQueryInfo(UrlHandle, HTTP_QUERY_CONTENT_LENGTH, @Head, HeadSize, Reserved) then
      FContentLength := StrToIntDef(Head, -1)
    else
    //  raise Exception.CreateFmt(_('Server did not send required "Content-Length" header: %s'), [FURL]);

    // Check if we got HTTP status 200
    HeadSize := SizeOf(Head);
    Reserved := 0;
    if HttpQueryInfo(UrlHandle, HTTP_QUERY_STATUS_CODE, @Head, HeadSize, Reserved) then begin
      HttpStatus := StrToIntDef(Head, -1);
      if HttpStatus <> 200 then
       // raise Exception.CreateFmt(_('Got HTTP status %d from %s'), [HttpStatus, FURL]);
    end;

    // Create local file
    if Filename <> '' then begin
      AssignFile(LocalFile, FileName);
      Rewrite(LocalFile, 1);
      DoStore := True;
    end;

    // Stream contents
    while true do begin
      InternetReadFile(UrlHandle, @Buffer, SizeOf(Buffer), BytesInChunk);
      // Either store as file or in memory variable
      if DoStore then begin
        BlockWrite(LocalFile, Buffer, BytesInChunk)
      end else begin
        SetString(ContentChunk, PAnsiChar(@Buffer[1]), BytesInChunk);
        FLastContent := FLastContent + String(ContentChunk);
      end;
      Inc(FBytesRead, BytesInChunk);
      if Assigned(FOnProgress) then
        FOnProgress(Self);
      if BytesInChunk = 0 then
        break;
    end;

  finally
    if DoStore then
      CloseFile(LocalFile);
    if Assigned(UrlHandle) then
      InternetCloseHandle(UrlHandle);
    if Assigned(NetHandle) then
      InternetCloseHandle(NetHandle);
  end;
end;
end.
