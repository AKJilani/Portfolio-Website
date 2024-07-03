object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Query_Generator'
  ClientHeight = 774
  ClientWidth = 584
  Color = clInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Button1: TButton
    Left = 40
    Top = 33
    Width = 145
    Height = 25
    Caption = 'Generate for Char'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 40
    Top = 64
    Width = 481
    Height = 665
    TabOrder = 1
  end
  object Memo2: TMemo
    Left = 560
    Top = 64
    Width = 1189
    Height = 665
    TabOrder = 2
    Visible = False
  end
  object Button2: TButton
    Left = 400
    Top = 33
    Width = 121
    Height = 25
    Caption = 'Copy to Clipboard'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 208
    Top = 33
    Width = 169
    Height = 25
    Caption = 'Generate for Column'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button3Click
  end
end
