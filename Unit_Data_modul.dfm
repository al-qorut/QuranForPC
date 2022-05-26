object dm: Tdm
  OldCreateOrder = False
  Height = 150
  Width = 215
  object ZCon: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16')
    SQLHourGlass = True
    HostName = ''
    Port = 0
    Database = ''
    User = ''
    Password = ''
    Protocol = 'sqlite'
    Left = 40
    Top = 40
  end
  object ZQuery: TZQuery
    Connection = ZCon
    Params = <>
    Left = 128
    Top = 40
  end
end
