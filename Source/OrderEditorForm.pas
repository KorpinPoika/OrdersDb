unit OrderEditorForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, DataModuleUnit, Vcl.ComCtrls;

type
  TEditorMode = (emInsert, emEdit);

type
  TOrderEditor = class(TForm)
    Panel1: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lookupClient: TDBLookupComboBox;
    lookupArticul: TDBLookupComboBox;
    Label4: TLabel;
    OrderDateTimePicker: TDateTimePicker;
    DBText1: TDBText;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure OrderDateTimePickerChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    EditorMode: TEditorMode;
  end;

var
  OrderEditor: TOrderEditor;

implementation

uses Data.SqlTimSt;

{$R *.dfm}

procedure TOrderEditor.btnOkClick(Sender: TObject);
begin
  DataModule1.fdOrdersQuery.Post;
  DataModule1.fdOrdersQuery.Refresh;
end;

procedure TOrderEditor.btnCancelClick(Sender: TObject);
begin
  DataModule1.fdOrdersQuery.Cancel;
    DataModule1.fdOrdersQuery.Refresh;
end;

procedure TOrderEditor.FormShow(Sender: TObject);
begin
  if EditorMode = TEditorMode.emEdit then begin
    OrderDateTimePicker.DateTime := SQLTimeStampToDateTime(DataModule1.fdOrdersQueryo_datetime.Value);
    DataModule1.fdOrdersQuery.Edit;
  end
  else begin
    DataModule1.fdOrdersQuery.Insert;
    OrderDateTimePicker.DateTime := Now;
    OrderDateTimePickerChange(Sender);
  end;
end;

procedure TOrderEditor.OrderDateTimePickerChange(Sender: TObject);
begin
  DataModule1.fdOrdersQueryo_datetime.Value := DateTimeToSQLTimeStamp(OrderDateTimePicker.DateTime);
end;

end.
