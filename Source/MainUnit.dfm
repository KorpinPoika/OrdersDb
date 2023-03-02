object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Orders'
  ClientHeight = 402
  ClientWidth = 842
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    842
    402)
  PixelsPerInch = 96
  TextHeight = 13
  object OrderDBNavigator: TDBNavigator
    Left = 8
    Top = 369
    Width = 225
    Height = 25
    DataSource = DataModule1.OrderDataSource
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
    Anchors = [akLeft, akBottom]
    TabOrder = 0
  end
  object OrderDBGrid: TDBGrid
    Left = 8
    Top = 29
    Width = 825
    Height = 334
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataModule1.OrderDataSource
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'o_datetime'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'l_Client'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'l_Articul'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 758
    Top = 369
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 2
  end
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 842
    Height = 23
    ActionManager = MainActionManager
    Caption = 'ActionToolBar1'
    Color = clMenuBar
    ColorMap.DisabledFontColor = 7171437
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedFont = clBlack
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Spacing = 0
  end
  object MainActionManager: TActionManager
    ActionBars = <
      item
      end
      item
        Items = <
          item
            Action = AddOrderAction
            Caption = '&Add Order'
          end
          item
            Action = OrderEditAction
          end
          item
            Action = ClientEditAction
            Caption = '&Edit Clients'
          end>
        ActionBar = ActionToolBar1
      end>
    Left = 632
    Top = 16
    StyleName = 'Platform Default'
    object AddOrderAction: TAction
      Caption = 'Add Order'
      Hint = 'Add new order'
      OnExecute = AddOrderActionExecute
    end
    object OrderEditAction: TAction
      Caption = 'EditOrderAction'
      OnExecute = OrderEditActionExecute
    end
    object ClientEditAction: TAction
      Caption = 'Edit Clients'
      Hint = 'Edit clients list'
      OnExecute = ClientEditActionExecute
    end
  end
end
