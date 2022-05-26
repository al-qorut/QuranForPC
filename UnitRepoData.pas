unit UnitRepoData;

interface
{$M+}
uses
  System.Classes, Vcl.StdCtrls, Vcl.CheckLst,
  Inifiles, System.SysUtils, comCtrls, WebView2, unit_data_modul, data.DB;

type
  TQuran = record
    surat : Integer;
    ayat  : Integer;
    text  : WideString;
  end;

  TAyat = array of Integer;

  QuranData = class(TThread)
  private
    FFinish : boolean;

    procedure bukaData(db :String);
    procedure IsiList;
   // function getNamaQuran(indexQuran:Integer):String;
    function gabung(index : Integer):WideString;
    procedure getShow();
  protected
    procedure Execute; override;
  published
    constructor getData(_surat :Integer);
    destructor Destroy ; override;
    property finish : boolean  read FFinish write FFinish;
  end;

 {$I const.inc}

const
  COL_SURA = 'sura';
  COL_AYAH = 'ayah';

var
 dataQuran : array of TQuran;
 noHal, countSurat, countTafsir, countAyat  : Integer;
 path, nmSurat, query : String;
 Setting : TIniFile;
 rangeAyat : TAyat;

implementation
  uses windows, unit_main, messages;


function getAyatFromPage(page : Integer): TAyat;
 var
  hasil : TAyat;
  nextPageSura, nextPageAyah : Integer;
 begin
   setLength(hasil,4);
   if page>= PAGES_LAST then
    page := PAGES_LAST;
   if page <= 1 then
    page := 1;
    hasil[0]:= PAGE_SURA_START[page-1];
    hasil[1]:= PAGE_AYAH_START[page-1];

    if page=PAGES_LAST then
     begin
        hasil[2]:= SURA_LAST;
        hasil[3]:= 6;
     end else
     begin
        nextPageSura := PAGE_SURA_START[page];
        nextPageAyah := PAGE_AYAH_START[page];
        if nextPageSura=hasil[0] then
          begin
            hasil[2] := hasil[0];
            hasil[3] := nextPageAyah - 1;
          end else
          begin
              if nextPageAyah > 1 then
               begin
                 hasil[2] := nextPageSura;
                 hasil[3] := nextPageAyah-1;
               end else
               begin
                 hasil[2] := nextPageSura-1;
                 hasil[3] := SURA_NUM_AYAHS[hasil[2]-1];
               end;
          end;
     end;
   result := hasil;
 end;
   {
    ayah[0] SURA_START
    ayah[1] AYAH_START
    ayah[2] SURA_ENDING
    ayah[3] AYAH_ENDING
   }
function getBuildScript(ayah : TAyat): String;
var
  hasil : TStrings;
begin
  hasil := TStringList.Create;
  try
      hasil.Add('select * from verses where (');
      if ayah[0]=ayah[2] then {Surat awal dengan ahir sama}
      begin
        hasil.Add(COL_SURA);
        hasil.Add(' = '+intTostr(ayah[0])); {sura=1}
        hasil.Add(' and '+COL_AYAH+' >='+intTostr(ayah[1])); {and ayah>=1}
        hasil.Add(' and '+COL_AYAH+' <='+intTostr(ayah[3])); {and ayah<=7}
      end else
      begin
        // (sura = minSura and ayah >= minAyah)
        hasil.Add('('+COL_SURA+' = '+intToStr(ayah[0])+' and ');
        hasil.Add(COL_AYAH+' >= '+intToStr(ayah[1])+')');
        hasil.Add(' or ');
        // (sura = maxSura and ayah <= maxAyah)
        hasil.Add('('+COL_SURA+' = '+intToStr(ayah[2])+' and ');
        hasil.Add(COL_AYAH+' <= '+intToStr(ayah[3])+')');
        hasil.Add(' or ');
        // (sura > minSura and sura < maxSura)
        hasil.Add('('+COL_SURA+' > '+intToStr(ayah[0])+' and ');
        hasil.Add(COL_SURA+' < '+intToStr(ayah[2])+')');
      end;

      hasil.Add(') order by '+COL_SURA+','+COL_AYAH);

      result := hasil.Text;
  finally
    hasil.Free;
  end;
end;

destructor QuranData.Destroy;
begin
 PostMessage(Handle, WM_DESTROY, self.ThreadID,0);
 inherited destroy;
end;

constructor QuranData.getData(_surat :Integer);
begin
  inherited create(true);
  FreeOnTerminate := true;
  FFinish := false;
  noHal := _surat;
  path := ExtractFilePath(paramStr(0));
  query := getBuildScript(getAyatFromPage(_surat));
  nmSurat := '';//getNamaQuran(_surat-1);
  Synchronize(isiList);
  suspended := false;
end;

{
function QuranData.getNamaQuran(indexQuran:Integer):String;
var
 s: TStrings;
begin
   s := TStringList.Create;
   try
     s.LoadFromFile(path+'data\quran.ini');
     result := s[indexQuran];
   finally
     s.Free;
   end;
end;
     }


procedure QuranData.bukaData(db :String);
begin
 try
     dm.ZCon.Connected:=false;
     dm.ZCon.LibraryLocation := Path+'sqlite3.dll';
     dm.ZCon.Database := Path+'Data\'+db;
     dm.ZCon.Connected:=true;


     dm.ZQuery.DisableControls;
     dm.ZQuery.Close;
     dm.ZQuery.SQL.Text:=query;
     dm.ZQuery.Open;
     countSurat:=dm.ZQuery.RecordCount;
 except
   on E:Exception do
      Form1.StatusBar1.Panels[0].Text:=E.Message;
 end;
end;



procedure QuranData.IsiList;
  var
   i, ada : integer;
   nama, dsNama : String;
  begin
  try
     setting := TIniFile.Create(path+'data\setting.ini');
     try
        countTafsir := setting.ReadInteger('data','jumlah',0);
        bukaData('quran.db');
        if dm.ZQuery.RecordCount<1 then exit;
        setLength(dataQuran, dm.ZQuery.RecordCount);
        countAyat := dm.ZQuery.RecordCount;
        dm.ZQuery.First;
        while not dm.ZQuery.Eof do
          begin
            dataQuran[dm.zQuery.RecNo-1].surat:=dm.ZQuery.FieldByName('sura').AsInteger;
            dataQuran[dm.zQuery.RecNo-1].ayat:=dm.ZQuery.FieldByName('ayah').AsInteger;
            dataQuran[dm.zQuery.RecNo-1].text:='<p class="qalam">'+dm.ZQuery.FieldByName('text').AsWideString+'</p>';
            dm.ZQuery.Next;
          end;

        //Apabila terjemah perkata diceklis
       if (setting.ReadBool('data','lafdzi',false)=true) then
        begin
          bukaData('words.db');
          for I := 0 to countAyat-1 do
            begin
              dataQuran[i].text:=dataQuran[i].text+'<div id="card-lafdzi">';
              dm.ZQuery.First;
              while not dm.ZQuery.eof  do begin
                if (dm.ZQuery.FieldByName('ayah').AsInteger=dataQuran[i].ayat) and
                   (dm.ZQuery.FieldByName('sura').AsInteger=dataQuran[i].surat) then
                      begin
                        dataQuran[i].text:=dataQuran[i].text+'<div class="box-lafdzi"><div class="text-arab">'+dm.ZQuery.FieldByName('hi').AsString+'</div>';
                        dataQuran[i].text:=dataQuran[i].text+'<div class="text-latin">'+dm.ZQuery.FieldByName('id').AsString+'</div></div>';
                      end;
                 dm.ZQuery.Next;
              end;
              dataQuran[i].text:=dataQuran[i].text+'</div>';
            end;
        end;


     //Loop apa saja yg diceklis
     for i := 0 to countTafsir-1  do
      begin
        ada := setting.ReadInteger(intToStr(i+1),'check',1);
        if ada=1 then
          begin
            nama:=setting.ReadString(intTostr(i+1),'fileName','');
            dsnama:=setting.ReadString(intTostr(i+1),'displayName','');
            bukaData(nama);
            if dm.ZQuery.RecordCount<1 then exit;
            dm.ZQuery.First;
            while not dm.ZQuery.Eof do
              begin
                if copy(nama,7,2)='ar' then
                 dataQuran[dm.zQuery.RecNo-1].text:=dataQuran[dm.zQuery.RecNo-1].text+'<p style=text-align:right><h7><i>'+dsNama+'</i></h7><br>'+dm.ZQuery.FieldByName('text').AsWideString+'</p>'
                else
                 dataQuran[dm.zQuery.RecNo-1].text:=dataQuran[dm.zQuery.RecNo-1].text+'<p><h7><i>'+dsNama+'</i></h7><br>'+dm.ZQuery.FieldByName('text').AsWideString+'</p>';
                dm.ZQuery.Next;
              end;
          end;
      end;
     finally
       getShow;
       dm.ZCon.Disconnect;
       FFinish := true;
       setting.Free;
     end;
  Except
    on E:Exception do
      Form1.StatusBar1.Panels[0].Text:=E.Message;
  end;
end;

function QuranData.gabung(index : Integer):WideString;
var
  hasil : WideString;
begin
  hasil := '<div class="col s12 m6"><div class="card blue-grey darken-3"><div class="card-content white-text">';
  hasil := hasil+'<span>'+nmSurat+'-'+intTostr(dataQuran[index].surat)+':'+intTostr(dataQuran[index].ayat)+'</span>';
  hasil := hasil+dataQuran[index].text;
  hasil := hasil+'</div></div></div>';
  result:=hasil;
end;

procedure QuranData.getShow;
  var
    hasil : TStrings;
    i : Integer;
  begin
    hasil := TStringList.Create;
    hasil.LoadFromFile(path+'View\header.html',TEncoding.UTF8);
    try
      for I := 0 to countSurat-1 do
       hasil.Add(gabung(I));
       hasil.SaveToFile(path+'View\index.html',TEncoding.UTF8);
    finally
      hasil.Free;
    end;
 end;

procedure QuranData.Execute;
begin
  while Terminated=false do
   begin
     if FFinish then
       Terminate
   end;
end;

end.
