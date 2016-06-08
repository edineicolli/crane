unit UIDEMenu;

interface

uses
   ToolsAPI, Classes, Windows, Vcl.Menus;


type

   TCustomMenuItem = class(TNotifierObject, IOTAWizard, IOTAMenuWizard)
     function GetIDString: string;
     function GetName: string;
     function GetState: TWizardState;
     // Launch the AddIn
     procedure Execute;
     function GetMenuText: string;
   end;

   TCustomMenuHandler = class(TObject)
    // Handle custom menu
     procedure WizardClick(Sender: TObject);
     procedure SettingsClick(Sender: TObject);
   end;

procedure Register;

implementation

uses
  Vcl.Dialogs, uiConfig;

var
  mnuCrane, mnuWizard, mnuSettings: TMenuItem;
  CustomMenuHandler: TCustomMenuHandler;

{ TTMSMenuItem }

procedure TCustomMenuItem.Execute;
begin
  ShowMessage('IOTAWizardMenu based menu item');
end;

function TCustomMenuItem.GetIDString: string;
begin
  Result := 'TMS.MenuSample';
end;

function TCustomMenuItem.GetMenuText: string;
begin
  Result := 'IOTAWizardMenu';
end;

function TCustomMenuItem.GetName: string;
begin
  Result := 'TMSMenuSample';
end;

function TCustomMenuItem.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

procedure TCustomMenuHandler.WizardClick(Sender: TObject);
begin
  ShowMessage('INTAServices40.MainMenu based menu item');
end;

procedure TCustomMenuHandler.SettingsClick(Sender: TObject);
begin
  if (frmConfig = nil) then
    frmConfig := TfrmConfig.Create(nil);

  frmConfig.Show;

end;


procedure AddIDEMenu;
var
  NTAServices: INTAServices40;

begin
  NTAServices := BorlandIDEServices as INTAServices40;

  // avoid inserting twice
  if NTAServices.MainMenu.Items.Find('Crane') = nil then
  begin
    CustomMenuHandler := TCustomMenuHandler.Create;

    mnuCrane := TMenuItem.Create(nil);
    mnuCrane.Caption := 'Crane';

   if NTAServices.MainMenu.Items[7].Find('Wizard') = nil then
   begin
    mnuWizard := TMenuItem.Create(nil);
    mnuWizard.Caption := 'Wizard';
    mnuWizard.OnClick := CustomMenuHandler.WizardClick;

    mnuCrane.Add(mnuWizard);
    end;

   if NTAServices.MainMenu.Items[7].Find('Settings') = nil then
   begin
    mnuSettings := TMenuItem.Create(nil);
    mnuSettings.Caption := 'Settings';
    mnuSettings.OnClick := CustomMenuHandler.SettingsClick;

    mnuCrane.Add(mnuSettings);
    end;

    NTAServices.MainMenu.Items.Insert(7, mnuCrane);
//    NTAServices.MainMenu.Items[5].Add(mnuitem)
  end;

end;

procedure RemoveIDEMenu;
var
  NTAServices: INTAServices40;
begin
  if Assigned(mnuCrane) then
  begin
    NTAServices := BorlandIDEServices as INTAServices40;
    NTAServices.MainMenu.Items.Remove(mnuCrane);
    mnuCrane.Free;
    if Assigned(CustomMenuHandler) then
      CustomMenuHandler.Free;
  end;
end;

procedure Register;
begin
  RegisterPackageWizard(TCustomMenuItem.Create);
  AddIDEMenu;
end;

initialization
  mnuCrane := nil;
  CustomMenuHandler := nil;

finalization

  RemoveIDEMenu;


end.
