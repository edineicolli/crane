unit uiConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.CheckLst,
  uiVariable, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, FireDAC.DApt;

type
  TfrmConfig = class(TForm)
    leName: TLabeledEdit;
    gbTemplateVariable: TGroupBox;
    pButtonVariables: TPanel;
    pContentVariables: TPanel;
    bbDeleteVariable: TBitBtn;
    bbNewVariable: TBitBtn;
    bbEditVariable: TBitBtn;
    dgTemplateVariables: TDBGrid;
    dsVariables: TDataSource;
    gbTemplateFiles: TGroupBox;
    pContentFiles: TPanel;
    dgFiles: TDBGrid;
    pButtonFiles: TPanel;
    bbDeleteFile: TBitBtn;
    bbNewFile: TBitBtn;
    bbEditFile: TBitBtn;
    mtFiles: TFDMemTable;
    dsFiles: TDataSource;
    mtFilesName: TStringField;
    mtFilesPath: TStringField;
    cbEnabled: TCheckBox;
    pcConfig: TPageControl;
    tsCrane: TTabSheet;
    tsNewTemplate: TTabSheet;
    clbTemplates: TCheckListBox;
    eTemplatePath: TEdit;
    pContent: TPanel;
    gbTemplates: TGroupBox;
    pButtonsTemplates: TPanel;
    bbDeleteTemplate: TBitBtn;
    bbNewTemplate: TBitBtn;
    bbEditTemplate: TBitBtn;
    gbOptions: TGroupBox;
    clbOptions: TCheckListBox;
    gbGeneralVariables: TGroupBox;
    pContentGeneralVariables: TPanel;
    pButtonsGeneralVariables: TPanel;
    bbDeleteGeneralVariable: TBitBtn;
    bbEditGeneralVariable: TBitBtn;
    bbNewGeneralVariable: TBitBtn;
    DBGrid1: TDBGrid;
    dsGeneralVariables: TDataSource;
    pButtons: TPanel;
    bbCancel: TBitBtn;
    bbOK: TBitBtn;
    pNewTemplateContent: TPanel;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    procedure bbNewTemplateClick(Sender: TObject);
    procedure bbEditTemplateClick(Sender: TObject);
    procedure clbTemplatesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbOKClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure bbDeleteFileClick(Sender: TObject);
    procedure bbEditFileClick(Sender: TObject);
    procedure bbNewGeneralVariableClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation


{$R *.dfm}

procedure TfrmConfig.bbCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConfig.bbDeleteFileClick(Sender: TObject);
begin
  if ((mtFiles.Active) and (not(mtFiles.IsEmpty))) then
    mtFiles.Delete;
end;

procedure TfrmConfig.bbEditFileClick(Sender: TObject);
begin
  if ((mtFiles.Active) and (not(mtFiles.IsEmpty))) then
    mtFiles.Edit;
end;

procedure TfrmConfig.bbEditTemplateClick(Sender: TObject);
begin
  pcConfig.SelectNextPage(True, True);
end;

procedure TfrmConfig.bbNewTemplateClick(Sender: TObject);
begin
  pcConfig.SelectNextPage(True, True);
end;

procedure TfrmConfig.bbOKClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConfig.bbNewGeneralVariableClick(Sender: TObject);
begin
  if (not(Assigned(FrmVariable))) then
    FrmVariable := TFrmVariable.Create(nil);

  if (FrmVariable.ShowModal = mrOk) then
  begin
    // Inserir variável
    if Variable.Name.IsEmpty then
      Exit;

    FDConnection1.ExecSQL('INSERT INTO GENERAL (variable, value) '+
      'VALUES ('+ QuotedStr(Variable.Name)+','+QuotedStr(Variable.Value)+');');
    FDConnection1.Commit;

    FDQuery1.Open();
  end;

end;

procedure TfrmConfig.clbTemplatesClick(Sender: TObject);
begin
  if (clbTemplates.ItemIndex > -1) then
    eTemplatePath.Text := clbTemplates.Items.Strings[clbTemplates.ItemIndex]
  else
    eTemplatePath.Text := EmptyStr;
end;

procedure TfrmConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDConnection1.Rollback;
  FDConnection1.Connected := False;
  Action := caFree;
  frmConfig := nil;
end;


procedure TfrmConfig.FormCreate(Sender: TObject);
var
  s: String;
begin
  s := ExtractFileDir(Application.ExeName);
  s := IncludeTrailingBackslash(s);
  if (not(FileExists(s+'crane.db'))) then
  begin
    FDConnection1.Params.Database := s+'crane.db';
    FDConnection1.Connected := True;

    FDConnection1.ExecSQL('create table option(name varchar(40), value varchar(40));');
    FDConnection1.ExecSQL('create table template(name varchar(40), active int);');
    FDConnection1.ExecSQL('create table general(variable varchar(40), value varchar(40));');
    FDConnection1.ExecSQL('create table file(name varchar(40), path varchar(40));');
    FDConnection1.ExecSQL('create table variable(template varchar(40), name varchar(40), value varchar(40));');
    FDConnection1.Commit;

  end;

  if (not(FDConnection1.Connected)) then
    FDConnection1.Connected := True;

end;

{TODO -oEdinei -cGeneral : Adicionar campo para formato de data}

end.
