object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 382
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 540
    Height = 382
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitWidth = 536
    ExplicitHeight = 381
    object vtMain: TVirtualStringTree
      Left = 2
      Top = 2
      Width = 536
      Height = 378
      Align = alClient
      BorderStyle = bsNone
      Header.AutoSizeIndex = 0
      Header.Height = 34
      Header.Options = [hoAutoResize, hoDrag, hoOwnerDraw, hoVisible]
      Header.Style = hsFlatButtons
      TabOrder = 0
      OnAdvancedHeaderDraw = vtMainAdvancedHeaderDraw
      OnAfterCellPaint = vtMainAfterCellPaint
      OnFreeNode = vtMainFreeNode
      OnGetCursor = vtMainGetCursor
      OnGetText = vtMainGetText
      OnHeaderClick = vtMainHeaderClick
      OnHeaderDrawQueryElements = vtMainHeaderDrawQueryElements
      Touch.InteractiveGestures = [igPan, igPressAndTap]
      Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
      Columns = <
        item
          Options = [coAllowClick, coEnabled, coParentBidiMode, coParentColor, coShowDropMark, coVisible, coAllowFocus]
          Position = 0
          Text = #1058#1077#1082#1089#1090
          Width = 286
        end
        item
          Alignment = taCenter
          Options = [coAllowClick, coEnabled, coParentBidiMode, coParentColor, coShowDropMark, coVisible, coAllowFocus]
          Position = 1
          Text = 'Value'
          Width = 250
        end>
    end
  end
  object ilButtons: TImageList
    Height = 10
    Width = 10
    Left = 40
    Top = 280
    Bitmap = {
      494C01010200040004000A000A00FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000280000000A00000001002000000000004006
      0000000000000000000000000000000000000000000000000000000000004C98
      4C0011761100117611004C984C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001B81
      1B0054BA540054BA54001B811B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000298F
      290059BF590059BF5900298F2900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000027794D00268C26002F952F00399F
      390060C7600060C76000399F39002F952F00268C260027794D004058D800092A
      D1001436D9002143E0002A4CE6002A4CE6002143E0001436D900092AD1004058
      D800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000268C260069D0690069D0690069D0
      690069D0690069D0690069D0690069D0690069D06900268C26001335DB005476
      FF005476FF005476FF005476FF005476FF005476FF005476FF005476FF001335
      DB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D932D0087EE870087EE87007DE4
      7D0072D9720072D972007DE47D0087EE870087EE87002D932D002F51F00087A9
      FF0087A9FF0087A9FF0087A9FF0087A9FF0087A9FF0087A9FF0087A9FF002F51
      F000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000439666003BA13B0046AC460050B6
      50007BE27B007BE27B0050B6500046AC46003BA13B0043966600728BFF004A6C
      FF005476FF005E80FF006587FF006587FF005E80FF005476FF004A6CFF00728B
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004CB2
      4C0082E9820082E982004CB24C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000046AC
      460087EE870087EE870046AC4600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000072BE
      720043A9430043A9430072BE7200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      28000000280000000A0000000100010000000000500000000000000000000000
      000000000000000000000000FFFFFF00E1FFF00000000000E1FFF00000000000
      E1FFF00000000000000000000000000000000000000000000000000000000000
      0000000000000000E1FFF00000000000E1FFF00000000000E1FFF00000000000
      00000000000000000000000000000000000000000000}
  end
end