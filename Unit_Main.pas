unit Unit_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, OleCtrls, SHDocVw, ExtCtrls,
  StdCtrls,  CheckLst, ZAbstractTable, inifiles, WebView2, Vcl.Imaging.pngimage, unitRepoData,
  Vcl.Samples.Spin, Unit_Data_Modul, unit_Download, Winapi.shellApi, Vcl.Buttons,
  System.ImageList, Vcl.ToolWin;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    WebBrowser1: TWebBrowser;
    Panel3: TPanel;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    SpeedButton8: TSpeedButton;
    CheckListBox1: TCheckListBox;
    SpeedButton9: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure displayDataQuran;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure onShowQuran(Sender: TObject);
    procedure CheckListBox1ClickCheck(Sender: TObject);
    procedure WebBrowser1BeforeNavigate2(ASender: TObject;
      const pDisp: IDispatch; const URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
    procedure WebBrowser1DocumentComplete(ASender: TObject;
      const pDisp: IDispatch; const URL: OleVariant);
    procedure WebBrowser1NavigateComplete2(ASender: TObject;
      const pDisp: IDispatch; const URL: OleVariant);
    procedure ComboBox1Change(Sender: TObject);
    procedure openDB(db:String);
    procedure getAyat(cari : String);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure onShowTafsir(hal : Integer);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
    qd:QuranData;
    CurDispatch: IDispatch;
    FDocLoaded: Boolean;
    procedure onShowMushaf(hal : Integer);

  public
    { Public declarations }

  end;
  {$I const.inc}

const
  arab ='';

var
  Form1: TForm1;
  countData, hal : Integer;
  path, nmSurat : String;
  Setting : TIniFile;
  countAyat : TStrings;
  isArabic, isMushaf : boolean;

implementation
uses unit_data_online, Unit_About;
{$R *.dfm}




 procedure TForm1.openDB(db:String);
 begin
   dm.ZCon.Connected:=false;
   dm.ZCon.LibraryLocation := Path+'sqlite3.dll';
   dm.ZCon.Database := Path+'Data\'+db;
   dm.ZCon.Connected:=true;
 end;


 procedure TForm1.getAyat(cari : String);
 var
  s : String;
  hasil : TStrings;
 begin
  if dm.ZCon.Connected=false then
   begin
     if isArabic then
      begin
        s := 'select * from gundul where text like "%'+cari+'%"';
        openDB('quran.db');
      end else
      begin
        s := 'select * from verses where text like "%'+cari+'%"';
        openDB('quran.id.db');
      end;
   end;

   dm.ZQuery.DisableControls;
   dm.ZQuery.Close;
   dm.ZQuery.SQL.Text:=s;
  // caption := s;
   dm.ZQuery.Open;
   hasil := TStringList.Create;

   try
    hasil.LoadFromFile(path+'view\header.html');
    if dm.ZQuery.RecordCount>0 then
      begin
        dm.ZQuery.First;
        while not dm.ZQuery.Eof do
          begin
            hasil.Add('<div class="col s12 m6"><div class="card blue-grey darken-3"><div class="card-content white-text">');
            hasil.Add('<span>'+dm.ZQuery.FieldByName('sura').AsString+'-'+dm.ZQuery.FieldByName('ayah').AsString+'</span>');
            if isArabic then
            hasil.Add('<p style="text-align:right">'+StringReplace(dm.ZQuery.FieldByName('text').AsWideString,cari,'<span style="color:red">'+cari+'</span>',[])+'</p>') else
            hasil.Add('<p>'+StringReplace(dm.ZQuery.FieldByName('text').AsWideString,cari,'<span style="color:red">'+cari+'</span>',[])+'</p>');
            hasil.Add('</div></div></div>');
            dm.ZQuery.Next;
          end;
        hasil.SaveToFile(path+'view\pencarian.html',TEncoding.UTF8);
      end else
      begin
        hasil.Add('<p>kata <span style="color:red">'+cari+'</span> dalam Al-Qur''an tidak ditemukan</p></div></body></htmL>');
        hasil.SaveToFile(path+'view\pencarian.html',TEncoding.UTF8);
      end;
      WebBrowser1.Navigate(path+'view\pencarian.html');
   finally
    hasil.Free;
    dm.ZCon.Disconnect;
   end;
 end;

 procedure TForm1.displayDataQuran;
 var
  i : integer;
  begin
    CheckListBox1.Items.Clear;
    ComboBox1.Items.LoadFromFile(path+'data\quran.ini',TEncoding.UTF8);
    Setting := TIniFile.Create(path+'data\setting.ini');
    isMushaf := setting.ReadBool('data','isMushaf',false);
    if isMushaf=false then
      SpeedButton1.Glyph.LoadFromFile(path+'view\preview.bmp')else
      SpeedButton1.Glyph.LoadFromFile(path+'view\globe.bmp');
    ComboBox1.ItemIndex:=0;
    countData := setting.ReadInteger('data','jumlah',0);
      for I := 1 to countData do
        begin
          CHeckListBox1.Items.Add(setting.ReadString(intTostr(i),'displayName','noname'));
          if setting.ReadInteger(intTostr(i),'ada',0)=1 then
            CHeckListBox1.ItemEnabled[i-1]:=true else
            CHeckListBox1.ItemEnabled[i-1]:=false;
          if setting.ReadInteger(intTostr(i),'check',0)=1 then
            CHeckListBox1.Checked[i-1]:=true;
        end;
 end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
case integer(key) of
    1536..1791,1872..1919,2208..2303,-1200..-513,-400..-257,8,32,48..57:
       begin
         isArabic:=true;
       end;
  else
   isArabic:=false;
 end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  WebBrowser1.Navigate(path+'view\home.html');
end;





procedure TForm1.Button3Click(Sender: TObject);
begin
  Form2 := TForm2.Create(self);
  try
     Form2.showModal;
  finally
    displayDataQuran;
    form2.free;
  end;
end;



procedure TForm1.Button5Click(Sender: TObject);
begin
  if edit1.Text='' then exit;
  getAyat(edit1.Text);
end;

procedure TForm1.CheckListBox1ClickCheck(Sender: TObject);
var
 i : integer;
begin
   i:=CheckListBox1.ItemIndex+1;
   if CheckListBox1.Checked[CheckListBox1.ItemIndex] then
   setting.WriteInteger(intTostr(i),'check',1)else
   setting.WriteInteger(intTostr(i),'check',0);
 end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  hal := SURA_PAGE_START[ComboBox1.ItemIndex+1];
  ComboBox3.ItemIndex:=hal+1;
  onShowMushaf(hal);
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
  hal := JUZ_PAGE_START[ComboBox2.ItemIndex+1];
  ComboBox3.ItemIndex:=hal+1;
  onShowMushaf(hal);
end;

procedure TForm1.ComboBox3Change(Sender: TObject);
begin
  hal := ComboBox3.ItemIndex+1;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
 i : integer;
begin
   hal := 1;
   path := ExtractFilePath(paramStr(0));
   countAyat := TStringList.Create;
   countAyat.LoadFromFile('data\ayat.ini');
   displayDataQuran;
   isArabic := false;
   for I := 1 to 30 do
     ComboBox2.Items.Add(IntTostr(i));
   for I := 1 to 604 do
     ComboBox3.Items.Add(IntTostr(i));

 end;

procedure TForm1.FormDestroy(Sender: TObject);
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
  countAyat.Free;
  Setting.Free;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
     37 : SpeedButton3Click(sender);
     39 : SpeedButton4Click(sender);
     112 : SpeedButton9Click(sender); //About
     113 : SpeedButton1Click(sender); //tafsir
     114 : Button2Click(sender); //home
     115 : Button3Click(sender); //home
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  if isMushaf=true then
  WebBrowser1.Navigate(path+'view\home.html') else
  WebBrowser1.Navigate(path+'view\index.html');
end;

function halTopage(hal : Integer):String;
var
 hasil : string;
begin
  hasil :='';
  case hal of
   1..9 : hasil :='page00'+intToStr(hal)+'.png';
   10..99 : hasil :='page0'+intToStr(hal)+'.png';
   100..999 : hasil :='page'+intToStr(hal)+'.png';
  end;
  result := hasil;
end;

procedure TForm1.onShowMushaf(hal : Integer);
var
    hasil : TStrings;
  begin
    hasil := TStringList.Create;
    hasil.LoadFromFile(path+'View\hmushaf.html',TEncoding.UTF8);
    try
       hasil.Add('<img class="responsive-img" src="images\'+halToPage(hal)+'" width="80%" height="80%" style="display: block; margin: 0 auto;"/>');
		   hasil.Add('</div></body></html>');
       hasil.SaveToFile(path+'View\mushaf.html',TEncoding.UTF8);
    finally
      hasil.Free;
    end;
   WebBrowser1.HandleNeeded;
   WebBrowser1.Navigate(path+'view\mushaf.html');
   repeat Application.ProcessMessages until FDocLoaded;
end;

procedure TForm1.onShowQuran(Sender: TObject);
  begin
    WebBrowser1.HandleNeeded;
   if setting.readBool('data','eksternal',true)=false then
    WebBrowser1.Navigate(path+'view\index.html') else
    ShellExecute(0, 'open', PChar(path+'view\index.html'), nil, nil, SW_SHOWNORMAL);
    repeat Application.ProcessMessages until FDocLoaded;
  end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
if isMushaf=true then
 begin
    onShowTafsir(hal);
    isMushaf:=false;
    SpeedButton1.Glyph.LoadFromFile(path+'view\preview.bmp');
  end else
  begin
    onShowMushaf(hal);
    isMushaf:=true;
    SpeedButton1.Glyph.LoadFromFile(path+'view\globe.bmp');
 end;
 setting.WriteBool('data','isMushaf',isMushaf)
end;

procedure TForm1.onShowTafsir(hal : Integer);
begin
  qd:=QuranData.getData(hal);
  qd.FreeOnTerminate:=true;
  qd.OnTerminate := onShowQuran;
end;


procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  if hal<604 then
    hal:=hal+1;
    ComboBox3.itemIndex:=hal-1;
    if isMushaf then
      onShowMushaf(hal) else
      onShowTafsir(hal);
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  if hal>1 then
    hal:=hal-1;
    ComboBox3.itemIndex:=hal-1;
    if isMushaf then
      onShowMushaf(hal) else
      onShowTafsir(hal);
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
begin
  Form3 := TForm3.Create(self);
  try
     Form3.showModal;
  finally
    form3.free;
  end;
end;

procedure TForm1.WebBrowser1BeforeNavigate2(ASender: TObject;
  const pDisp: IDispatch; const URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
begin
  CurDispatch := nil;
  FDocLoaded := False;
end;

procedure TForm1.WebBrowser1DocumentComplete(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
begin
if (pDisp = CurDispatch) then
      begin
        FDocLoaded := True;
        CurDispatch := nil;
      end;
end;

procedure TForm1.WebBrowser1NavigateComplete2(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
begin
if CurDispatch = nil then
   CurDispatch := pDisp;
end;

end.
