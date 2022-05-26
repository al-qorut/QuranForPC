unit Unit_Data_online;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, System.JSON, Vcl.StdCtrls,
  System.Win.ScktComp, unit_download, iniFiles, Data.DB, Vcl.DBGrids;

type
  TForm2 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure AddData(i:Integer;no, kitab, ada : String);
    procedure DownloadProgress(Sender: TObject);
    procedure Status(txt: String);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);



  private
    { Private declarations }
    FLastStatusUpdate : Cardinal;
    Setting : TiniFile;
    path : String;
    countData, baris : Integer;
  public
    { Public declarations }

  end;
   {$I const.inc}

    function CleanupNumber(Str: String): String;
    function MakeFloat(Str: String): Extended;
    function FormatByteNumber( Bytes: Int64; Decimals: Byte = 1 ): String; Overload;
    function FormatByteNumber( Bytes: String; Decimals: Byte = 1 ): String; Overload;
    function FormatNumber(str: String; Thousands: Boolean=True): String; Overload;
    function FormatNumber(int: Int64; Thousands: Boolean=True): String; Overload;
    function MakeInt(Str: String): Int64;

var
  Form2: TForm2;
  NumberChars: TSysCharSet;




implementation
{$R *.dfm}

function FormatNumber(str: String; Thousands: Boolean=True): String; Overload;
var
  i, p, Left: Integer;
begin
  Result := StringReplace(str, '.', FormatSettings.DecimalSeparator, [rfReplaceAll]);
  if Thousands then begin
    // Do not add thousand separators to zerofilled numbers
    if ((Length(Result) >= 1) and (Result[1] = '0'))
      or ((Length(Result) >= 2) and (Result[1] = '-') and (Result[2] = '0'))
    then
      Exit;
    p := Pos(FormatSettings.DecimalSeparator, Result);
    if p = 0 then p := Length(Result)+1;
    Left := 2;
    if (Length(Result) >= 1) and (Result[1] = '-') then
      Left := 3;
    if p > 0 then for i:=p-1 downto Left do begin
      if (p-i) mod 3 = 0 then
        Insert(FormatSettings.ThousandSeparator, Result, i);
    end;
  end;
end;



{***
  Return a formatted number from an integer

  @param int64 Number to format
  @return string
}
function FormatNumber(int: Int64; Thousands: Boolean=True): String; Overload;
begin
  result := FormatNumber(IntToStr(int), Thousands);
end;

function FormatNumber(flt: Double; decimals: Integer = 0; Thousands: Boolean=True): String; Overload;
begin
  Result := Format('%10.'+IntToStr(decimals)+'f', [flt]);
  Result := Trim(Result);
  Result := FormatNumber(Result, Thousands);
end;


function MakeInt(Str: String): Int64;
begin
  // Result has to be of integer type
  try
    Result := Trunc(MakeFloat(Str));
  except
    Result := 0;
  end;
end;

function CleanupNumber(Str: String): String;
var
  i: Integer;
  HasDecimalSep: Boolean;
begin
  // Ensure the passed string contains a valid number, which is convertable by StrToFloat afterwards
  // Return it as string again, as there are callers which need to handle unsigned bigint's somehow -
  // there is no unsigned 64 bit integer type in Delphi.
  Result := '';

  // Unformatted float coming in? Detect by order of thousand and decimal char
  if ((Pos(',', Str) > 0) and (Pos(',', Str) < Pos('.', Str)))
//    or ((Pos('.', Str) > 0) and (Pos('.', ReverseString(Str)) <> 4))
    then begin
    Str := StringReplace(Str, '.', '*', [rfReplaceAll]);
    Str := StringReplace(Str, ',', FormatSettings.ThousandSeparator, [rfReplaceAll]);
    Str := StringReplace(Str, '*', FormatSettings.DecimalSeparator, [rfReplaceAll]);
  end;

  HasDecimalSep := False;
  for i:=1 to Length(Str) do begin
    if CharInSet(Str[i], NumberChars) or ((Str[i] = '-') and (Result='')) then
    begin
      // Avoid confusion and AV in StrToFloat()
      if (FormatSettings.ThousandSeparator = FormatSettings.DecimalSeparator) and (Str[i] = FormatSettings.DecimalSeparator) then
        continue;
      // Ensure only 1 decimalseparator is left
      if (Str[i] = FormatSettings.DecimalSeparator) and HasDecimalSep then
        continue;
      if Str[i] = FormatSettings.DecimalSeparator then
        HasDecimalSep := True;
      if Str[i] = FormatSettings.ThousandSeparator then
        Continue;
      Result := Result + Str[i];
    end else
      Break;
  end;
  if (Result = '') or (Result = '-') then
    Result := '0';
end;


function MakeFloat(Str: String): Extended;
var
  p_kb, p_mb, p_gb, p_tb, p_pb : Integer;
begin
  // Convert result to a floating point value to ensure
  // we don't discard decimal digits for the next step
  Result := StrToFloat(CleanupNumber(Str));

  // Detect if the string was previously formatted by FormatByteNumber
  // and convert it back by multiplying it with its byte unit
  p_kb := Pos(NAME_KB, Str);
  p_mb := Pos(NAME_MB, Str);
  p_gb := Pos(NAME_GB, Str);
  p_tb := Pos(NAME_TB, Str);
  p_pb := Pos(NAME_PB, Str);

  if (p_kb > 0) and (p_kb = Length(Str)-Length(NAME_KB)+1) then
    Result := Result * SIZE_KB
  else if (p_mb > 0) and (p_mb = Length(Str)-Length(NAME_MB)+1) then
    Result := Result * SIZE_MB
  else if (p_gb > 0) and (p_gb = Length(Str)-Length(NAME_GB)+1) then
    Result := Result * SIZE_GB
  else if (p_tb > 0) and (p_tb = Length(Str)-Length(NAME_TB)+1) then
    Result := Result * SIZE_TB
  else if (p_pb > 0) and (p_pb = Length(Str)-Length(NAME_PB)+1) then
    Result := Result * SIZE_PB;
end;

function FormatByteNumber( Bytes: Int64; Decimals: Byte = 1 ): String; Overload;
begin
  if Bytes >= FSIZE_PB then
    Result := FormatNumber( Bytes / SIZE_PB, Decimals ) + NAME_PB
  else if Bytes >= FSIZE_TB then
    Result := FormatNumber( Bytes / SIZE_TB, Decimals ) + NAME_TB
  else if Bytes >= FSIZE_GB then
    Result := FormatNumber( Bytes / SIZE_GB, Decimals ) + NAME_GB
  else if Bytes >= FSIZE_MB then
    Result := FormatNumber( Bytes / SIZE_MB, Decimals ) + NAME_MB
  else if Bytes >= FSIZE_KB then
    Result := FormatNumber( Bytes / SIZE_KB, Decimals ) + NAME_KB
  else
    Result := FormatNumber( Bytes ) + NAME_BYTES
end;


{**
  An overloaded function of the previous one which can
  take a string as input
}
function FormatByteNumber( Bytes: String; Decimals: Byte = 1 ): String; Overload;
begin
  Result := FormatByteNumber( MakeInt(Bytes), Decimals );
end;


function _GetFileSize(Filename: String): Int64;
var
  Attr: TWin32FileAttributeData;
begin
  FillChar(Attr, SizeOf(Attr), 0);
  if GetFileAttributesEx(PChar(Filename), GetFileExInfoStandard, @Attr) then
  begin
    Result := Int64(Attr.nFileSizeHigh) shl 32 + Int64(Attr.nFileSizeLow);
  end
  else
    Result := -1;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
  setting.WriteBool('data','eksternal',CheckBox1.Checked);
end;

procedure TForm2.CheckBox2Click(Sender: TObject);
begin
  setting.WriteBool('data','lafdzi',CheckBox2.Checked);
end;

procedure TForm2.DownloadProgress(Sender: TObject);
var
  Download: THttpDownload;
begin
  if FLastStatusUpdate > GetTickCount-200 then
    Exit;
  Download := Sender as THttpDownload;
  Status(format('Unduh: %s / %s', [FormatByteNumber(Download.BytesRead), FormatByteNumber(Download.ContentLength)]) + ' ...');
  FLastStatusUpdate := GetTickCount;
end;




procedure TForm2.Status(txt: String);
begin
 StringGrid1.Cells[3,baris]:=txt;
 StringGrid1.Refresh;
end;


procedure TForm2.StringGrid1DblClick(Sender: TObject);
var
 Download : THttpDownload;
 DownloadFilename, url, nama, dnama : String;
 BuildSizeDownloaded: Int64;
begin
//ShowMessageFmt( 'You clicked col %d and row %d', [ StringGrid1.Col, StringGrid1.Row ] );
  baris:= StringGrid1.Row;
  url := Setting.ReadString(intTostr(baris),'link','');
  nama := Setting.ReadString(intTostr(baris),'fileName','');
  dnama := Setting.ReadString(intTostr(baris),'displayName','');
  if(FileExists(path+'Data\'+nama)) then
    begin
      ShowMessageFmt( 'Data Kitab %s sudah ada', [ dnama] );
      exit;
    end;
  Download := THttpDownload.Create(Self);
  Download.URL := url;

  // Save the file in a temp directory
  DownloadFilename := path+'Data\'+nama;
  Download.OnProgress := DownloadProgress;

  try
    // Do the download
    Download.SendRequest(DownloadFilename);
   //  StringGrid1.Refresh;
    // Check if downloaded file exists
    if not FileExists(DownloadFilename) then
      Raise Exception('Downloaded file not found: %s'+DownloadFilename);
    BuildSizeDownloaded := _GetFileSize(DownloadFilename);
    if (Download.ContentLength > 0) and (BuildSizeDownloaded < Download.ContentLength) then
      Raise Exception(format('Downloaded file corrupted: %s (Size is %d and should be %d)', [DownloadFilename, BuildSizeDownloaded, Download.ContentLength]));

  except
    on E:Exception do
      showMessage(E.Message);
  end;
end;

procedure TForm2.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
  var
    Bmp:  TBitmap;
    R: TRect;
    namaFile : String;

  const
  L_PAD = 5;
  T_PAD = 5;
begin
 // memo1.Lines.Add('StringGrid1DrawCell call');
  Bmp := TBitmap.Create;
  namaFile := Setting.ReadString(intTostr(Arow),'fileName','');
    try
     if(FileExists(path+'Data\'+namaFile)) then
       Bmp.LoadFromFile(path+'view\OK.bmp')
      else
       Bmp.LoadFromFile(path+'view\Load.bmp');
      if (ACol = 2) and (Arow>0) then // left align image
      begin
        R.Top := Rect.Top + 1;
        R.Left := Rect.Left + 1;
        R.Right := R.Left + Bmp.Width;
        R.Bottom := R.Top + Bmp.Height;
        StringGrid1.Canvas.StretchDraw(R, Bmp);
      end;
    finally
      bmp.Free;
    end;
end;

procedure TForm2.AddData(i:Integer;no, kitab, ada : String);
begin
 StringGrid1.Cells[0,i]:=no;
 StringGrid1.Cells[1,i]:=kitab;
// StringGrid1.Cells[2,i]:=nfile;
 StringGrid1.Cells[3,i]:=ada;
end;


procedure TForm2.FormCreate(Sender: TObject);
var
  i : integer;
begin

 StringGrid1.Cells[0,0]:='Nomor';
 StringGrid1.Cells[1,0]:='Nama Kitab';
// StringGrid1.Cells[2,0]:='Nama File';
 StringGrid1.Cells[2,0]:='Status';
 StringGrid1.ColWidths[0]:=50;
 StringGrid1.ColWidths[1]:=200;
// StringGrid1.ColWidths[2]:=200;
 StringGrid1.ColWidths[2]:=100;
 path := ExtractFilePath(paramStr(0));
 Setting := TIniFile.Create(path+'data\setting.ini');
 countData := setting.ReadInteger('data','jumlah',1);
 StringGrid1.RowCount:=countData+1;
 CheckBox1.Checked := setting.ReadBool('data','eksternal',false);
 CheckBox2.Checked := setting.ReadBool('data','lafdzi',false);
 for I := 1 to countData do
  begin
      addData(i,intToStr(i),
      setting.ReadString(intToStr(i),'displayName',''),
      //setting.ReadString(intToStr(i),'fileName',''),
      setting.ReadString(intToStr(i),'ada',''));
  end;
end;

procedure TForm2.FormDestroy(Sender: TObject);
var
 i : Integer;
 nama : String;
 ada : boolean;
begin
  for I := 1 to countData do
  begin
      nama := Setting.ReadString(intTostr(i),'fileName','');
      ada := FileExists(path+'Data\'+nama);
      if ada then
       setting.WriteInteger(intToStr(i),'ada',1) else
       setting.WriteInteger(intToStr(i),'ada',0);
  end;
  Setting.Free;
end;

initialization

NumberChars := ['0'..'9', FormatSettings.DecimalSeparator, FormatSettings.ThousandSeparator];


end.
