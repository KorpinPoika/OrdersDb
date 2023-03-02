program OrdersDbProject;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {Form1},
  DataModuleUnit in 'DataModuleUnit.pas' {DataModule1: TDataModule},
  ClientEditorForm in 'ClientEditorForm.pas' {ClientEditor},
  OrderEditorForm in 'OrderEditorForm.pas' {OrderEditor};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TClientEditor, ClientEditor);
  Application.CreateForm(TOrderEditor, OrderEditor);
  Application.Run;
end.
