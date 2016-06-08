unit uiVariable;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type

  TVariable = record
    Name: String;
    Value: String;
  end;

  TFrmVariable = class(TForm)
    leVariable: TLabeledEdit;
    leValue: TLabeledEdit;
    Panel1: TPanel;
    bCancel: TButton;
    bOK: TButton;
    procedure bCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVariable: TFrmVariable;
  Variable: TVariable;

implementation

{$R *.dfm}

procedure TFrmVariable.bCancelClick(Sender: TObject);
begin
  Variable.Name := EmptyStr;
  Variable.Value := EmptyStr;
  ModalResult := mrCancel;
end;



procedure TFrmVariable.FormShow(Sender: TObject);
begin
  leVariable.Text := Variable.Name;
  leValue.Text := Variable.Value;
end;



procedure TFrmVariable.bOKClick(Sender: TObject);
begin
  Variable.Name := leVariable.Text;
  Variable.Value := leValue.Text;
  ModalResult := mrOK;
end;



procedure TFrmVariable.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FrmVariable := nil;
end;



end.
