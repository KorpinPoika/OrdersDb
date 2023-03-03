object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 572
  Width = 276
  object OrdersDbConnection: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password=Password_01;Persist Security Info=Tr' +
      'ue;User ID=sa;Data Source=MS OrdersDb'
    Provider = 'MSDASQL.1'
    Left = 32
    Top = 8
  end
  object OrderTable: TADOTable
    Connection = OrdersDbConnection
    CursorType = ctStatic
    OnNewRecord = OrderTableNewRecord
    TableName = 'Orders'
    Left = 24
    Top = 192
    object OrderTableo_id: TAutoIncField
      FieldName = 'o_id'
      ReadOnly = True
      Visible = False
    end
    object OrderTableo_datetime: TDateTimeField
      DisplayLabel = 'Date'
      FieldName = 'o_datetime'
      DisplayFormat = 'dd.MM.yyyy HH:mm'
    end
    object OrderTableo_client_id: TIntegerField
      FieldName = 'o_client_id'
      Visible = False
    end
    object OrderTableo_group_id: TIntegerField
      FieldName = 'o_group_id'
      Visible = False
    end
    object OrderTablel_Client: TWideStringField
      DisplayLabel = 'Client'
      FieldKind = fkLookup
      FieldName = 'l_Client'
      LookupDataSet = ClientTable
      LookupKeyFields = 'c_id'
      LookupResultField = 'c_fio'
      KeyFields = 'o_client_id'
      Size = 30
      Lookup = True
    end
    object OrderTablel_Articul: TWideStringField
      DisplayLabel = 'Articul'
      FieldKind = fkLookup
      FieldName = 'l_Articul'
      LookupDataSet = ArticulTable
      LookupKeyFields = 'a_id'
      LookupResultField = 'a_name'
      KeyFields = 'o_group_id'
      Size = 30
      Lookup = True
    end
  end
  object OrderDataSource: TDataSource
    DataSet = OrderTable
    Left = 120
    Top = 192
  end
  object ArticulDataSource: TDataSource
    DataSet = ArticulTable
    Left = 120
    Top = 64
  end
  object ClientDataSource: TDataSource
    DataSet = ClientTable
    Left = 120
    Top = 128
  end
  object ArticulTable: TADOTable
    Connection = OrdersDbConnection
    CursorType = ctStatic
    TableName = 'Order_groups'
    Left = 24
    Top = 64
    object ArticulTablea_id: TAutoIncField
      DisplayWidth = 10
      FieldName = 'a_id'
      ReadOnly = True
    end
    object ArticulTablea_name: TWideStringField
      DisplayWidth = 24
      FieldName = 'a_name'
      Size = 150
    end
  end
  object ClientTable: TADOTable
    Connection = OrdersDbConnection
    CursorType = ctStatic
    BeforeDelete = ClientTableBeforeDelete
    TableName = 'Clients'
    Left = 24
    Top = 128
    object ClientTablec_id: TAutoIncField
      FieldName = 'c_id'
      ReadOnly = True
    end
    object ClientTablec_fio: TWideStringField
      DisplayLabel = 'Name of client'
      FieldName = 'c_fio'
      Size = 150
    end
  end
  object ClientHasOrdersQuery: TADOQuery
    Connection = OrdersDbConnection
    Parameters = <
      item
        Name = 'ClientId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 5
        Size = 19
        Value = Null
      end>
    SQL.Strings = (
      'select 1'
      'from Orders'
      'where o_client_id = :ClientId')
    Left = 48
    Top = 288
  end
end
