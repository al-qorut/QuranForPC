unit Unit_Data_modul;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  Tdm = class(TDataModule)
    ZCon: TZConnection;
    ZQuery: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}


{$R *.dfm}

end.
