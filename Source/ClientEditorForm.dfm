object ClientEditor: TClientEditor
  Left = 0
  Top = 0
  Caption = 'Clients list'
  ClientHeight = 281
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    552
    281)
  PixelsPerInch = 96
  TextHeight = 13
  object btnClose: TBitBtn
    Left = 469
    Top = 248
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 0
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 248
    Width = 240
    Height = 25
    DataSource = DataModule1.ClientDataSource
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 536
    Height = 234
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataModule1.ClientDataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'c_id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'c_fio'
        Title.Caption = 'Client Name'
        Visible = True
      end>
  end
end
