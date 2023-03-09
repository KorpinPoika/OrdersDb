object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 626
  Width = 682
  object ClientDataSource: TDataSource
    DataSet = fdClientsQuery
    Left = 152
    Top = 192
  end
  object OrderQueryDataSource: TDataSource
    DataSet = fdOrdersQuery
    Left = 160
    Top = 64
  end
  object ArticulDataSource: TDataSource
    DataSet = fdArticulsQuery
    Left = 152
    Top = 248
  end
  object fdOrdersQuery: TFDQuery
    Active = True
    Connection = fdOrdersDbConnection
    UpdateOptions.AssignedValues = [uvUpdateMode, uvRefreshMode]
    UpdateOptions.UpdateTableName = 'orders'
    UpdateOptions.KeyFields = 'o_id'
    UpdateObject = fdUpdateOrderSQL
    SQL.Strings = (
      'select'
      #9'o.o_id,'
      #9'o.o_datetime,'
      #9'o.o_client_id,'
      #9'c.c_fio,'
      #9'o.o_articul_id,'
      #9'a.a_name '
      'from Orders o'
      #9'inner join Clients c on c.c_id = o.o_client_id'
      #9'inner join Articuls a on a.a_id = o.o_articul_id '
      'order by o.o_datetime')
    Left = 32
    Top = 64
    object fdOrdersQueryo_id: TIntegerField
      FieldName = 'o_id'
      Origin = 'o_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdOrdersQueryo_datetime: TSQLTimeStampField
      FieldName = 'o_datetime'
      Origin = 'o_datetime'
    end
    object fdOrdersQueryo_client_id: TIntegerField
      FieldName = 'o_client_id'
      Origin = 'o_client_id'
    end
    object fdOrdersQueryc_fio: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'c_fio'
      Origin = 'c_fio'
      Size = 150
    end
    object fdOrdersQueryo_articul_id: TIntegerField
      FieldName = 'o_articul_id'
      Origin = 'o_articul_id'
    end
    object fdOrdersQuerya_name: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'a_name'
      Origin = 'a_name'
      Size = 150
    end
  end
  object fdUpdateOrderSQL: TFDUpdateSQL
    Connection = fdOrdersDbConnection
    InsertSQL.Strings = (
      'INSERT INTO orders (o_datetime, o_client_id, o_articul_id)'
      'VALUES (:o_datetime, :o_client_id, :o_articul_id)')
    ModifySQL.Strings = (
      'Update orders'
      'set'
      '  o_datetime = :o_datetime, '
      '  o_client_id = :o_client_id, '
      '  o_articul_id = :o_articul_id'
      'where'
      '  o_id = :OLD_o_id')
    DeleteSQL.Strings = (
      'Delete from Orders'
      'where o_id = :o_id')
    FetchRowSQL.Strings = (
      'select'
      #9'o.o_id,'
      #9'o.o_datetime,'
      #9'o.o_client_id,'
      #9'c.c_fio,'
      #9'o.o_articul_id,'
      #9'a.a_name '
      'from Orders o'
      #9'inner join Clients c on c.c_id = o.o_client_id'
      #9'inner join Articuls a on a.a_id = o.o_articul_id '
      'where o.o_id = :OLD_o_id')
    Left = 32
    Top = 112
  end
  object fdOrdersDbConnection: TFDConnection
    Params.Strings = (
      'User_Name=sa'
      'Password=sa'
      'Database=OrdersDb'
      'DriverID=PG')
    Connected = True
    Transaction = FDTransaction1
    Left = 32
    Top = 8
  end
  object fdClientsQuery: TFDQuery
    BeforeDelete = fdClientsQueryBeforeDelete
    Connection = fdOrdersDbConnection
    SQL.Strings = (
      'select'
      'c.c_id,'
      'c.c_fio'
      'from Clients c')
    Left = 32
    Top = 192
    object fdClientsQueryc_id: TIntegerField
      FieldName = 'c_id'
      Origin = 'c_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdClientsQueryc_fio: TWideStringField
      FieldName = 'c_fio'
      Origin = 'c_fio'
      Size = 150
    end
  end
  object fdArticulsQuery: TFDQuery
    Connection = fdOrdersDbConnection
    SQL.Strings = (
      'select'
      'a.a_id,'
      'a.a_name'
      'from Articuls a')
    Left = 32
    Top = 248
    object fdArticulsQuerya_id: TIntegerField
      FieldName = 'a_id'
      Origin = 'a_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdArticulsQuerya_name: TWideStringField
      FieldName = 'a_name'
      Origin = 'a_name'
      Size = 150
    end
  end
  object FDTransaction1: TFDTransaction
    Connection = fdOrdersDbConnection
    Left = 144
    Top = 120
  end
  object fdUpdateClientSQL: TFDUpdateSQL
    Connection = fdOrdersDbConnection
    InsertSQL.Strings = (
      'Insert into Clients (c_fio) values(:c_fio)')
    ModifySQL.Strings = (
      'Update Clients'
      '  c_fio = :c_fio'
      'where'
      ' c_id = :OLD_c_id')
    DeleteSQL.Strings = (
      'Delete from Clients'
      'where c_id = :c_id')
    FetchRowSQL.Strings = (
      'select'
      'c.c_id,'
      'c.c_fio'
      'from Clients c'
      'where c.c_id = :OLD_c_id')
    Left = 248
    Top = 192
  end
  object ClientHasOrdersQuery: TFDQuery
    Connection = fdOrdersDbConnection
    SQL.Strings = (
      'select 1'
      'from Orders'
      'where o_client_id = :ClientId')
    Left = 376
    Top = 192
    ParamData = <
      item
        Name = 'CLIENTID'
        ParamType = ptInput
      end>
  end
end
