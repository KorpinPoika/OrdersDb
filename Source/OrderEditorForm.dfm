object OrderEditor: TOrderEditor
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Order editor'
  ClientHeight = 237
  ClientWidth = 248
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 233
    Height = 193
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 44
      Width = 27
      Height = 13
      Caption = 'Date:'
    end
    object Label2: TLabel
      Left = 16
      Top = 90
      Width = 27
      Height = 13
      Caption = 'Client'
    end
    object Label3: TLabel
      Left = 16
      Top = 136
      Width = 30
      Height = 13
      Caption = 'Articul'
    end
    object Label4: TLabel
      Left = 16
      Top = 8
      Width = 42
      Height = 13
      Caption = 'Order N:'
    end
    object DBText1: TDBText
      Left = 80
      Top = 8
      Width = 65
      Height = 17
      DataField = 'o_id'
      DataSource = DataModule1.OrderQueryDataSource
    end
    object lookupClient: TDBLookupComboBox
      Left = 16
      Top = 109
      Width = 201
      Height = 21
      DataField = 'o_client_id'
      DataSource = DataModule1.OrderQueryDataSource
      KeyField = 'c_id'
      ListField = 'c_fio'
      ListSource = DataModule1.ClientDataSource
      TabOrder = 0
    end
    object lookupArticul: TDBLookupComboBox
      Left = 16
      Top = 155
      Width = 201
      Height = 21
      DataField = 'o_articul_id'
      DataSource = DataModule1.OrderQueryDataSource
      KeyField = 'a_id'
      ListField = 'a_name'
      ListSource = DataModule1.ArticulDataSource
      TabOrder = 1
    end
    object OrderDateTimePicker: TDateTimePicker
      Left = 16
      Top = 63
      Width = 201
      Height = 21
      Date = 44987.000000000000000000
      Format = 'dd.MM.yyyy HH:mm'
      Time = 0.833698425929469500
      TabOrder = 2
      OnChange = OrderDateTimePickerChange
    end
  end
  object btnOk: TBitBtn
    Left = 85
    Top = 207
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 166
    Top = 207
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btnCancelClick
  end
end
