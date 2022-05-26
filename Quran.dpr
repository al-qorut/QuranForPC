program Quran;

uses
  Forms,
  Unit_Main in 'Unit_Main.pas' {Form1},
  UnitRepoData in 'UnitRepoData.pas',
  Unit_Data_modul in 'Unit_Data_modul.pas' {dm: TDataModule},
  Unit_Data_online in 'Unit_Data_online.pas' {Form2},
  Unit_Download in 'Unit_Download.pas',
  Unit_About in 'Unit_About.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tdm, dm);
 // Application.CreateForm(TForm3, Form3);
  // Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
