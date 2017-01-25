object Form1: TForm1
  Left = 300
  Top = 225
  Width = 608
  Height = 470
  Caption = #1040#1083#1075#1086#1088#1080#1090#1084' '#1044#1077#1081#1082#1089#1090#1088#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 434
    Top = 56
    Width = 106
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1074#1077#1088#1096#1080#1085#1072':'
  end
  object Label2: TLabel
    Left = 434
    Top = 80
    Width = 100
    Height = 13
    Caption = #1050#1086#1085#1077#1095#1085#1072#1103' '#1074#1077#1088#1096#1080#1085#1072':'
  end
  object Label3: TLabel
    Left = 432
    Top = 24
    Width = 97
    Height = 26
    Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086#1077' '#1082#1086#1083'-'#1074#1086' '#1074#1077#1088#1096#1080#1085' - 12'
    WordWrap = True
  end
  object SpeedButton1: TSpeedButton
    Left = 552
    Top = 16
    Width = 33
    Height = 33
    Flat = True
    OnClick = SpeedButton1Click
  end
  object Button1: TButton
    Left = 440
    Top = 112
    Width = 147
    Height = 26
    Caption = #1053#1072#1081#1090#1080' '#1082#1088#1072#1090#1095#1072#1081#1096#1080#1081' '#1087#1091#1090#1100
    TabOrder = 0
    WordWrap = True
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 546
    Top = 53
    Width = 41
    Height = 21
    Enabled = False
    TabOrder = 1
    Text = '1'
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 409
    Height = 417
    ActivePage = TabSheet1
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = #1043#1088#1072#1092
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 409
        Height = 330
        OnMouseUp = Image1MouseUp
      end
      object rb1: TRadioButton
        Left = 5
        Top = 336
        Width = 108
        Height = 17
        Caption = #1055#1086#1089#1090#1072#1074#1080#1090#1100' '#1090#1086#1095#1082#1091
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rb2: TRadioButton
        Left = 5
        Top = 359
        Width = 108
        Height = 17
        Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1083#1080#1085#1080#1102
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1052#1072#1090#1088#1080#1094#1072' '#1089#1084#1077#1078#1085#1086#1089#1090#1080
      ImageIndex = 1
      object StringGrid1: TStringGrid
        Left = 3
        Top = 3
        Width = 382
        Height = 382
        ColCount = 12
        DefaultColWidth = 30
        DefaultRowHeight = 30
        FixedCols = 0
        RowCount = 12
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1052#1072#1090#1088#1080#1094#1072' l(x)'
      ImageIndex = 2
      object Label4: TLabel
        Left = 0
        Top = 8
        Width = 31
        Height = 17
        AutoSize = False
        Caption = 'x1'
        WordWrap = True
      end
      object Label5: TLabel
        Left = 0
        Top = 40
        Width = 31
        Height = 17
        AutoSize = False
        Caption = 'x2'
        WordWrap = True
      end
      object Label6: TLabel
        Left = 0
        Top = 72
        Width = 31
        Height = 17
        AutoSize = False
        Caption = 'x3'
        WordWrap = True
      end
      object Label7: TLabel
        Left = 0
        Top = 104
        Width = 31
        Height = 17
        AutoSize = False
        Caption = 'x4'
        WordWrap = True
      end
      object Label8: TLabel
        Left = 0
        Top = 136
        Width = 31
        Height = 17
        AutoSize = False
        Caption = 'x5'
        WordWrap = True
      end
      object Label9: TLabel
        Left = 0
        Top = 288
        Width = 31
        Height = 17
        AutoSize = False
        Caption = 'x10'
        WordWrap = True
      end
      object Label10: TLabel
        Left = 0
        Top = 264
        Width = 31
        Height = 17
        AutoSize = False
        Caption = 'x9'
        WordWrap = True
      end
      object Label11: TLabel
        Left = 0
        Top = 232
        Width = 31
        Height = 17
        AutoSize = False
        Caption = 'x8'
        WordWrap = True
      end
      object Label12: TLabel
        Left = 0
        Top = 200
        Width = 31
        Height = 17
        AutoSize = False
        Caption = 'x7'
        WordWrap = True
      end
      object Label13: TLabel
        Left = 0
        Top = 168
        Width = 31
        Height = 17
        AutoSize = False
        Caption = 'x6'
        WordWrap = True
      end
      object Label14: TLabel
        Left = 0
        Top = 320
        Width = 31
        Height = 17
        AutoSize = False
        Caption = 'x11'
        WordWrap = True
      end
      object Label15: TLabel
        Left = 0
        Top = 352
        Width = 31
        Height = 17
        AutoSize = False
        Caption = 'x12'
        WordWrap = True
      end
      object StringGrid2: TStringGrid
        Left = 24
        Top = 0
        Width = 377
        Height = 382
        ColCount = 12
        DefaultColWidth = 30
        DefaultRowHeight = 30
        FixedCols = 0
        RowCount = 12
        FixedRows = 0
        TabOrder = 0
        OnDrawCell = StringGrid2DrawCell
      end
    end
  end
  object Button2: TButton
    Left = 528
    Top = 144
    Width = 59
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 3
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 546
    Top = 77
    Width = 41
    Height = 21
    TabOrder = 4
    Text = '3'
  end
  object Edit3: TEdit
    Left = 440
    Top = 144
    Width = 81
    Height = 21
    TabOrder = 5
    Text = '0'
  end
end
