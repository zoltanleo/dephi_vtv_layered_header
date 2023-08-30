unit Unit1;

//taken from here
//http://forum.vingrad.ru/index.php?showtopic=230759&view=findpost&p=1660701

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VirtualTrees, ExtCtrls, ImgList, System.ImageList;

type
  PDataNode = ^TDataNode;
  TDataNode = record
    Caption: string;
    Value1: Integer;
    Value2: Integer;
  end;

  TForm1 = class(TForm)
    pnlMain: TPanel;
    vtMain: TVirtualStringTree;
    ilButtons: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure vtMainHeaderDrawQueryElements(Sender: TVTHeader;
      var PaintInfo: THeaderPaintInfo; var Elements: THeaderPaintElements);
    procedure vtMainAdvancedHeaderDraw(Sender: TVTHeader;
      var PaintInfo: THeaderPaintInfo; const Elements: THeaderPaintElements);
    procedure vtMainGetCursor(Sender: TBaseVirtualTree; var Cursor: TCursor);
    procedure vtMainFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure vtMainGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: String);
    procedure vtMainAfterCellPaint(Sender: TBaseVirtualTree;
      TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
      CellRect: TRect);
    procedure vtMainHeaderClick(Sender: TVTHeader; HitInfo: TVTHeaderHitInfo);
  private
    { Private declarations }
    FTypeValue: Boolean;
    FRect: TRect;
    procedure DoInitColumn;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.DoInitColumn;
begin
  vtMain.Invalidate;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  lNode: PVirtualNode;
  lData: PDataNode;
  Idx: Integer;
begin
  Randomize;
  vtMain.NodeDataSize := SizeOf(TDataNode);
  FTypeValue := False;
  FRect := Rect(0, 0, 0, 0);
  Screen.Cursors[crHandPoint] := LoadCursor(0, IDC_HAND);
  DoInitColumn;
  for Idx := 0 to 9 do
  begin
    lNode := vtMain.AddChild(vtMain.RootNode);
    lData := vtMain.GetNodeData(lNode);
    if Assigned(lData) then
    begin
      lData^.Caption := 'Node #' + IntToStr(Idx);
      lData^.Value1 := Random(1000);
      lData^.Value2 := Random(1000);
    end;
  end;
end;

procedure TForm1.vtMainAdvancedHeaderDraw(Sender: TVTHeader;
  var PaintInfo: THeaderPaintInfo; const Elements: THeaderPaintElements);
var
  lRect, lRect2: TRect;
  lx, ly: Integer;
begin
  if not Assigned(PaintInfo.Column) then
    Exit;
  if not Assigned(Sender.Columns) then
    Exit;
  if Sender.Columns.Count <= 0 then
    Exit;
  if hpeText in Elements then
  begin
    lRect := PaintInfo.PaintRectangle;
    SetBkMode(PaintInfo.TargetCanvas.Handle, TRANSPARENT);
    case PaintInfo.Column.Index of
      0: Windows.DrawTextW(PaintInfo.TargetCanvas.Handle, PWideChar(WideString('Название')),
            -1, lRect, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
      1:
        if FTypeValue then
        begin
          lRect2 := lRect;
          lx := (lRect.Right - lRect.Left) div 2;
          lRect.Right := lRect.Right - lx;
          lRect2.Left := lRect2.Left + lx;
          Windows.DrawTextW(PaintInfo.TargetCanvas.Handle, PWideChar(WideString('Зар.плата')),
            -1, lRect, DT_CENTER or DT_BOTTOM or DT_SINGLELINE);
          Windows.DrawTextW(PaintInfo.TargetCanvas.Handle, PWideChar(WideString('Налоги')),
            -1, lRect2, DT_CENTER or DT_BOTTOM or DT_SINGLELINE);
          lRect := PaintInfo.PaintRectangle;
          ly := (lRect.Bottom - lRect.Top) div 2;
          lRect.Bottom := lRect.Bottom - ly;
          lRect2 := lRect;
          Windows.DrawTextW(PaintInfo.TargetCanvas.Handle, PWideChar(WideString('Накладные расходы')),
            -1, lRect2, DT_CENTER or DT_VCENTER or DT_SINGLELINE or DT_CALCRECT);
          Windows.DrawTextW(PaintInfo.TargetCanvas.Handle, PWideChar(WideString('Накладные расходы')),
            -1, lRect, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
          lx := lRect2.Left + ((lRect.Right - lRect.Left) - (lRect2.Right - lRect2.Left)) div 2;
          ly := lRect2.Top + ((lRect.Bottom - lRect.Top) - (lRect2.Bottom - lRect2.Top)) div 2;
          lRect.Left := lx + (lRect2.Right - lRect2.Left) + 4;
          lRect.Right := lRect.Left + 10;
          lRect.Top := ly;
          lRect.Bottom := lRect.Top + 10;
          FRect := lRect;
          ilButtons.Draw(PaintInfo.TargetCanvas, FRect.Left, FRect.Top, 1);
          Dec(FRect.Top, Sender.Height);
          Dec(FRect.Bottom, Sender.Height);
        end
        else
        begin
          lRect2 := lRect;
          Windows.DrawTextW(PaintInfo.TargetCanvas.Handle, PWideChar(WideString('Накладные расходы')),
            -1, lRect2, DT_CENTER or DT_VCENTER or DT_SINGLELINE or DT_CALCRECT);
          Windows.DrawTextW(PaintInfo.TargetCanvas.Handle, PWideChar(WideString('Накладные расходы')),
            -1, lRect, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
          lx := lRect2.Left + ((lRect.Right - lRect.Left) - (lRect2.Right - lRect2.Left)) div 2;
          ly := lRect2.Top + ((lRect.Bottom - lRect.Top) - (lRect2.Bottom - lRect2.Top)) div 2;
          lRect.Left := lx + (lRect2.Right - lRect2.Left) + 4;
          lRect.Right := lRect.Left + 10;
          lRect.Top := ly;
          lRect.Bottom := lRect.Top + 10;
          FRect := lRect;
          ilButtons.Draw(PaintInfo.TargetCanvas, FRect.Left, FRect.Top, 0);
          Dec(FRect.Top, Sender.Height);
          Dec(FRect.Bottom, Sender.Height);
        end;
    end;
  end;

  if hpeBackground in Elements then
  begin
    lRect := PaintInfo.PaintRectangle;
    Windows.DrawEdge(PaintInfo.TargetCanvas.Handle, lRect,
      EDGE_ETCHED, BF_RECT or BF_MIDDLE or BF_ADJUST);
    if FTypeValue and (PaintInfo.Column.Index = 1) then
    begin
      lRect := PaintInfo.PaintRectangle;
      lx := (lRect.Right - lRect.Left) div 2;
      ly := (lRect.Bottom - lRect.Top) div 2;
      lRect.Left := lRect.Left + lx - 1;
      lRect.Right := lRect.Left + 3;
      lRect.Top := lRect.Top + ly + 2;
      lRect.Bottom := lRect.Bottom - 2;
      Windows.DrawEdge(PaintInfo.TargetCanvas.Handle, lRect,
        EDGE_ETCHED, BF_RECT or BF_MIDDLE or BF_ADJUST);

      lRect := PaintInfo.PaintRectangle;
      ly := (lRect.Bottom - lRect.Top) div 2 + 2;
      lRect.Top := ly;
      lRect.Bottom := ly + 3;
      Windows.DrawEdge(PaintInfo.TargetCanvas.Handle, lRect,
        EDGE_ETCHED, BF_RECT or BF_MIDDLE or BF_ADJUST);
    end;
  end;
end;

procedure TForm1.vtMainAfterCellPaint(Sender: TBaseVirtualTree;
  TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  CellRect: TRect);
var
  lData: PDataNode;
  lRect, lRect2: TRect;
begin
  lData := Sender.GetNodeData(Node);
  if not Assigned(lData) then
    Exit;
  if Column = 1 then
    if FTypeValue then
    begin
      lRect := CellRect;
      lRect2 := CellRect;
      lRect.Right := lRect.Left + (CellRect.Right - CellRect.Left) div 2;
      lRect2.Left := lRect.Right + 1;
      Windows.DrawTextA(TargetCanvas.Handle,
        PAnsiChar(IntToStr(lData^.Value1)), -1, lRect,
        DT_CENTER or DT_VCENTER or DT_SINGLELINE);
      Windows.DrawTextA(TargetCanvas.Handle,
        PAnsiChar(IntToStr(lData^.Value2)), -1, lRect2,
        DT_CENTER or DT_VCENTER or DT_SINGLELINE);
    end
    else
    begin
      lRect := CellRect;
      Windows.DrawTextA(TargetCanvas.Handle,
        PAnsiChar(IntToStr(lData^.Value1 + lData^.Value2)), -1, lRect,
        DT_CENTER or DT_VCENTER or DT_SINGLELINE);
    end;
end;

procedure TForm1.vtMainFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  lData: PDataNode;
begin
  lData := Sender.GetNodeData(Node);
//  if not Assigned(lData) then
//    Exit;
//  lData^.Caption := EmptyStr;
  if Assigned(lData) then Finalize(lData^);

end;

procedure TForm1.vtMainGetCursor(Sender: TBaseVirtualTree; var Cursor: TCursor);
var
  lPoint: TPoint;
begin
  Cursor := crDefault;
  GetCursorPos(lPoint);
  lPoint := Sender.ScreenToClient(lPoint);
  if PtInRect(FRect, lPoint) then
  begin
    Cursor := crHandPoint;
    Exit;
  end;
end;

procedure TForm1.vtMainGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: String);
var
  lData: PDataNode;
begin
  CellText := EmptyStr;
  if Column <> 0 then
    Exit;
  lData := Sender.GetNodeData(Node);
  if not Assigned(lData) then
    Exit;
  CellText := lData^.Caption;
end;

procedure TForm1.vtMainHeaderClick(Sender: TVTHeader; HitInfo: TVTHeaderHitInfo);
var
  lPoint: TPoint;
  lRect: TRect;
begin
  lPoint := Point(HitInfo.X, HitInfo.Y);
  lRect := FRect;
  Inc(lRect.Top, Sender.Height);
  Inc(lRect.Bottom, Sender.Height);
  if PtInRect(lRect, lPoint) then
  begin
    FTypeValue := not FTypeValue;
    DoInitColumn;
    Exit;
  end;
end;

procedure TForm1.vtMainHeaderDrawQueryElements(Sender: TVTHeader;
  var PaintInfo: THeaderPaintInfo; var Elements: THeaderPaintElements);
begin
  Elements := [hpeBackground, hpeText];
end;

end.
