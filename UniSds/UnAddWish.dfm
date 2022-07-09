object FAddWish: TFAddWish
  Left = 0
  Top = 0
  ClientHeight = 453
  ClientWidth = 732
  Color = clBtnFace
  Font.Height = -13
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  RTL = False
  PixelsPerInch = 120
  TextHeight = 16
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 732
    Height = 453
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clBtnFace
    TabOrder = 0
    object UniPanel2: TUniPanel
      Left = 1
      Top = 1
      Width = 730
      Height = 56
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      TabOrder = 1
    end
    object UniPanel3: TUniPanel
      Left = 1
      Top = 408
      Width = 730
      Height = 45
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      Color = clBtnFace
      TabOrder = 2
      object UbEnd: TUniButton
        Left = 640
        Top = 6
        Width = 75
        Height = 25
        Caption = #1042#1099#1093#1086#1076
        TabOrder = 1
        OnClick = UbEndClick
      end
    end
    object UniPageControl1: TUniPageControl
      Left = 1
      Top = 56
      Width = 730
      Height = 352
      ActivePage = UniTabSheet3
      TabOrder = 3
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      object UniTabSheet1: TUniTabSheet
        Caption = #1044#1086#1089#1090#1080#1078#1077#1085#1080#1103
        object UniPanel5: TUniPanel
          Left = 0
          Top = 0
          Width = 722
          Height = 33
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          Color = clBtnFace
          TabOrder = 0
          object CbZm: TUniCheckBox
            Left = 103
            Top = 7
            Width = 113
            Height = 17
            Checked = False
            Caption = #1047#1086#1083#1086#1090#1072#1103' '#1084#1077#1076#1072#1083#1100
            TabOrder = 1
          end
          object CbG: TUniCheckBox
            Left = 222
            Top = 7
            Width = 90
            Height = 17
            Checked = False
            Caption = #1047#1085#1072#1095#1086#1082' '#1043#1058#1054
            TabOrder = 2
          end
          object CbV: TUniCheckBox
            Left = 318
            Top = 7
            Width = 100
            Height = 16
            Checked = False
            Caption = #1042#1086#1083#1086#1085#1090#1077#1088#1089#1090#1074#1086
            TabOrder = 3
          end
          object CbIs: TUniCheckBox
            Left = 424
            Top = 7
            Width = 141
            Height = 17
            Checked = False
            Caption = #1048#1090#1086#1075#1086#1074#1086#1077' '#1089#1086#1095#1080#1085#1077#1085#1080#1077
            TabOrder = 4
          end
          object UniButton4: TUniButton
            Left = 644
            Top = 3
            Width = 75
            Height = 25
            Caption = #1048#1079#1084#1077#1085#1080#1090#1100
            TabOrder = 5
            OnClick = UniButton4Click
          end
          object UniLabel3: TUniLabel
            Left = 19
            Top = 7
            Width = 78
            Height = 16
            Caption = #1044#1086#1089#1090#1080#1078#1077#1085#1080#1103':'
            TabOrder = 6
          end
        end
        object UniDBGrid2: TUniDBGrid
          Left = 0
          Top = 33
          Width = 722
          Height = 288
          TitleFont.Height = -13
          DataSource = DsStudA
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          WebOptions.LoadMaskMsg = 'Please wait...'
          HeaderTitleAlign = taLeftJustify
          StripeRows = False
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Columns = <
            item
              FieldName = 'student_id'
              Title.Caption = 'ID'
              Title.Font.Height = -13
              Width = 70
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
              Width = 250
              Visible = True
              Font.Height = -13
              Expanded = False
            end
            item
              FieldName = 'golden_medal'
              Title.Caption = #1047#1086#1083#1086#1090#1072#1103' '#1084#1077#1076#1072#1083#1100
              Title.Font.Height = -13
              Width = 105
              Visible = True
              Font.Height = -13
              Expanded = False
            end
            item
              FieldName = 'GTO'
              Title.Caption = #1047#1085#1072#1095#1086#1082' '#1043#1058#1054
              Title.Font.Height = -13
              Width = 78
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
              Title.Caption = #1048#1090#1086#1075#1086#1074#1086#1077' '#1089#1086#1095#1080#1085#1077#1085#1080#1077
              Title.Font.Height = -13
              Width = 129
              Visible = True
              Font.Height = -13
              Expanded = False
            end
            item
              FieldName = 'user0_id'
              Title.Caption = 'user0_id'
              Title.Font.Height = -13
              Width = -1
              Visible = False
              Font.Height = -13
              Alignment = taRightJustify
              Expanded = False
            end>
        end
      end
      object UniTabSheet2: TUniTabSheet
        Caption = #1055#1088#1077#1076#1084#1077#1090#1099
        object UniPanel6: TUniPanel
          Left = 0
          Top = 0
          Width = 722
          Height = 33
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          Color = clBtnFace
          TabOrder = 0
          object UniButton1: TUniButton
            Left = 544
            Top = 3
            Width = 75
            Height = 25
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100
            TabOrder = 1
            OnClick = UniButton1Click
          end
          object UniButton2: TUniButton
            Left = 644
            Top = 3
            Width = 75
            Height = 25
            Caption = #1059#1076#1072#1083#1080#1090#1100
            TabOrder = 2
            OnClick = UniButton2Click
          end
          object CboxSub: TUniComboBox
            Left = 80
            Top = 3
            Width = 145
            Height = 24
            Style = csDropDown
            MaxLength = 0
            Items.Strings = (
              #1048#1085'. '#1103#1079
              #1041#1080#1086#1083#1086#1075
              #1061#1080#1084#1080#1103
              #1052#1072#1090#1077#1084
              #1056#1091#1089'. '#1103#1079
              #1060#1080#1079#1080#1082#1072
              #1048#1089#1090#1086#1088
              #1051#1080#1090#1077#1088
              #1043#1077#1086#1075#1088
              #1054#1073#1097#1077#1089#1090
              #1048#1085#1092#1086#1088#1084)
            ItemIndex = -1
            TabOrder = 3
            RemoteQuery = False
            CharCase = ecNormal
          end
          object ESub: TUniEdit
            Left = 336
            Top = 3
            Width = 73
            Height = 24
            PasswordChar = #0
            CharCase = ecNormal
            MaxLength = 0
            CharEOL = #0
            TabOrder = 4
            Color = clWindow
          end
          object UniLabel1: TUniLabel
            Left = 19
            Top = 4
            Width = 55
            Height = 16
            Caption = #1055#1088#1077#1076#1084#1077#1090':'
            TabOrder = 5
          end
          object UniLabel2: TUniLabel
            Left = 296
            Top = 4
            Width = 34
            Height = 16
            Caption = #1041#1072#1083#1083':'
            TabOrder = 6
          end
        end
        object UniDBGrid3: TUniDBGrid
          Left = 0
          Top = 33
          Width = 722
          Height = 288
          TitleFont.Height = -13
          DataSource = DsSub
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ReadOnly = True
          WebOptions.LoadMaskMsg = 'Please wait...'
          HeaderTitleAlign = taLeftJustify
          StripeRows = False
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Columns = <
            item
              FieldName = 'student_name'
              Title.Caption = #1060#1048#1054' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072
              Title.Font.Height = -13
              Width = 300
              Visible = True
              Font.Height = -13
              Expanded = False
            end
            item
              FieldName = 'user0_id'
              Title.Caption = 'user0_id'
              Title.Font.Height = -13
              Width = -1
              Visible = False
              Font.Height = -13
              Alignment = taRightJustify
              Expanded = False
            end
            item
              FieldName = 'subject_id'
              Title.Caption = #1050#1086#1076' '#1087#1088#1077#1076#1084#1077#1090#1072
              Title.Font.Height = -13
              Width = 92
              Visible = True
              Font.Height = -13
              Alignment = taRightJustify
              ReadOnly = True
              Expanded = False
            end
            item
              FieldName = 'subject_name'
              Title.Caption = #1055#1088#1077#1076#1084#1077#1090
              Title.Font.Height = -13
              Width = 100
              Visible = True
              Font.Height = -13
              Expanded = False
            end
            item
              FieldName = 'count_of_points'
              Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1073#1072#1083#1083#1086#1074
              Title.Font.Height = -13
              Width = 125
              Visible = True
              Font.Height = -13
              Alignment = taRightJustify
              Expanded = False
            end>
        end
      end
      object UniTabSheet3: TUniTabSheet
        Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object UniDBGrid1: TUniDBGrid
          Left = 0
          Top = 99
          Width = 722
          Height = 222
          TitleFont.Height = -13
          DataSource = DsWishA
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          WebOptions.LoadMaskMsg = 'Please wait...'
          HeaderTitleAlign = taLeftJustify
          StripeRows = False
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Columns = <
            item
              FieldName = 'full_name'
              Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1042#1059#1047#1072
              Title.Font.Height = -13
              Width = 130
              Visible = True
              Font.Color = clBlack
              Font.Height = -10
              Expanded = False
            end
            item
              FieldName = 'name_faculties'
              Title.Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090
              Title.Font.Height = -13
              Width = 140
              Visible = True
              Font.Color = clBlack
              Font.Height = -10
              Expanded = False
            end
            item
              FieldName = 'direction_name'
              Title.Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
              Title.Font.Height = -13
              Width = 170
              Visible = True
              Font.Color = clBlack
              Font.Height = -10
              Expanded = False
            end
            item
              FieldName = 'student_name'
              Title.Caption = #1060#1048#1054' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072
              Title.Font.Height = -13
              Width = 200
              Visible = True
              Font.Color = clBlack
              Font.Height = -10
              Expanded = False
            end
            item
              FieldName = 'student_id'
              Title.Caption = 'student_id'
              Title.Font.Height = -13
              Width = -1
              Visible = False
              Font.Height = -13
              Alignment = taRightJustify
              Expanded = False
            end
            item
              FieldName = 'number_of_wish'
              Title.Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090
              Title.Font.Height = -13
              Width = 70
              Visible = True
              Font.Color = clBlack
              Font.Height = -10
              Alignment = taRightJustify
              Expanded = False
            end
            item
              FieldName = 'user0_id'
              Title.Caption = 'user0_id'
              Title.Font.Height = -13
              Width = -1
              Visible = False
              Font.Height = -13
              Alignment = taRightJustify
              Expanded = False
            end>
        end
        object UniPanel4: TUniPanel
          Left = 0
          Top = 0
          Width = 722
          Height = 99
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          Color = clBtnFace
          TabOrder = 1
          object CboxWish: TUniComboBox
            Left = 463
            Top = 68
            Width = 53
            Height = 30
            Style = csDropDown
            MaxLength = 0
            Items.Strings = (
              '1'
              '2'
              '3'
              '4')
            ItemIndex = -1
            TabOrder = 1
            RemoteQuery = False
            CharCase = ecNormal
          end
          object LpVuz: TUniDBLookupComboBox
            Left = 95
            Top = 3
            Width = 289
            Height = 24
            ListField = 'full_name'
            ListSource = DsVuz
            KeyField = 'vuz_id'
            ListFieldIndex = 0
            TabOrder = 2
            OnAjaxEvent = LpVuzAjaxEvent
          end
          object Ub2d: TUniButton
            Left = 563
            Top = 66
            Width = 75
            Height = 25
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100
            TabOrder = 3
            OnClick = Ub2dClick
          end
          object LpFac: TUniDBLookupComboBox
            Left = 95
            Top = 33
            Width = 289
            Height = 24
            ListField = 'name_faculties'
            ListSource = DsFac
            KeyField = 'faculties_id'
            ListFieldIndex = 0
            TabOrder = 4
            OnAjaxEvent = LpFacAjaxEvent
          end
          object LpDir: TUniDBLookupComboBox
            Left = 95
            Top = 63
            Width = 289
            Height = 24
            ListField = 'direction_name'
            ListSource = DsDir
            KeyField = 'direction_id'
            ListFieldIndex = 0
            TabOrder = 5
          end
          object UniButton3: TUniButton
            Left = 644
            Top = 66
            Width = 75
            Height = 25
            Caption = #1059#1076#1072#1083#1080#1090#1100
            TabOrder = 6
            OnClick = UniButton3Click
          end
          object UniLabel4: TUniLabel
            Left = 5
            Top = 7
            Width = 26
            Height = 16
            Caption = #1042#1059#1047':'
            TabOrder = 7
          end
          object UniLabel5: TUniLabel
            Left = 5
            Top = 36
            Width = 67
            Height = 16
            Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090':'
            TabOrder = 8
          end
          object UniLabel6: TUniLabel
            Left = 5
            Top = 66
            Width = 83
            Height = 16
            Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077':'
            TabOrder = 9
          end
          object UniLabel7: TUniLabel
            Left = 390
            Top = 71
            Width = 67
            Height = 16
            Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090':'
            TabOrder = 10
          end
        end
      end
    end
  end
  object AsetStudA: TADODataSet
    Connection = MainForm.AConMain
    CursorType = ctStatic
    CommandText = 'select * from student'
    Parameters = <>
    Left = 208
    Top = 8
  end
  object AsetSubA: TADODataSet
    Connection = MainForm.AConMain
    CursorType = ctStatic
    CommandText = 
      'select ST.student_name, ST.user0_id, S.*, SS.count_of_points'#13#10' f' +
      'rom student_subject SS'#13#10' left join Subjects S on S.subject_id=SS' +
      '.subject_id'#13#10' left join student ST on ST.student_id = SS.student' +
      '_id'#13#10
    Parameters = <>
    Left = 376
    Top = 8
  end
  object AsetWishA: TADODataSet
    Connection = MainForm.AConMain
    CursorType = ctStatic
    CommandText = 
      'SELECT V.full_name, F.name_faculties, DL.direction_name, S.stude' +
      'nt_name, SW.student_id, SW.number_of_wish, S.user0_id'#13#10'  FROM st' +
      'udent_wish SW'#13#10'  left join student S on SW.student_id = S.studen' +
      't_id'#13#10'  left join direction D on D.direction_id = SW.direction_i' +
      'd'#13#10'  left join direction_list DL on DL.direction_list_id = D.dir' +
      'ection_list_id'#13#10'  left join faculties F on D.faculties_id = F.fa' +
      'culties_id'#13#10'  left join vuz V on F.vuz_id = V.vuz_id'
    Parameters = <>
    Left = 80
    Top = 8
  end
  object DsStudA: TDataSource
    DataSet = AsetStudA
    Left = 144
    Top = 8
  end
  object DsSub: TDataSource
    DataSet = AsetSubA
    Left = 320
    Top = 8
  end
  object DsWishA: TDataSource
    DataSet = AsetWishA
    Left = 16
    Top = 8
  end
  object Aset1: TADODataSet
    Connection = MainForm.AConMain
    Parameters = <>
    Left = 672
  end
  object Ds1: TDataSource
    DataSet = Aset1
    Left = 704
  end
  object AsetVuz: TADODataSet
    Active = True
    Connection = MainForm.AConMain
    CursorType = ctStatic
    CommandText = 'select * from vuz'
    Parameters = <>
    Left = 488
    Top = 8
  end
  object DsVuz: TDataSource
    DataSet = AsetVuz
    Left = 560
    Top = 8
  end
  object AsetFac: TADODataSet
    Active = True
    Connection = MainForm.AConMain
    CursorType = ctStatic
    CommandText = 'select * from faculties'#13#10
    Parameters = <>
    Left = 488
    Top = 64
  end
  object AsetDir: TADODataSet
    Active = True
    Connection = MainForm.AConMain
    CursorType = ctStatic
    CommandText = 'select * from direction'
    Parameters = <>
    Left = 488
    Top = 112
  end
  object DsFac: TDataSource
    DataSet = AsetFac
    Left = 560
    Top = 64
  end
  object DsDir: TDataSource
    DataSet = AsetDir
    Left = 560
    Top = 112
  end
end
