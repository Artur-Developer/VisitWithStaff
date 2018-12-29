unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.ExtCtrls,FileCtrl,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, PASSWORD;

type
  TForm2 = class(TForm)
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    BitBtn1: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Button2: TButton;
    Edit2: TEdit;
    Button3: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Button4: TButton;
    Button1: TButton;
    DBGrid1: TDBGrid;
    ComboBox1: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);

  // procedure TPasswordDlg(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
{$R *.dfm}
function GetPath(mes: string):string;
var
Root: string;
pwRoot : PWideChar;
Dir: string;
begin
Root := '' ;
GetMem(pwRoot, (Length(Root)+1) * 2);
pwRoot := StringToWideChar(Root, pwRoot, MAX_PATH*2);
if SelectDirectory (mes, pwRoot, Dir) then
if length(Dir) =2 then
GetPath := Dir+'V'
else GetPath := Dir
else
GetPath :=Dir;
end;

  procedure TForm2.BitBtn1Click(Sender: TObject);
var
day:string;

 begin


   form2.DateTimePicker1.DateTime:=now;
   day:=datetostr(form2.DateTimePicker1.Date);
   ADOTable1.Edit;
   case DayOfWeek(Date) of
   1: begin
      if ADOTable1.FieldByName('����������� ������').Value = Null  then
      ADOTable1.FieldByName('����������� ������').AsString:=day + Timetostr(form2.DateTimePicker1.Time)
      else ADOTable1.FieldByName('����������� ����').AsString:=day+Timetostr(form2.DateTimePicker1.Time);
      end;
   2: begin
      if ADOTable1.FieldByName('����������� ������').Value = Null  then
      ADOTable1.FieldByName('����������� ������').AsString:=day + Timetostr(form2.DateTimePicker1.Time)
      else ADOTable1.FieldByName('����������� ����').AsString:=day+Timetostr(form2.DateTimePicker1.Time);
      end;
   3: begin
      if ADOTable1.FieldByName('������� ������').Value = Null  then
      ADOTable1.FieldByName('������� ������').AsString:=day + Timetostr(form2.DateTimePicker1.Time)
      else ADOTable1.FieldByName('������� ����').AsString:=day+Timetostr(form2.DateTimePicker1.Time);
      end;
   4: begin
      if ADOTable1.FieldByName('����� ������').Value = Null  then
      ADOTable1.FieldByName('����� ������').AsString:=day + Timetostr(form2.DateTimePicker1.Time)
      else ADOTable1.FieldByName('����� ����').AsString:=day+Timetostr(form2.DateTimePicker1.Time);
      end;
   5: begin
      if ADOTable1.FieldByName('������� ������').Value = Null  then
      ADOTable1.FieldByName('������� ������').AsString:=day + Timetostr(form2.DateTimePicker1.Time)
      else ADOTable1.FieldByName('������� ����').AsString:=day+Timetostr(form2.DateTimePicker1.Time);
      end;
   6: begin
      if ADOTable1.FieldByName('������� ������').Value = Null  then
      ADOTable1.FieldByName('������� ������').AsString:=day + Timetostr(form2.DateTimePicker1.Time)
      else ADOTable1.FieldByName('������� ����').AsString:=day+Timetostr(form2.DateTimePicker1.Time);
      end;
   7: begin
      if ADOTable1.FieldByName('������� ������').Value = Null  then
      ADOTable1.FieldByName('������� ������').AsString:=day + Timetostr(form2.DateTimePicker1.Time)
      else ADOTable1.FieldByName('������� ����').AsString:=day+Timetostr(form2.DateTimePicker1.Time);
      end;
   end;
   ADOTable1.Post;
 end;


procedure TForm2.Button1Click(Sender: TObject);
 begin
    if not ADOTable1.Locate('���', ComboBox1.Text, [loCaseInsensitive, loPartialKey]) then
   ShowMessage('������ �� �������');

 end;

procedure TForm2.Button2Click(Sender: TObject);
 begin
 copyfile(Pchar('C:\Users\��.mdb'),Pchar(edit2.text+'\'+edit3.text+'.mdb'),true);
 showmessage('���� ������� ��������.');
 end;

procedure TForm2.Button3Click(Sender: TObject);
var
 Part:string;
begin
 Part:=GetPath ('�����');
 if Part <> ''
 then edit2.Text:=Part;

end;

procedure TForm2.Button4Click(Sender: TObject);

var
 n:integer;
 begin
  PasswordDlg.ShowModal;

 n:=0;
  ADOTable1.First;
   While n <> ADOTable1.FieldByName('���').Value   Do
    begin
     ADOTable1.Edit;
     ADOTable1.FieldByName('����������� ������').Value := Null;
     ADOTable1.FieldByName('����������� ����').Value := Null;
     ADOTable1.FieldByName('������� ������').Value:= Null;
     ADOTable1.FieldByName('������� ����').Value:= Null;
     ADOTable1.FieldByName('����� ������').Value:= Null;
     ADOTable1.FieldByName('����� ����').Value:= Null;
     ADOTable1.FieldByName('������� ������').Value:= Null;
     ADOTable1.FieldByName('������� ����').Value:= Null;
     ADOTable1.FieldByName('������� ������').Value:= Null;
     ADOTable1.FieldByName('������� ����').Value:= Null;
     ADOTable1.FieldByName('����������� ������').Value:= Null;
     ADOTable1.FieldByName('����������� ����').Value:= Null;
     ADOTable1.FieldByName('������� ������').Value:= Null;
     ADOTable1.FieldByName('������� ����').Value:= Null;
     ADOTable1.Post;
     n:=n+1 ;
     ADOTable1.Next;
     end;
   end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
if Length(ComboBox1.Text)>0 then
  begin
    ADOTable1.Filtered:=false;
    ADOTable1.Filter:='���'+ ' LIKE ' +#39+ComboBox1.Text+'%'+#39;
    ADOTable1.Filtered:=true;
  end
  else ADOTable1.Filtered:=false;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
with  ADOTable1 do
 begin
 DisableControls;
 ComboBox1.Items.BeginUpdate;
 First;
   while not Eof do
      begin
       ComboBox1.Items.Add(FieldByName('���').AsString);
       Next;
      end;
 ComboBox1.Items.EndUpdate;
 EnableControls;
 end;
end;

end.


