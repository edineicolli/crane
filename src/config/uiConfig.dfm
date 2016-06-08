object frmConfig: TfrmConfig
  Left = 0
  Top = 0
  Caption = 'Config'
  ClientHeight = 522
  ClientWidth = 687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pcConfig: TPageControl
    Left = 0
    Top = 0
    Width = 687
    Height = 480
    ActivePage = tsCrane
    Align = alClient
    TabOrder = 0
    object tsCrane: TTabSheet
      Caption = 'Crane'
      object pContent: TPanel
        Left = 0
        Top = 0
        Width = 679
        Height = 452
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object gbTemplates: TGroupBox
          Left = 0
          Top = 61
          Width = 679
          Height = 204
          Align = alClient
          Caption = 'Templates'
          TabOrder = 0
          object clbTemplates: TCheckListBox
            AlignWithMargins = True
            Left = 5
            Top = 18
            Width = 669
            Height = 116
            Align = alTop
            ItemHeight = 13
            Items.Strings = (
              'Cadastro'
              'Consulta'
              'Pesquisa'
              'Processo'
              'Relat'#243'rio'
              'Gerador de relat'#243'rio'
              'Editor de relat'#243'rio'
              'Editor de layout')
            TabOrder = 0
            OnClick = clbTemplatesClick
          end
          object eTemplatePath: TEdit
            AlignWithMargins = True
            Left = 5
            Top = 140
            Width = 669
            Height = 21
            Align = alTop
            TabOrder = 1
          end
          object pButtonsTemplates: TPanel
            AlignWithMargins = True
            Left = 5
            Top = 163
            Width = 669
            Height = 36
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
            object bbDeleteTemplate: TBitBtn
              AlignWithMargins = True
              Left = 591
              Top = 3
              Width = 75
              Height = 30
              Align = alRight
              Caption = 'Delete'
              TabOrder = 0
            end
            object bbNewTemplate: TBitBtn
              AlignWithMargins = True
              Left = 429
              Top = 3
              Width = 75
              Height = 30
              Align = alRight
              Caption = 'New...'
              TabOrder = 1
              OnClick = bbNewTemplateClick
            end
            object bbEditTemplate: TBitBtn
              AlignWithMargins = True
              Left = 510
              Top = 3
              Width = 75
              Height = 30
              Align = alRight
              Caption = 'Edit...'
              TabOrder = 2
              OnClick = bbEditTemplateClick
            end
          end
        end
        object gbOptions: TGroupBox
          Left = 0
          Top = 0
          Width = 679
          Height = 61
          Align = alTop
          Caption = 'Options'
          TabOrder = 1
          object clbOptions: TCheckListBox
            AlignWithMargins = True
            Left = 5
            Top = 18
            Width = 669
            Height = 38
            Align = alClient
            ItemHeight = 13
            Items.Strings = (
              'Remove property read only of current project '
              'Add generate file in current project')
            TabOrder = 0
          end
        end
        object gbGeneralVariables: TGroupBox
          Left = 0
          Top = 265
          Width = 679
          Height = 187
          Align = alBottom
          Caption = 'General variables'
          TabOrder = 2
          object pContentGeneralVariables: TPanel
            AlignWithMargins = True
            Left = 5
            Top = 18
            Width = 669
            Height = 122
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object DBGrid1: TDBGrid
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 663
              Height = 116
              Align = alClient
              DataSource = dsGeneralVariables
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
          end
          object pButtonsGeneralVariables: TPanel
            AlignWithMargins = True
            Left = 5
            Top = 146
            Width = 669
            Height = 36
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object bbDeleteGeneralVariable: TBitBtn
              AlignWithMargins = True
              Left = 591
              Top = 3
              Width = 75
              Height = 30
              Align = alRight
              Caption = 'Delete'
              TabOrder = 0
            end
            object bbEditGeneralVariable: TBitBtn
              AlignWithMargins = True
              Left = 510
              Top = 3
              Width = 75
              Height = 30
              Align = alRight
              Caption = 'Edit...'
              TabOrder = 1
            end
            object bbNewGeneralVariable: TBitBtn
              AlignWithMargins = True
              Left = 429
              Top = 3
              Width = 75
              Height = 30
              Align = alRight
              Caption = 'New...'
              TabOrder = 2
              OnClick = bbNewGeneralVariableClick
            end
          end
        end
      end
    end
    object tsNewTemplate: TTabSheet
      Caption = 'New template'
      ImageIndex = 1
      object cbEnabled: TCheckBox
        Left = 348
        Top = 18
        Width = 75
        Height = 17
        Caption = 'Enabled'
        TabOrder = 0
      end
      object leName: TLabeledEdit
        Left = 61
        Top = 16
        Width = 268
        Height = 21
        EditLabel.Width = 51
        EditLabel.Height = 13
        EditLabel.Caption = 'Template: '
        LabelPosition = lpLeft
        TabOrder = 1
        TextHint = 'Template name...'
      end
      object pNewTemplateContent: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 51
        Width = 673
        Height = 398
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object gbTemplateVariable: TGroupBox
          Left = 0
          Top = 211
          Width = 673
          Height = 187
          Align = alBottom
          Caption = 'Variables'
          TabOrder = 0
          object pContentVariables: TPanel
            AlignWithMargins = True
            Left = 5
            Top = 18
            Width = 663
            Height = 123
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object dgTemplateVariables: TDBGrid
              Left = 0
              Top = 0
              Width = 663
              Height = 123
              Align = alClient
              DataSource = dsVariables
              DrawingStyle = gdsGradient
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
          end
          object pButtonVariables: TPanel
            AlignWithMargins = True
            Left = 5
            Top = 147
            Width = 663
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object bbDeleteVariable: TBitBtn
              AlignWithMargins = True
              Left = 585
              Top = 3
              Width = 75
              Height = 29
              Align = alRight
              Caption = 'Delete'
              TabOrder = 0
            end
            object bbNewVariable: TBitBtn
              AlignWithMargins = True
              Left = 423
              Top = 3
              Width = 75
              Height = 29
              Align = alRight
              Caption = 'New...'
              TabOrder = 1
            end
            object bbEditVariable: TBitBtn
              AlignWithMargins = True
              Left = 504
              Top = 3
              Width = 75
              Height = 29
              Align = alRight
              Caption = 'Edit...'
              TabOrder = 2
            end
          end
        end
        object gbTemplateFiles: TGroupBox
          Left = 0
          Top = 0
          Width = 673
          Height = 211
          Align = alClient
          Caption = 'Files'
          TabOrder = 1
          object pContentFiles: TPanel
            AlignWithMargins = True
            Left = 5
            Top = 18
            Width = 663
            Height = 147
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object dgFiles: TDBGrid
              Left = 0
              Top = 0
              Width = 663
              Height = 147
              Align = alClient
              DataSource = dsFiles
              DrawingStyle = gdsGradient
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
          end
          object pButtonFiles: TPanel
            AlignWithMargins = True
            Left = 5
            Top = 171
            Width = 663
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object bbDeleteFile: TBitBtn
              AlignWithMargins = True
              Left = 585
              Top = 3
              Width = 75
              Height = 29
              Align = alRight
              Caption = 'Delete'
              TabOrder = 0
              OnClick = bbDeleteFileClick
            end
            object bbNewFile: TBitBtn
              AlignWithMargins = True
              Left = 423
              Top = 3
              Width = 75
              Height = 29
              Align = alRight
              Caption = 'New...'
              TabOrder = 1
            end
            object bbEditFile: TBitBtn
              AlignWithMargins = True
              Left = 504
              Top = 3
              Width = 75
              Height = 29
              Align = alRight
              Caption = 'Edit...'
              TabOrder = 2
              OnClick = bbEditFileClick
            end
          end
        end
      end
    end
  end
  object pButtons: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 483
    Width = 681
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object bbCancel: TBitBtn
      AlignWithMargins = True
      Left = 603
      Top = 3
      Width = 75
      Height = 30
      Align = alRight
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = bbCancelClick
    end
    object bbOK: TBitBtn
      AlignWithMargins = True
      Left = 522
      Top = 3
      Width = 75
      Height = 30
      Align = alRight
      Caption = 'OK'
      TabOrder = 1
      OnClick = bbOKClick
    end
  end
  object dsVariables: TDataSource
    DataSet = FDQuery1
    Left = 608
    Top = 368
  end
  object mtFiles: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 592
    Top = 136
    object mtFilesName: TStringField
      DisplayWidth = 35
      FieldName = 'Name'
      Size = 50
    end
    object mtFilesPath: TStringField
      DisplayWidth = 360
      FieldName = 'Path'
      Size = 300
    end
  end
  object dsFiles: TDataSource
    DataSet = mtFiles
    Left = 640
    Top = 136
  end
  object dsGeneralVariables: TDataSource
    DataSet = FDQuery1
    Left = 162
    Top = 429
  end
  object FDConnection1: TFDConnection
    ConnectionName = 'crane'
    Params.Strings = (
      
        'Database=C:\Program Files (x86)\Embarcadero\Studio\17.0\bin\cran' +
        'e.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 283
    Top = 363
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select variable, value from GENERAL;')
    Left = 355
    Top = 363
  end
end
