unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, ExtCtrls, Buttons;

type
  tvertex = record
    inf: Integer;
    vertex: tpoint;
  end;

const
  n = 12; // ���������� ������

type
  TArr1=array [1 .. n] of longint;
  TArr = array [1 .. n, 1 .. n] of longint;
  tpath = array [1 .. n] of Integer;
  tvertexarray = array [1 .. n] of tvertex;

type
  TForm1 = class(TForm)
    Button1: TButton;
    StringGrid1: TStringGrid;
    Label1: TLabel;
    Edit1: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Image1: TImage;
    rb1: TRadioButton;
    rb2: TRadioButton;
    TabSheet2: TTabSheet;
    Button2: TButton;
    Label2: TLabel;
    Edit2: TEdit;
    TabSheet3: TTabSheet;
    StringGrid2: TStringGrid;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button2Click(Sender: TObject);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Math;

var
  vertex: tvertexarray; // ������ ������ �����(�� �������)

  vertexCnt: Integer; // ���������� ������ ����� (�� �������)

  firstselected: boolean; { ��������: ������� �� ������ �����
    (��� ����� 2 ������) }

  v1, v2: Integer; // ��������� ������� ��� �����
{$R *.dfm}

var
  ToDraw:TArr;
  d: TArr1; // ����������
  path: tpath; // ����
  endlast: Integer;

procedure drawEdge(im: TImage; var path: tpath; var vt: tvertexarray);
var
  i: Integer; sum:integer;
begin //������ ����� �������� ����
  sum:=0;
  im.Canvas.Pen.Color := clred; //���� �����
  i := StrToIntDef(Form1.Edit2.Text, 1); //������ �������� �������
  endlast := i;
  with im.Canvas do
    while (i <> 0) do //���� �� ����� �� ��������� �������
    begin
      moveto(vt[i].vertex.X, vt[i].vertex.Y); //��������� � i-�� �������
      if (i>0)and(path[i]>0) then begin //���� ���� ���� � ���������
      showmessage(inttostr(path[i])+' '+inttostr(i)); //����� ����������� �����
      sum:=sum+strtoint(form1.StringGrid1.cells[path[i]-1,i-1]); //����������
      end;
      i := path[i]; //������� � ��������� �����
      if i <> 0 then
        lineto(vt[i].vertex.X, vt[i].vertex.Y); //������ ���� ������� ������
    end;
    form1.Edit3.Text:=inttostr(sum); //����� ����������
  im.Canvas.Pen.Color := clblack;
end;

procedure reDrawEdge(im: TImage; var path: tpath; var vt: tvertexarray);
var
  i: Integer;
begin //�������������� ���������� ���� ������ ������
  im.Canvas.Pen.Color := clblack;
  i := endlast;
  with im.Canvas do
    while (i <> 0) do
    begin
      moveto(vt[i].vertex.X, vt[i].vertex.Y);
      i := path[i];
      if i <> 0 then
        lineto(vt[i].vertex.X, vt[i].vertex.Y);
    end;
end;


procedure getStr(arr:TArr1;cnt:integer;var str:string);
var i:integer;
begin //����� ������� � ������
str:='';
for i := 1 to cnt-1 do
if (arr[i]<1000) then
  str:=str+' '+inttostr(arr[i]) else
      str:=str+' '+'-';
end;

procedure arr2tosg(arr:TArr;var sg:TStringGrid);
var i,j:integer;
begin //����� ������� � StringGrid
  for i := 0 to n do
    for j := 0 to n do
      sg.Cells[i,j]:=inttostr(arr[i+1,j+1]);

end;

procedure arrtosg(arr:TArr1;var sg:TStringGrid;i:integer);
var j:integer;
begin //������� ������� � i-�� ������� ������� TStringGrid
  for j := 0 to n do
      if(arr[j+1]<500) then
        sg.Cells[i,j]:=inttostr(arr[j+1])
      else
        sg.Cells[i,j]:='-';
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i, j: Integer;
begin //������� ����
  for i := 0 to n - 1 do
    for j := 0 to n - 1 do
    begin
      ToDraw[i,j]:=0;
      StringGrid1.Cells[i, j] := '';
      StringGrid1.Cells[j, i] := '';
      StringGrid2.Cells[i, j] := '';
      StringGrid2.Cells[j, i] := '';
    end;
  v1 := 0;
  v2 := 0;
  vertexCnt := 0;
  firstselected := false;
  Image1.Canvas.Brush.Color := clwhite;
  Image1.Canvas.Rectangle(0, 0, Image1.Width, Image1.Height);
  Image1.Canvas.Brush.Color := clblack;
  StringGrid2.Refresh;  StringGrid2.Refresh;
  for i := 0 to n - 1 do
    StringGrid1.Cells[i, i] := '0';
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
begin //�������������
  endlast := 0;
  v1 := 0;
  v2 := 0;
  vertexCnt := 0;
  firstselected := false;
  Image1.Canvas.Brush.Color := clwhite; //��������� ��� ����� ������
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
  Image1.Canvas.Brush.Color := clblack;
  Randomize;
  for i := 0 to n - 1 do
    StringGrid1.Cells[i, i] := '0';
end;

procedure TForm1.Button1Click(Sender: TObject);

var
str:string;
  a: TArr{array [1 .. n, 1 .. n] of longint};
          // ������� ��������� (-1 ��� �����)
  b: array [1 .. n] of boolean; // ������������� �������
  q, i, j, m, v,k: Integer;
  temparr:array[1..n] of integer;
  rect:TRect;
begin
  for i := 0 to n - 1 do         //������� stringgrid2
    for j := i + 1 to n - 1 do begin
      StringGrid2.Cells[i, j] := '';
    end;
str:='';
  reDrawEdge(Image1, path, vertex); //�������������� ���� ������� �������
  //=====================================================\\
  for i := 0 to n - 1 do
    for j := i + 1 to n - 1 do
    begin
      if StringGrid1.Cells[i, j] = '' then
        StringGrid1.Cells[i, j] := '-1'; // "-1" ���� ��� �����
      StringGrid1.Cells[j, i] := StringGrid1.Cells[i, j] //������������� �������
    end;
//=====================================================\\
                                    // ���� ������
  q := StrToIntDef(Edit1.Text, 1); // ��������� �������
  if (q < 1) or (q > n) then
    q := 1;
//=====================================================\\
  for i := 1 to n do              //������������ � ������� "a" �������� ��
    for j := 1 to n do begin            //Stringgrid1
      a[j, i] := StrToIntDef(StringGrid1.Cells[i - 1, j - 1], -1);
    end;
//=====================================================\\
  fillchar(b, sizeof(b), 0);   //��������� ������ ������������� ������ ��������� 0
  fillchar(d, sizeof(d), 10000); //��������� ������ ���������� ��������� �������������
       // 10000 - �������������
  d[q] := 0; // ���������� �� ��������� �������
//=====================================================\\
for i := 1 to n do //���� �� ��������
  begin
    m := 1000;
//=====================================================\\
  for j := 1 to n do //�������� ����������� ���� ����� ������������
      if ((d[j] <= m) and (not b[j])) then
      begin
        m := d[j];
        v := j;
      end;
    b[v] := true; //������� ������� �������������
//=====================================================\\
      if (m<1000) then
          Showmessage(inttostr(m)+'- rasstoyanie v x'+inttostr(v));
    if(m<1000)  then  //      \
      for k:=i-1 to 11 do//   | ������� d[j] ���������� � �������� ������
        ToDraw[k,v-1]:=1;//   /
//=====================================================\\
    for j := 1 to n do //���� ���������� �� ��������� �����
      if ((a[v, j] <> -1) and (not b[j]) and (d[v] + a[v, j] < d[j])) then
      begin //���� ����� ������� ���������, �� ����������
        d[j] := d[v] + a[v, j];
        path[j] := v; //�������� ������� � ����������� ����
      end;
//=====================================================\\
      arrtosg(d,stringgrid2,i-1); //������� ������ ���������� � �������
  end;
  drawEdge(Image1, path, vertex); //������ ���� �� �����
stringgrid2.Refresh;
stringgrid2.Refresh;
edit2.SetFocus;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i: Integer;
  old: tpoint;
  ves: Integer;
begin
//=====================================================\\
  if rb1.Checked = true then //���� ������� �����
    with Image1.Canvas do
    begin
      if vertexCnt >= n then //���� ���������� ����� ������ ������������� - �����
        exit;
      inc(vertexCnt); //��������� ������� �����
      vertex[vertexCnt].inf := vertexCnt;
      vertex[vertexCnt].vertex.X := X; //��������� �� �
      vertex[vertexCnt].vertex.Y := Y; //��������� �� �
      Image1.Canvas.Brush.Color := clblack; //����
      moveto(X, Y); //��������� � ������� �,�
      ellipse(X - 5, Y - 5, X + 5, Y + 5); //������ �����
      Image1.Canvas.Brush.Color := clwhite; //������ ���� �����
      TextOut(X + 10, Y + 10, inttostr(vertexCnt));//����� ����� ��� �����
      Image1.Canvas.Brush.Color := clblack; //������ ���� �����
    end;
//=====================================================\\
  if rb2.Checked = true then //���� ������� �����
//=====================================================\\
    if firstselected = false then //���� �� ������� ������ ����� ��� ����������
    begin
      with Image1 do
      begin
        for i := 1 to n do //���� �� ��������
        begin //��������: ���� �� ����� �����
          if (X > vertex[i].vertex.X - 20) and (X < vertex[i].vertex.X + 20)
            and (Y > vertex[i].vertex.Y - 20) and (Y < vertex[i].vertex.Y + 20)
            then
          begin //���� ������ ����� � ������, ����� ���������� ���� �����
            X := vertex[i].vertex.X;
            Y := vertex[i].vertex.Y;
            v1 := vertex[i].inf;
            break; //����� ������� - �����
          end;
        end;
      end;
      Image1.Canvas.moveto(X, Y); //��������� � ������ �����
      firstselected := true;
    end
//=====================================================\\
    else //����� 2�� �����
    begin
      old.X := X; //���������� ���������� ������ �����
      old.Y := Y;
      for i := 1 to n do //���� �� ������, �������� �� ����������
      begin
        if (X > vertex[i].vertex.X - 20) and (X < vertex[i].vertex.X + 20) and
          (Y > vertex[i].vertex.Y - 20) and (Y < vertex[i].vertex.Y + 20) then
        begin //������������� ���������� �� ����� ������� �����
          X := vertex[i].vertex.X;
          Y := vertex[i].vertex.Y;
          v2 := vertex[i].inf;
          break;
        end;
      end;
//=====================================================\\
      if (v2 = v1) or (old.X = X) or (old.Y = Y) then
        exit //���� ����� �������, ��� ����� ���������� ���������� - �� ������
      else   begin
        firstselected := false; //�������� ������� ����, ��� ���� �� ����� �������
      Image1.Canvas.lineto(X, Y);//������ ����� ����� �������
//=====================================================\\
      { ��� ����(����������) }
      ves:=random(15)+1;
      ves := strtoint(inputbox('������� ����������','������� ����������',inttostr(ves)));
      StringGrid1.Cells[v1 - 1, v2 - 1] := inttostr(ves);
      StringGrid1.Cells[v2 - 1, v1 - 1] := StringGrid1.Cells[v1 - 1, v2 - 1];
          //� ������� ���������� ��������� ��������� ����� 1�� � 2�� ������
      Image1.Canvas.Brush.Color := clwhite;
      Image1.Canvas.TextOut(round((vertex[v2].vertex.X + vertex[v1].vertex.X)
            div 2), round((vertex[v2].vertex.Y + vertex[v1].vertex.Y) div 2),
        inttostr(ves)); //����� 1�� � 2�� ������ ��������� ����� - ���
      Image1.Canvas.Brush.Color := clblack;
      end;
    end;
    edit2.Text:=inttostr(vertexCnt);
//=====================================================\\
end;


procedure TForm1.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
//������������ ������, ���������� � ������� ToDraw
   if (ToDraw[ACol][ARow]=1) then begin
            StringGrid2.Canvas.Brush.Color:= RGB(109,237,224);
            StringGrid2.Canvas.FillRect( Rect );
            StringGrid2.Canvas.TextRect (Rect, Rect.Left + 2, Rect.Top + 2, StringGrid2.Cells[ACol,ARow]);
            end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  reDrawEdge(Image1, path, vertex); //�������������� ���� ������� �������
    DrawEdge(Image1, path, vertex); //�������������� ���� ������� �������
end;


end.
