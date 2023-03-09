unit DataModuleUnit;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef;

type
  TDataModule1 = class(TDataModule)
    ClientDataSource: TDataSource;
    OrderQueryDataSource: TDataSource;
    ArticulDataSource: TDataSource;
    fdOrdersQuery: TFDQuery;
    fdUpdateOrderSQL: TFDUpdateSQL;
    fdOrdersDbConnection: TFDConnection;
    fdOrdersQueryo_id: TIntegerField;
    fdOrdersQueryo_datetime: TSQLTimeStampField;
    fdOrdersQueryo_client_id: TIntegerField;
    fdOrdersQueryc_fio: TWideStringField;
    fdOrdersQueryo_articul_id: TIntegerField;
    fdOrdersQuerya_name: TWideStringField;
    fdClientsQuery: TFDQuery;
    fdArticulsQuery: TFDQuery;
    fdArticulsQuerya_id: TIntegerField;
    fdArticulsQuerya_name: TWideStringField;
    fdClientsQueryc_id: TIntegerField;
    fdClientsQueryc_fio: TWideStringField;
    FDTransaction1: TFDTransaction;
    fdUpdateClientSQL: TFDUpdateSQL;
    ClientHasOrdersQuery: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure fdClientsQueryBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

uses Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin

  if Not fdOrdersDbConnection.Connected
  then fdOrdersDbConnection.Connected := true;

  fdOrdersQuery.Open;
  fdClientsQuery.Open;
  fdArticulsQuery.Open;
end;

procedure TDataModule1.DataModuleDestroy(Sender: TObject);
begin
  if fdClientsQuery.Active then fdClientsQuery.Close;
  if fdArticulsQuery.Active then fdArticulsQuery.Close;
  if fdOrdersQuery.Active then fdOrdersQuery.Close;

  if fdOrdersDbConnection.Connected
  then fdOrdersDbConnection.Connected := false;
end;

procedure TDataModule1.fdClientsQueryBeforeDelete(DataSet: TDataSet);
begin
  ClientHasOrdersQuery.Params.ParamByName('ClientId').Value := fdClientsQueryc_id.Value;
  ClientHasOrdersQuery.Open;

  if ClientHasOrdersQuery.RecordCount > 0 then begin
    ShowMessage('This client has some orders, so it cannot be deleted');
    ClientHasOrdersQuery.Close;
    Abort;
  end;

  ClientHasOrdersQuery.Close;
end;

end.
