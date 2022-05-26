object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Setting'
  ClientHeight = 346
  ClientWidth = 476
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    476
    346)
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 8
    Top = 8
    Width = 456
    Height = 307
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 3
    DefaultColWidth = 150
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSizing, goColSizing, goRowMoving, goColMoving, goEditing, goTabs, goRowSelect, goFixedRowDefAlign]
    TabOrder = 0
    OnClick = StringGrid1DblClick
    OnDblClick = StringGrid1DblClick
    OnDrawCell = StringGrid1DrawCell
  end
  object Button1: TButton
    Left = 389
    Top = 318
    Width = 75
    Height = 25
    Caption = 'Tutup'
    TabOrder = 1
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 321
    Width = 169
    Height = 17
    Caption = 'Menggunakan Web Browser'
    TabOrder = 2
    OnClick = CheckBox1Click
  end
  object CheckBox2: TCheckBox
    Left = 192
    Top = 321
    Width = 121
    Height = 17
    Caption = 'Terjemah per Kata'
    TabOrder = 3
    OnClick = CheckBox2Click
  end
end
