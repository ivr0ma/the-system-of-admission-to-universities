object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 580
  ClientWidth = 1100
  Color = clBtnFace
  Font.Height = -13
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  RTL = False
  PixelsPerInch = 120
  TextHeight = 16
  object panReg: TUniPanel
    Left = 0
    Top = 0
    Width = 1100
    Height = 19
    BorderStyle = ubsNone
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    TabOrder = 0
    object LabReg: TUniLabel
      Left = 799
      Top = 0
      Width = 277
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1042#1086#1081#1090#1080
      ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TabOrder = 1
      OnClick = LabRegClick
    end
  end
  object PageGontrolMain: TUniPageControl
    Left = 0
    Top = 19
    Width = 1100
    Height = 561
    ActivePage = tabDir
    TabOrder = 1
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    object TABsPRAV: TUniTabSheet
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object PageControlSprav: TUniPageControl
        Left = 0
        Top = 0
        Width = 1092
        Height = 530
        ActivePage = tabSpravSubject
        TabOrder = 0
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        object tabSpravSubject: TUniTabSheet
          Caption = #1055#1088#1077#1076#1084#1077#1090#1099
          object gridSpravSubject: TUniDBGrid
            Left = 0
            Top = 28
            Width = 1084
            Height = 471
            TitleFont.Height = -13
            DataSource = DsSubject
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            WebOptions.LoadMaskMsg = 'Please wait...'
            HeaderTitleAlign = taLeftJustify
            StripeRows = False
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            Font.Color = clBlack
            Font.Height = -13
            ParentFont = False
            TabOrder = 0
            Columns = <
              item
                FieldName = 'subject_id'
                Title.Caption = #1050#1086#1076
                Title.Font.Height = -13
                Width = 60
                Visible = True
                Font.Color = clBlack
                Font.Height = -13
                Alignment = taRightJustify
                ReadOnly = True
                Expanded = False
                Sortable = True
              end
              item
                FieldName = 'subject_name'
                Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1088#1077#1076#1084#1077#1090#1072
                Title.Font.Height = -13
                Width = 200
                Visible = True
                Font.Color = clBlack
                Font.Height = -13
                Expanded = False
                Sortable = True
              end>
          end
          object UniPanel5: TUniPanel
            Left = 0
            Top = 0
            Width = 1084
            Height = 28
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            Color = clBtnFace
            TabOrder = 1
          end
        end
        object tabSpravDirect: TUniTabSheet
          Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103
          object UniDBGrid3: TUniDBGrid
            Left = 0
            Top = 34
            Width = 1084
            Height = 465
            TitleFont.Height = -13
            DataSource = DsDirList
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            WebOptions.LoadMaskMsg = 'Please wait...'
            HeaderTitleAlign = taLeftJustify
            StripeRows = False
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Columns = <
              item
                FieldName = 'direction_list_id'
                Title.Caption = #1050#1086#1076
                Title.Font.Height = -13
                Width = 74
                Visible = True
                Font.Height = -13
                Alignment = taRightJustify
                ReadOnly = True
                Expanded = False
              end
              item
                FieldName = 'direction_name'
                Title.Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' ('#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100')'
                Title.Font.Height = -13
                Width = 500
                Visible = True
                Font.Height = -13
                Expanded = False
              end>
          end
          object UniPanel4: TUniPanel
            Left = 0
            Top = 0
            Width = 1084
            Height = 34
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            Color = clBtnFace
            TabOrder = 1
            object Edirname: TUniEdit
              Left = 402
              Top = 6
              Width = 377
              Height = 19
              PasswordChar = #0
              CharCase = ecNormal
              MaxLength = 0
              CharEOL = #0
              TabOrder = 1
              Color = clWindow
            end
            object UniLabel11: TUniLabel
              Left = 234
              Top = 6
              Width = 162
              Height = 16
              Caption = #1087#1086' '#1085#1072#1079#1074#1072#1085#1080#1102' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103':'
              TabOrder = 2
            end
            object UniButton5: TUniButton
              Left = 993
              Top = 5
              Width = 75
              Height = 25
              Caption = #1085#1072#1081#1090#1080
              TabOrder = 3
              OnClick = UniButton5Click
            end
            object Edircod: TUniEdit
              Left = 192
              Top = 6
              Width = 36
              Height = 19
              PasswordChar = #0
              CharCase = ecNormal
              MaxLength = 0
              CharEOL = #0
              TabOrder = 4
              Color = clWindow
            end
            object UniLabel10: TUniLabel
              Left = 56
              Top = 5
              Width = 130
              Height = 16
              Caption = #1087#1086' '#1082#1086#1076#1091' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103':'
              TabOrder = 5
            end
            object UniLabel9: TUniLabel
              Left = 11
              Top = 5
              Width = 39
              Height = 16
              Caption = #1055#1086#1080#1089#1082':'
              ParentFont = False
              Font.Color = clBlack
              Font.Height = -13
              TabOrder = 6
            end
          end
        end
      end
    end
    object tabVuz: TUniTabSheet
      Caption = ' '#1056#1077#1081#1090#1080#1085#1075' '#1042#1059#1047#1086#1074
      object UniDBGrid2: TUniDBGrid
        Left = 0
        Top = 35
        Width = 1092
        Height = 495
        TitleFont.Height = -13
        DataSource = DsVuzR
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        WebOptions.LoadMaskMsg = 'Please wait...'
        HeaderTitleAlign = taLeftJustify
        StripeRows = False
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Columns = <
          item
            FieldName = 'vuz_id'
            Title.Caption = #1082#1086#1076
            Title.Font.Height = -13
            Width = 30
            Visible = True
            Font.Height = -13
            Alignment = taRightJustify
            ReadOnly = True
            Expanded = False
          end
          item
            FieldName = 'full_name'
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1042#1059#1047#1072
            Title.Font.Height = -13
            Width = 485
            Visible = True
            Font.Height = -13
            Expanded = False
          end
          item
            FieldName = 'vuz_top'
            Title.Caption = #1056#1077#1081#1090#1080#1085#1075
            Title.Font.Height = -13
            Width = 60
            Visible = True
            Font.Height = -13
            Alignment = taRightJustify
            Expanded = False
          end
          item
            FieldName = 'hostel'
            Title.Caption = #1054#1073#1097#1077#1078#1080#1090#1080#1077
            Title.Font.Height = -13
            Width = 83
            Visible = True
            Font.Height = -13
            Expanded = False
          end
          item
            FieldName = 'short_name'
            Title.Caption = 'short_name'
            Title.Font.Height = -13
            Width = -1
            Visible = False
            Font.Height = -13
            Expanded = False
          end
          item
            FieldName = 'golden_medal'
            Title.Caption = #1047#1086#1083#1086#1090#1072#1103' '#1084#1077#1076#1072#1083#1100
            Title.Font.Height = -13
            Width = 107
            Visible = True
            Font.Height = -13
            Alignment = taRightJustify
            Expanded = False
          end
          item
            FieldName = 'GTO'
            Title.Caption = #1047#1085#1072#1095#1086#1082' '#1043#1058#1054
            Title.Font.Height = -13
            Width = 82
            Visible = True
            Font.Height = -13
            Alignment = taRightJustify
            Expanded = False
          end
          item
            FieldName = 'voluntering'
            Title.Caption = #1042#1086#1083#1086#1085#1090#1077#1088#1089#1090#1074#1086
            Title.Font.Height = -13
            Width = 93
            Visible = True
            Font.Height = -13
            Alignment = taRightJustify
            Expanded = False
          end
          item
            FieldName = 'final_essay'
            Title.Caption = #1048#1090#1086#1075#1086#1074#1086#1077' '#1089#1086#1095#1080#1085#1077#1085#1080#1077
            Title.Font.Height = -13
            Width = 132
            Visible = True
            Font.Height = -13
            Alignment = taRightJustify
            Expanded = False
          end>
      end
      object UniPanel2: TUniPanel
        Left = 0
        Top = 0
        Width = 1092
        Height = 35
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        TabOrder = 1
        object UniLabel6: TUniLabel
          Left = 11
          Top = 5
          Width = 39
          Height = 16
          Caption = #1055#1086#1080#1089#1082':'
          TabOrder = 1
        end
        object UniLabel7: TUniLabel
          Left = 56
          Top = 5
          Width = 81
          Height = 16
          Caption = #1087#1086' '#1082#1086#1076#1091' '#1042#1059#1047#1072':'
          TabOrder = 2
        end
        object Ecode: TUniEdit
          Left = 143
          Top = 4
          Width = 36
          Height = 18
          PasswordChar = #0
          CharCase = ecNormal
          MaxLength = 0
          CharEOL = #0
          TabOrder = 3
          Color = clWindow
        end
        object UniLabel8: TUniLabel
          Left = 185
          Top = 5
          Width = 113
          Height = 16
          Caption = #1087#1086' '#1085#1072#1079#1074#1072#1085#1080#1102' '#1042#1059#1047#1072':'
          TabOrder = 4
        end
        object Ename: TUniEdit
          Left = 304
          Top = 4
          Width = 377
          Height = 18
          PasswordChar = #0
          CharCase = ecNormal
          MaxLength = 0
          CharEOL = #0
          TabOrder = 5
          Color = clWindow
        end
        object UniButton4: TUniButton
          Left = 981
          Top = 4
          Width = 75
          Height = 22
          Caption = #1085#1072#1081#1090#1080
          TabOrder = 6
          OnClick = UniButton4Click
        end
      end
    end
    object tabDir: TUniTabSheet
      Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103
      object UniPanel14: TUniPanel
        Left = 0
        Top = 0
        Width = 1092
        Height = 409
        Caption = 'UniPanel14'
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        TabOrder = 0
        object UniPanel15: TUniPanel
          Left = 1
          Top = 1
          Width = 424
          Height = 407
          Caption = 'UniPanel15'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          Color = clBtnFace
          TabOrder = 1
          object UniPanel16: TUniPanel
            Left = 1
            Top = 1
            Width = 422
            Height = 33
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            Color = clBtnFace
            TabOrder = 1
            object UniButton3: TUniButton
              Left = 366
              Top = 3
              Width = 49
              Height = 25
              Caption = #1053#1072#1081#1090#1080
              TabOrder = 1
              OnClick = UniButton3Click
            end
            object UniLabel3: TUniLabel
              Left = 13
              Top = 7
              Width = 132
              Height = 16
              Caption = #1055#1086#1080#1089#1082':  '#1087#1086' '#1082#1086#1076#1091' '#1042#1059#1047#1072': '
              TabOrder = 2
            end
            object UeCodVuz: TUniEdit
              Left = 145
              Top = 5
              Width = 49
              Height = 19
              PasswordChar = #0
              CharCase = ecNormal
              MaxLength = 0
              CharEOL = #0
              TabOrder = 3
              Color = clWindow
            end
          end
          object UniDBGrid7: TUniDBGrid
            Left = 1
            Top = 33
            Width = 422
            Height = 374
            TitleFont.Height = -13
            DataSource = DsVuz
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            WebOptions.Paged = False
            WebOptions.LoadMaskMsg = 'Please wait...'
            HeaderTitleAlign = taLeftJustify
            OnAjaxEvent = UniDBGrid7AjaxEvent
            StripeRows = False
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 2
            Columns = <
              item
                FieldName = 'vuz_id'
                Title.Caption = ' '#1050#1086#1076
                Title.Font.Height = -13
                Width = 35
                Visible = True
                Font.Height = -13
                Alignment = taRightJustify
                ReadOnly = True
                Expanded = False
              end
              item
                FieldName = 'full_name'
                Title.Caption = ' '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1042#1059#1047#1072
                Title.Font.Height = -13
                Width = 360
                Visible = True
                Font.Height = -13
                Expanded = False
              end>
          end
        end
        object UniPanel17: TUniPanel
          Left = 424
          Top = 1
          Width = 370
          Height = 407
          Caption = 'UniPanel17'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          Color = clBtnFace
          TabOrder = 2
          object UniPanel18: TUniPanel
            Left = 1
            Top = 1
            Width = 368
            Height = 33
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            Color = clBtnFace
            TabOrder = 1
            object UniLabel1: TUniLabel
              Left = 7
              Top = 6
              Width = 173
              Height = 16
              Caption = #1055#1086#1080#1089#1082':  '#1087#1086' '#1082#1086#1076#1091' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1072': '
              TabOrder = 1
            end
            object Uecodefac: TUniEdit
              Left = 179
              Top = 5
              Width = 49
              Height = 20
              PasswordChar = #0
              CharCase = ecNormal
              MaxLength = 0
              CharEOL = #0
              TabOrder = 2
              Color = clWindow
            end
            object UniButton6: TUniButton
              Left = 312
              Top = 3
              Width = 51
              Height = 25
              Caption = #1053#1072#1081#1090#1080
              TabOrder = 3
              OnClick = UniButton6Click
            end
          end
          object UniDBGrid8: TUniDBGrid
            Left = 1
            Top = 33
            Width = 368
            Height = 374
            TitleFont.Height = -13
            DataSource = DsFacult
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            WebOptions.Paged = False
            WebOptions.LoadMaskMsg = 'Please wait...'
            HeaderTitleAlign = taLeftJustify
            OnAjaxEvent = UniDBGrid8AjaxEvent
            StripeRows = False
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 2
            Columns = <
              item
                FieldName = 'faculties_id'
                Title.Caption = ' '#1050#1086#1076
                Title.Font.Height = -13
                Width = 35
                Visible = True
                Font.Height = -13
                Alignment = taRightJustify
                ReadOnly = True
                Expanded = False
              end
              item
                FieldName = 'name_faculties'
                Title.Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090
                Title.Font.Height = -13
                Width = 310
                Visible = True
                Font.Height = -13
                Expanded = False
              end>
          end
        end
        object UniPanel19: TUniPanel
          Left = 794
          Top = 1
          Width = 298
          Height = 407
          Caption = 'UniPanel19'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clBtnFace
          TabOrder = 3
          object UniDBGrid9: TUniDBGrid
            Left = 1
            Top = 33
            Width = 296
            Height = 211
            TitleFont.Height = -13
            DataSource = DsDirect
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            WebOptions.Paged = False
            WebOptions.LoadMaskMsg = 'Please wait...'
            HeaderTitleAlign = taLeftJustify
            OnAjaxEvent = UniDBGrid9AjaxEvent
            StripeRows = False
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            Columns = <
              item
                FieldName = 'direction_name'
                Title.Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' ('#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100')'
                Title.Font.Height = -13
                Width = 280
                Visible = True
                Font.Height = -13
                Expanded = False
              end>
          end
          object UniDBGrid1: TUniDBGrid
            Left = 1
            Top = 244
            Width = 296
            Height = 163
            TitleFont.Height = -13
            DataSource = DsDirSub
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            WebOptions.Paged = False
            WebOptions.LoadMaskMsg = 'Please wait...'
            HeaderTitleAlign = taLeftJustify
            StripeRows = False
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 2
            Columns = <
              item
                FieldName = 'direct_subject_id'
                Title.Caption = 'direct_subject_id'
                Title.Font.Height = -13
                Width = -1
                Visible = False
                Font.Height = -13
                Alignment = taRightJustify
                ReadOnly = True
                Expanded = False
              end
              item
                FieldName = 'direction_id'
                Title.Caption = #1050#1086#1076' '#1085#1072#1087#1088#1074#1083#1077#1085#1080#1103
                Title.Font.Height = -13
                Width = 110
                Visible = True
                Font.Height = -13
                Alignment = taRightJustify
                Expanded = False
              end
              item
                FieldName = 'subject_id'
                Title.Caption = 'subject_id'
                Title.Font.Height = -13
                Width = -1
                Visible = False
                Font.Height = -13
                Alignment = taRightJustify
                Expanded = False
              end
              item
                FieldName = 'LSubName'
                Title.Caption = ' '#1055#1088#1077#1076#1084#1077#1090' '#1045#1043#1069
                Title.Font.Height = -13
                Width = 144
                Visible = True
                Font.Height = -13
                Expanded = False
              end>
          end
          object UniPanel3: TUniPanel
            Left = 1
            Top = 1
            Width = 296
            Height = 33
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            Color = clBtnFace
            TabOrder = 3
            object UniLabel15: TUniLabel
              Left = 5
              Top = 4
              Width = 177
              Height = 16
              Caption = #1055#1086#1080#1089#1082': '#1087#1086' '#1082#1086#1076#1091' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103': '
              TabOrder = 1
            end
            object UecodeDir: TUniEdit
              Left = 181
              Top = 4
              Width = 49
              Height = 19
              PasswordChar = #0
              CharCase = ecNormal
              MaxLength = 0
              CharEOL = #0
              TabOrder = 2
              Color = clWindow
            end
            object UniButton7: TUniButton
              Left = 236
              Top = 3
              Width = 54
              Height = 25
              Caption = #1053#1072#1081#1090#1080
              TabOrder = 3
              OnClick = UniButton7Click
            end
          end
        end
      end
      object UniPanel21: TUniPanel
        Left = 0
        Top = 409
        Width = 1092
        Height = 121
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clBtnFace
        TabOrder = 1
        object UniPanel1: TUniPanel
          Left = 1
          Top = 1
          Width = 1090
          Height = 119
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clBtnFace
          TabOrder = 1
          object UlPos: TUniLabel
            Left = 3
            Top = 10
            Width = 4
            Height = 16
            TabOrder = 1
          end
        end
      end
    end
    object tabAbit: TUniTabSheet
      Caption = #1040#1073#1080#1090#1091#1088#1080#1077#1085#1090#1099
      object UniDBGrid4: TUniDBGrid
        Left = 0
        Top = 35
        Width = 1092
        Height = 495
        TitleFont.Height = -13
        DataSource = DsAbitur
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        WebOptions.LoadMaskMsg = 'Please wait...'
        HeaderTitleAlign = taLeftJustify
        StripeRows = False
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Columns = <
          item
            FieldName = 'student_id'
            Title.Caption = 'ID'
            Title.Font.Height = -13
            Width = 45
            Visible = True
            Font.Height = -13
            Alignment = taRightJustify
            ReadOnly = True
            Expanded = False
          end
          item
            FieldName = 'student_name'
            Title.Caption = #1060#1048#1054' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072
            Title.Font.Height = -13
            Width = 132
            Visible = True
            Font.Height = -13
            Expanded = False
          end
          item
            FieldName = 'golden_medal'
            Title.Caption = #1047#1086#1083#1086#1090#1072#1103' '#1084#1077#1076#1072#1083#1100
            Title.Font.Height = -13
            Width = 99
            Visible = True
            Font.Height = -13
            Expanded = False
          end
          item
            FieldName = 'GTO'
            Title.Caption = #1043#1058#1054
            Title.Font.Height = -13
            Width = 80
            Visible = True
            Font.Height = -13
            Expanded = False
          end
          item
            FieldName = 'voluntering'
            Title.Caption = #1042#1086#1083#1086#1085#1090#1077#1088#1089#1090#1074#1086
            Title.Font.Height = -13
            Width = 90
            Visible = True
            Font.Height = -13
            Expanded = False
          end
          item
            FieldName = 'final_essay'
            Title.Caption = #1057#1086#1095#1080#1085#1077#1085#1080#1077
            Title.Font.Height = -13
            Width = 80
            Visible = True
            Font.Height = -13
            Expanded = False
          end>
      end
      object UniPanel13: TUniPanel
        Left = 0
        Top = 0
        Width = 1092
        Height = 35
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        TabOrder = 1
        object UniButton2: TUniButton
          Left = 1009
          Top = 4
          Width = 75
          Height = 25
          Caption = #1085#1072#1081#1090#1080
          TabOrder = 1
          OnClick = UniButton2Click
        end
        object UniLabel4: TUniLabel
          Left = 11
          Top = 5
          Width = 39
          Height = 16
          Caption = #1055#1086#1080#1089#1082':'
          TabOrder = 2
        end
        object UniLabel5: TUniLabel
          Left = 56
          Top = 5
          Width = 113
          Height = 16
          Caption = #1087#1086' ID '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072':'
          TabOrder = 3
        end
        object Estucode: TUniEdit
          Left = 172
          Top = 3
          Width = 36
          Height = 20
          PasswordChar = #0
          CharCase = ecNormal
          MaxLength = 0
          CharEOL = #0
          TabOrder = 4
          Color = clWindow
        end
        object UniLabel12: TUniLabel
          Left = 220
          Top = 5
          Width = 128
          Height = 16
          Caption = #1087#1086' '#1060#1048#1054' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072':'
          TabOrder = 5
        end
        object Estuname: TUniEdit
          Left = 354
          Top = 3
          Width = 377
          Height = 20
          PasswordChar = #0
          CharCase = ecNormal
          MaxLength = 0
          CharEOL = #0
          TabOrder = 6
          Color = clWindow
        end
      end
    end
    object tabAuto: TUniTabSheet
      Caption = #1050#1086#1085#1082#1091#1088#1089#1085#1099#1077' '#1089#1087#1080#1089#1082#1080
      object UniPanel11: TUniPanel
        Left = 0
        Top = 0
        Width = 1092
        Height = 35
        BorderStyle = ubsFrameLowered
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        TabOrder = 0
        object UniButton1: TUniButton
          Left = 1009
          Top = 4
          Width = 75
          Height = 25
          Caption = #1085#1072#1081#1090#1080
          TabOrder = 1
          OnClick = UniButton1Click
        end
        object UniLabel2: TUniLabel
          Left = 11
          Top = 5
          Width = 39
          Height = 16
          Caption = #1055#1086#1080#1089#1082':'
          TabOrder = 2
        end
        object UniLabel13: TUniLabel
          Left = 56
          Top = 5
          Width = 113
          Height = 16
          Caption = #1087#1086' ID '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072':'
          TabOrder = 3
        end
        object Estucode2: TUniEdit
          Left = 175
          Top = 4
          Width = 36
          Height = 20
          PasswordChar = #0
          CharCase = ecNormal
          MaxLength = 0
          CharEOL = #0
          TabOrder = 4
          Color = clWindow
        end
        object UniLabel14: TUniLabel
          Left = 220
          Top = 5
          Width = 128
          Height = 16
          Caption = #1087#1086' '#1060#1048#1054' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072':'
          TabOrder = 5
        end
        object Estuname2: TUniEdit
          Left = 354
          Top = 4
          Width = 247
          Height = 20
          PasswordChar = #0
          CharCase = ecNormal
          MaxLength = 0
          CharEOL = #0
          TabOrder = 6
          Color = clWindow
        end
      end
      object UniPanel12: TUniPanel
        Left = 0
        Top = 489
        Width = 1092
        Height = 41
        BorderStyle = ubsFrameLowered
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        Color = clBtnFace
        TabOrder = 1
      end
      object UniDBGrid5: TUniDBGrid
        Left = 0
        Top = 35
        Width = 1092
        Height = 454
        TitleFont.Height = -13
        DataSource = DsRaspred
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        WebOptions.LoadMaskMsg = 'Please wait...'
        HeaderTitleAlign = taLeftJustify
        StripeRows = False
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 2
        Columns = <
          item
            FieldName = 'main_result_id'
            Title.Caption = 'ID'
            Title.Font.Height = -13
            Width = 37
            Visible = True
            Font.Height = -13
            Alignment = taRightJustify
            ReadOnly = True
            Expanded = False
          end
          item
            FieldName = 'direction_id'
            Title.Caption = 'direction_id'
            Title.Font.Height = -13
            Width = -1
            Visible = False
            Font.Height = -13
            Alignment = taRightJustify
            Expanded = False
          end
          item
            FieldName = 'student_id'
            Title.Caption = 'ID '#1072#1073#1080#1090'.'
            Title.Font.Height = -13
            Width = 61
            Visible = True
            Font.Height = -13
            Alignment = taRightJustify
            Expanded = False
          end
          item
            FieldName = 'number_of_wish'
            Title.Caption = 'number_of_wish'
            Title.Font.Height = -13
            Width = -1
            Visible = False
            Font.Height = -13
            Alignment = taRightJustify
            Expanded = False
          end
          item
            FieldName = 'count_of_points'
            Title.Caption = 'count_of_points'
            Title.Font.Height = -13
            Width = -1
            Visible = False
            Font.Height = -13
            Alignment = taRightJustify
            Expanded = False
          end
          item
            FieldName = 'count_add_points'
            Title.Caption = 'count_add_points'
            Title.Font.Height = -13
            Width = -1
            Visible = False
            Font.Height = -13
            Alignment = taRightJustify
            Expanded = False
          end
          item
            FieldName = 'count_all_points'
            Title.Caption = #1041#1072#1083#1083
            Title.Font.Height = -13
            Width = 57
            Visible = True
            Font.Height = -13
            Alignment = taRightJustify
            Expanded = False
          end
          item
            FieldName = 'serial_number'
            Title.Caption = #1053#1086#1084#1077#1088' '#1074' '#1089#1087#1080#1089#1082#1077
            Title.Font.Height = -13
            Width = 105
            Visible = True
            Font.Height = -13
            Alignment = taRightJustify
            Expanded = False
          end
          item
            FieldName = 'count_budget_places'
            Title.Caption = #1041#1102#1076#1078'.'#1084#1077#1089#1090
            Title.Font.Height = -13
            Width = 77
            Visible = True
            Font.Height = -13
            Alignment = taRightJustify
            Expanded = False
          end
          item
            FieldName = 'status_id'
            Title.Caption = 'status_id'
            Title.Font.Height = -13
            Width = -1
            Visible = False
            Font.Height = -13
            Alignment = taRightJustify
            Expanded = False
          end
          item
            FieldName = 'student_name'
            Title.Caption = #1060#1048#1054' '#1072#1073#1080#1090'.'
            Title.Font.Height = -13
            Width = 107
            Visible = True
            Font.Height = -13
            Expanded = False
          end
          item
            FieldName = 'full_name'
            Title.Caption = #1042#1059#1047
            Title.Font.Height = -13
            Width = 90
            Visible = True
            Font.Height = -13
            Expanded = False
          end
          item
            FieldName = 'name_faculties'
            Title.Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090
            Title.Font.Height = -13
            Width = 90
            Visible = True
            Font.Height = -13
            Expanded = False
          end
          item
            FieldName = 'direction_name'
            Title.Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
            Title.Font.Height = -13
            Width = 90
            Visible = True
            Font.Height = -13
            Expanded = False
          end
          item
            FieldName = 'faculties_id'
            Title.Caption = 'faculties_id'
            Title.Font.Height = -13
            Width = -1
            Visible = False
            Font.Height = -13
            Alignment = taRightJustify
            ReadOnly = True
            Expanded = False
          end
          item
            FieldName = 'vuz_id'
            Title.Caption = 'vuz_id'
            Title.Font.Height = -13
            Width = -1
            Visible = False
            Font.Height = -13
            Alignment = taRightJustify
            ReadOnly = True
            Expanded = False
          end>
      end
    end
    object tabAdmin: TUniTabSheet
      TabVisible = False
      Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088
      object UniDBGrid6: TUniDBGrid
        Left = 0
        Top = 0
        Width = 1092
        Height = 530
        TitleFont.Height = -13
        DataSource = DsUsers
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        WebOptions.LoadMaskMsg = 'Please wait...'
        HeaderTitleAlign = taLeftJustify
        StripeRows = False
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Columns = <
          item
            FieldName = 'user_id'
            Title.Caption = 'user_id'
            Title.Font.Height = -13
            Width = 60
            Visible = True
            Font.Height = -13
            Alignment = taRightJustify
            ReadOnly = True
            Expanded = False
          end
          item
            FieldName = 'user_name'
            Title.Caption = 'user_name'
            Title.Font.Height = -13
            Width = 80
            Visible = True
            Font.Height = -13
            Expanded = False
          end
          item
            FieldName = 'user_surname'
            Title.Caption = 'user_surname'
            Title.Font.Height = -13
            Width = 100
            Visible = True
            Font.Height = -13
            Expanded = False
          end
          item
            FieldName = 'user_patronymic'
            Title.Caption = 'user_patronymic'
            Title.Font.Height = -13
            Width = 120
            Visible = True
            Font.Height = -13
            Expanded = False
          end
          item
            FieldName = 'user_login'
            Title.Caption = 'user_login'
            Title.Font.Height = -13
            Width = 90
            Visible = True
            Font.Height = -13
            Expanded = False
          end
          item
            FieldName = 'user_pasword'
            Title.Caption = 'user_pasword'
            Title.Font.Height = -13
            Width = 90
            Visible = True
            Font.Height = -13
            Expanded = False
          end
          item
            FieldName = 'email'
            Title.Caption = 'email'
            Title.Font.Height = -13
            Width = 150
            Visible = True
            Font.Height = -13
            Expanded = False
          end
          item
            FieldName = 'phone'
            Title.Caption = 'phone'
            Title.Font.Height = -13
            Width = 90
            Visible = True
            Font.Height = -13
            Expanded = False
          end
          item
            FieldName = 'user_role'
            Title.Caption = 'user_role'
            Title.Font.Height = -13
            Width = 70
            Visible = True
            Font.Height = -13
            Expanded = False
          end>
      end
    end
  end
  object AConMain: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=1415;Persist Security Info=True;Use' +
      'r ID=sa;Initial Catalog=SDS;Data Source=ROMA\SQLROMA8'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 128
  end
  object ASetWork: TADODataSet
    Connection = AConMain
    Parameters = <>
    Left = 64
    Top = 128
  end
  object DsDirList: TDataSource
    DataSet = ASetDirList
    Left = 168
    Top = 192
  end
  object ASetDirList: TADODataSet
    Active = True
    Connection = AConMain
    CursorType = ctStatic
    CommandText = 'select * from direction_list'
    DataSource = DsFacult
    Parameters = <>
    Left = 232
    Top = 192
  end
  object ASetSubject: TADODataSet
    Active = True
    Connection = AConMain
    CursorType = ctStatic
    CommandText = 'select * from Subjects'
    Parameters = <>
    Left = 232
    Top = 248
  end
  object DsSubject: TDataSource
    DataSet = ASetSubject
    Left = 168
    Top = 248
  end
  object AVuz: TADODataSet
    Active = True
    Connection = AConMain
    CursorType = ctStatic
    CommandText = 
      'SELECT distinct vuz.vuz_id, vuz.full_name'#13#10'  FROM vuz'#13#10'  left jo' +
      'in faculties on vuz.vuz_id = faculties.vuz_id'#13#10'  where faculties' +
      '.faculties_id is not null and vuz.vuz_top is not null'
    Parameters = <>
    Left = 512
    Top = 64
  end
  object DsVuz: TDataSource
    DataSet = AVuz
    Left = 472
    Top = 64
  end
  object AFacult: TADODataSet
    Active = True
    Connection = AConMain
    CursorType = ctStatic
    CommandText = 'select * from faculties'
    DataSource = DsVuz
    IndexFieldNames = 'vuz_id'
    MasterFields = 'vuz_id'
    Parameters = <>
    Left = 536
    Top = 128
  end
  object DsFacult: TDataSource
    DataSet = AFacult
    Left = 464
    Top = 136
  end
  object ADirect: TADODataSet
    Active = True
    Connection = AConMain
    CursorType = ctStatic
    CommandText = 
      'select DR.direction_id , DR.faculties_id, dl.direction_name'#13#10'fro' +
      'm direction DR'#13#10'left join direction_list DL on DR.direction_list' +
      '_id =DL.direction_list_id'
    DataSource = DsFacult
    IndexFieldNames = 'faculties_id'
    MasterFields = 'faculties_id'
    Parameters = <>
    Left = 512
    Top = 176
  end
  object DsDirect: TDataSource
    DataSet = ADirect
    Left = 472
    Top = 176
  end
  object ADirSub: TADODataSet
    Active = True
    Connection = AConMain
    CursorType = ctStatic
    CommandText = 
      #13#10'select *'#13#10'from direct_subject DS'#13#10'left join Subjects SB on SB.' +
      'subject_id = DS.subject_id'
    DataSource = DsDirect
    IndexFieldNames = 'direction_id'
    MasterFields = 'direction_id'
    Parameters = <>
    Left = 80
    Top = 384
    object ADirSubdirect_subject_id: TAutoIncField
      FieldName = 'direct_subject_id'
      ReadOnly = True
    end
    object ADirSubdirection_id: TIntegerField
      FieldName = 'direction_id'
    end
    object ADirSubsubject_id: TIntegerField
      FieldName = 'subject_id'
    end
    object ADirSubLSubName: TStringField
      FieldKind = fkLookup
      FieldName = 'LSubName'
      LookupDataSet = ASetSubject
      LookupKeyFields = 'subject_id'
      LookupResultField = 'subject_name'
      KeyFields = 'subject_id'
      Lookup = True
    end
  end
  object DsDirSub: TDataSource
    DataSet = ADirSub
    Left = 24
    Top = 384
  end
  object DsAbitur: TDataSource
    DataSet = AAbitur
    Left = 176
    Top = 304
  end
  object AAbitur: TADODataSet
    Active = True
    Connection = AConMain
    CursorType = ctStatic
    CommandText = 'select * from student'
    Parameters = <>
    Left = 232
    Top = 304
  end
  object DsRaspred: TDataSource
    DataSet = ARaspred
    Left = 176
    Top = 384
  end
  object ARaspred: TADODataSet
    Active = True
    Connection = AConMain
    CursorType = ctStatic
    CommandText = 
      #13#10'select '#13#10#9'MN.*'#13#10#9',ST.student_name'#13#10#9',DL.direction_name'#13#10#9',F.fa' +
      'culties_id'#13#10#9',F.name_faculties'#13#10#9',VZ.vuz_id'#13#10#9',VZ.full_name'#13#10'fro' +
      'm main_result MN'#13#10'left join student ST on ST.student_id = MN.stu' +
      'dent_id'#13#10'left join direction DR on MN.direction_id = DR.directio' +
      'n_id'#13#10'Left join direction_list DL on DL.direction_list_id = DR.d' +
      'irection_list_id'#13#10'left join faculties F on F.faculties_id = DR.f' +
      'aculties_id'#13#10'left join vuz VZ on VZ.vuz_id = F.vuz_id'#13#10'where ser' +
      'ial_number<= MN.count_budget_places'#13#10'order by ST.student_name, V' +
      'Z.full_name, F.name_faculties, DL.direction_name, MN.count_all_p' +
      'oints desc'#13#10#13#10#13#10
    Parameters = <>
    Left = 240
    Top = 384
  end
  object ASetUsers: TADODataSet
    Active = True
    Connection = AConMain
    CursorType = ctStatic
    CommandText = 'select * from users'
    Parameters = <>
    Left = 232
    Top = 128
  end
  object DsUsers: TDataSource
    DataSet = ASetUsers
    Left = 160
    Top = 128
  end
  object AsetVuzR: TADODataSet
    Active = True
    Connection = AConMain
    CursorType = ctStatic
    CommandText = 
      'SELECT *'#13#10'  FROM vuz'#13#10'  where vuz_top is not Null'#13#10'  order by vu' +
      'z_top'
    Parameters = <>
    Left = 664
    Top = 104
  end
  object DsVuzR: TDataSource
    DataSet = AsetVuzR
    Left = 720
    Top = 104
  end
end
