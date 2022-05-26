procedure LoadDocFromStream(WB: TWebBrowser; Stream: TStream);
var
  PersistStreamInit: IPersistStreamInit;
  StreamIntf: IStream;
  StreamAdapter: TStreamAdapter;
begin
  PersistStreamInit := WB as IPersistStreamInit;
  StreamAdapter := TStreamAdapter.Create(Stream);
  StreamIntf := StreamAdapter as IStream;
  PersistStreamInit.Load(StreamIntf);
end;

//After knowing which doing what from each statement above, now it is the time to reduce your typing task :)

procedure LoadDocFromStream(WB: TWebBrowser; Stream: TStream);
begin
  (WB.Document as IPersistStreamInit).Load(TStreamAdapter.Create(Stream,soReference));
end;

//That's all the way to do it. Quite simple eh? If you have a string variable holds your HTML content, simply create TStringStream from it and pass it to second function parameter.

//But wait, there's another way to work with string source! For you JavaScript guys whom play often with IE DOM should familiar with this script code:


//document.write("Hello World!/BODY");
//document.close();
//--


//Yes, that can be done with Delphi and TWebBrowser too. The main difference is the type of involved object. The first method is using TWebBrowser.Document's IPersistStreamInit implementation (IPersistStreamInit is IPersistStream descendant which is actually exposes Save() and Load() methods). The second is using its IHTMLDocument2 implementation method.

//Here's how to do it:

procedure LoadDocFromString(WB: TWebBrowser; const HTMLString: string);
var
  v: OleVariant;
  HTMLDocument: IHTMLDocument2;
begin
  HTMLDocument := WB.Document as IHTMLDocument2;
  v := VarArrayCreate([0, 0], varVariant);
  v[0] := HTMLString;
  HTMLDocument.Write(PSafeArray(TVarData(v).VArray));
  HTMLDocument.Close;
end;

//Remember to put ActiveX and MSHTML units to your uses clause (IHTMLDocument2 is declared inside the later unit). If your Delphi version does not come with it, you'll need to import "Microsoft HTML Object Library" from your Delphi IDE or use command line tool $(DELPHI)\bin\tlibimp.exe. In this case, you'll get MSHTML_TLB.pas.

//There is a preliminary condition should be met though. All methods above will fail if WebBrowser does not contain valid document. You must load initial document (call it "dummy document") for the first time before using the functions above. I love to hear if anyone knows how to assign a dummy document better than my workaround below. Here's the snippet code:

  if not Assigned(WebBrowser.Document) then
    LoadBlankDocAndWaitUntilDocLoaded;
  LoadContentFromStringOrStream;

//Finally to include the document validity checking, I rewrote all those above and make the final 'ready to use' code:

procedure LoadBlankDoc(WB: TWebBrowser);
begin
  WB.Navigate('about:blank', EmptyParam, EmptyParam, EmptyParam, EmptyParam);
  while WB.ReadyState  READYSTATE_COMPLETE do
  begin
    Application.ProcessMessages;
    Sleep(0);
  end;
end;

procedure CheckDocReady(WB: TWebBrowser);
begin
  if not Assigned(WB.Document) then
    LoadBlankDoc(WB);
end;

procedure LoadDocFromStream(WB: TWebBrowser; Stream: TStream);
begin
  CheckDocReady(WB);
  (WB.Document as IPersistStreamInit).Load(TStreamAdapter.Create(Stream));
end;

procedure LoadDocFromString(WB: TWebBrowser; const HTMLString: string);
var
  v: OleVariant;
  HTMLDocument: IHTMLDocument2;
begin
  CheckDocReady(WB);
  HTMLDocument := WB.Document as IHTMLDocument2;
  v := VarArrayCreate([0, 0], varVariant);
  v[0] := HTMLString;
  HTMLDocument.Write(PSafeArray(TVarData(v).VArray));
  HTMLDocument.Close;
end;


==========================

Problem/Question/Abstract:

How to load a stream containing HTML code into a TWebBrowser

Answer:

Solve 1:

Imagine, you want to load a html document into the browser, that is not available as a file on your hard disk, but linked as a resource into your application.

You can use TResourceStream to make the data accessible for Delphi. But how to get the data into your WebBrowser? HTML documents implement the IPersistentStreamInit - interface, what means they support standard methods to accept data from any kind of stream or write data to any kind of stream.

uses ActiveX;

{Loads the contents of the "Stream" into the "WebBrowser"
"Stream" should contain HTML code}

procedure LoadStream(WebBrowser: TWebBrowser; Stream: TStream);
var
  PersistStreamInit: IPersistStreamInit;
  StreamAdapter: IStream;
  MemoryStream: TMemoryStream;
begin
  {Load empty HTML document into Webbrowser to make "Document" a valid HTML document}
  WebBrowser.Navigate('about:blank');
  {wait until finished loading}
  repeat
    Application.ProcessMessages;
    Sleep(0);
  until
    WebBrowser.ReadyState = READYSTATE_COMPLETE;
  {Get IPersistStreamInit - Interface}
  if WebBrowser.Document.QueryInterface(IPersistStreamInit, PersistStreamInit) = S_OK then
  begin
    {Clear document}
    if PersistStreamInit.InitNew = S_OK then
    begin
      {Make local copy of the contents of Stream if you want to use Stream directly,
                        you have to consider, that StreamAdapter will destroy it automatically}
      MemoryStream := TMemoryStream.Create;
      try
        MemoryStream.CopyFrom(Stream, 0);
        MemoryStream.Position := 0;
      except
        MemoryStream.Free;
        raise;
      end;
      {Use Stream-Adapter to get IStream Interface to our stream}
      StreamAdapter := TStreamAdapter.Create(MemoryStream, soOwned);
      {Load data from Stream into WebBrowser}
      PersistStreamInit.Load(StreamAdapter);
    end;
  end;
end;

{Let's test. You could also create a TResourceStream or TFileStream etc. here.}

procedure TForm1.Button2Click(Sender: TObject);
var
  S: TStringStream;
begin
  {To use this code, replace [ ] brackets with <> ones in the following two lines !}
  S := TStringStream.Create('[html][h1]Stream Test[/h1][p]This HTML content ' +
    'is being loaded from a stream.[/html]');
  try
    LoadStream(WebBrowser1, S);
  finally
    S.Free;
  end;
end;


Solve 2:

///////Begin Source
uses ActiveX;

function ShowHtml(mWebBrowser: TWebBrowser; mStrings: TStrings): Boolean;
var
  vMemoryStream: TMemoryStream;
begin
  Result := False;
  if not (Assigned(mStrings) and Assigned(mWebBrowser)) then
    Exit;
  mWebBrowser.Navigate('about:blank');
  if not Assigned(mWebBrowser.Document) then
    Exit;
  vMemoryStream := TMemoryStream.Create;
  try
    mStrings.SaveToStream(vMemoryStream);
    try
      vMemoryStream.Position := 0;
      Application.ProcessMessages; // :)
      (mWebBrowser.Document as IPersistStreamInit).Load(
        TStreamAdapter.Create(vMemoryStream));
    except
      Exit;
    end;
  finally
    vMemoryStream.Free;
  end;
  Result := True;
end; { ShowHtml }
///////End Source

///////Begin Demo

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShowHtml(WebBrowser1, Memo1.Lines);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Text :=
    ''#13#10 +
    'Hello Worlds!'#13#10 +
    ''#13#10;
end;
///////End Demo


Solve 3:

procedure AssignDocument(Browser: TWebBrowser; Text: string);
var
  Document: OleVariant;
{$IFDEF PERSIST_STREAM}
  InStream: TStream;
  Persist: IPersistStreamInit; {Declared in ActiveX}
{$ENDIF}
begin
{$IFDEF WRITE_FILE}
  Document := LocalServerPath('temp.html');
  WriteTextFile(Document, Text); {utility function}
  Browser.Navigate2(Document);
{$ENDIF}
{$IFDEF PERSIST_STREAM}
  Document := 'about:blank';
  Browser.Navigate2(Document);
  InStream := TStringStream.Create(Text);
  try
    Persist := (Browser.Document as IPersistStreamInit);
    Persist.Load(TStreamAdapter.Create(InStream));
  finally
    InStream.Free;
  end;
{$ENDIF}
{$IFDEF DISPATCH_DOC}
  Document := 'about:blank';
  Browser.Navigate2(Document);
  Document := Browser.Document as IDispatch;
  Document.Open;
  try
    Document.Write(Text);
  finally
    Document.Close;
  end;
{$ENDIF}
end;