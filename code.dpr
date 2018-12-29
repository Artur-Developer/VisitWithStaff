unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.ExtCtrls,FileCtrl,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, WinSock, PASSWORD;

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
    Button1: TButton;
    DBGrid1: TDBGrid;
    ComboBox1: TComboBox;
    Timer1: TTimer;
    CheckBox1: TCheckBox;
    Button4: TButton;
    Edit1: TEdit;
    Button5: TButton;
    Label4: TLabel;
    Timer2: TTimer;

    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure ButtonCopyDbInShefComputerClick(Sender: TObject);
    procedure ButtonAfterClosedDeleteFileClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);




  // procedure TPasswordDlg(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }



  published
//   AutoSaveCheck1: Checked;

  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
//  const
//  CheckSaveDBToStartProgramm = true;
//  Res= DayOfWeek(Now); // �������� ���� ������
var CheckSaveDBToStartProgramm: Integer = 1;

// �������� ���� ����� �����
function GetLocalIP: String;
const WSVer = $101;
var
  wsaData: TWSAData;
  P: PHostEnt;
  Buf: array [0..127] of Char;
begin
  Result := '';
  if WSAStartup(WSVer, wsaData) = 0 then begin
    if GetHostName(@Buf, 128) = 0 then begin
      P := GetHostByName(@Buf);
      if P <> nil then Result := iNet_ntoa(PInAddr(p^.h_addr_list^)^);
    end;
    WSACleanup;
  end;
end;

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

 procedure CreateFolderDataBase(Sender:TObject);
begin
  if DirectoryExists('C:\Users\xxx') then
  else
     CreateDir('C:\Users\xxx');
end;

procedure CreateFolderCheckDataBase(Sender:TObject);
begin
  if DirectoryExists('C:\Users\xxx\check') then
  else
     CreateDir('C:\Users\xxx\check');
end;

procedure SaveDataBase(Sender:TObject);
var
day:string;
begin;
    form2.DateTimePicker1.DateTime:=now;
    day:=datetostr(form2.DateTimePicker1.Date);
    CreateFolderDataBase(Sender);
    if FileExists('C:\Users\xxx\'+day+'.mdb') then
      begin
        copyfile(Pchar('C:\Users\��.mdb'),Pchar('C:\Users\xxx\'+day+'_dublicate.mdb'),true);
      end;
    if FileExists('C:\Users\xxx\'+day+'_dublicate.mdb') then
    begin
       DeleteFile('C:\Users\xxx\'+day+'_dublicate.mdb');
       copyfile(Pchar('C:\Users\��.mdb'),Pchar('C:\Users\xxx\'+day+'_dublicate.mdb'),true);
       // �������� � ��������� ���������� ����� ���������
    end
     ///////
    else
      begin
          copyfile(Pchar('C:\Users\��.mdb'),Pchar('C:\Users\xxx\'+day+'.mdb'),true);
      end

end;


procedure TForm2.Button2Click(Sender: TObject);
 begin;
    copyfile(Pchar('C:\Users\��.mdb'),Pchar(edit2.text+'\'+edit3.text+'.mdb'),true);
    SaveDataBase(Sender);
    showmessage('���� ������� �������.');
 end;

procedure TForm2.Button3Click(Sender: TObject);
var
 Part:string;
begin
 Part:=GetPath ('�����');
 if Part <> ''
 then edit2.Text:=Part;

end;

//function Check: boolean;
//begin
//  HM := OpenMutex(MUTEX_ALL_ACCESS, false, 'MyOwnMutex');
//  Result := (HM <> 0);
//  if HM = 0 then
//    HM := CreateMutex(nil, false, 'MyOwnMutex');
//end;
//

Procedure TForm2.Timer1Timer(Sender: TObject);
Var
  Res: Integer;
  CheckDate : TDate;

Begin

   Res:= DayOfWeek(Now); // �������� ���� ������

// �������� ��� ������� ��������� � ����������� �� 9:00 ����
// �� ���������� ���� � ������� �������
// ���� ���� �� ����������, ��������� � ������� ������� ������
if (GetLocalIP = '10.91.31.80') or (GetLocalIP = '10.91.31.204') then
  begin
    if CheckSaveDBToStartProgramm = 1 then // �������� ���������� �� �������� � �����������
        if DayOfWeek(Now) = 2 then
           If (FormatDateTime('hh:mm', Now) > FormatDateTime('06:00',Time)) and
              (FormatDateTime('hh:mm', Now) < FormatDateTime('09:01',Time))
           then
          begin
              CreateFolderDataBase(Sender);
              CheckDate:=Now;
              CheckDate:=Trunc(CheckDate) - 3;

              if not FileExists('C:\Users\xxx\'+DateToStr(CheckDate)+'.mdb') then
                    begin
                        copyfile(Pchar('C:\Users\��.mdb'),Pchar('C:\Users\xxx\'+DateToStr(CheckDate)+'.mdb'),true); // �������� �� ��������� ���� ����� ��������
                        if FileExists('C:\Users\xxx\'+DateToStr(CheckDate)+'.mdb') then
                        begin
                          Button4Click(Sender);
                        end;
                        CheckSaveDBToStartProgramm:= 0;
                        exit;
                    end;
              if FileExists('C:\Users\xxx\'+DateToStr(CheckDate)+'.mdb') then
              begin
                 CreateFolderCheckDataBase(Sender);
                 copyfile(Pchar('C:\Users\��.mdb'),Pchar('C:\Users\xxx\check\check_'+DateToStr(CheckDate)+'.mdb'),true);
                 CheckSaveDBToStartProgramm:= 0;
                 exit;
              end;
          end;

        // � �������(6) � 21:00 ���������� �������������� ���������� ����
        if CheckBox1.Checked = true then
         Begin
           if DayOfWeek(Now) = 6 then
             if FormatDateTime('hh:mm', Now) = FormatDateTime('21:00',Time) then
               Begin
               if not FileExists('C:\Users\xxx\'+DateToStr(CheckDate)+'.mdb') then
                  begin
                    Timer1.Enabled :=False;
                    SaveDataBase(Sender);
                    Button4Click(Sender);
                    CheckSaveDBToStartProgramm := 1;
                  end;
              end
              else
                Form2.Timer1.Interval:=60000;
           End;
        end;

End;

 procedure TForm2.Timer2Timer(Sender: TObject);
begin
    //DeleteFile(Pchar('C:\Users\��.mdb'));
    //ShowMessage('������ ������� 61���');
    //Form2.Timer1.Interval:=5000;
    //Timer1.Enabled := True;
    //ShowMessage('������ true');
    //Form2.Timer2.Destroy;

end;

procedure TForm2.Button4Click(Sender: TObject);

//var login, pass: string;



var
 n:integer;
 begin
 //PasswordDlg.ShowModal;
 //pass:='12345';
 //if (PasswordDlg.Text=pass) then


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
     n:=n+1;
     ADOTable1.Next;
     end;

   end;



procedure TForm2.ButtonAfterClosedDeleteFileClick(Sender: TObject);
begin
  if not (GetLocalIP = '10.91.31.80') or (GetLocalIP = '10.91.31.204') then
    begin
      if  FileExists('C:\Users\��.mdb') then
        begin
           DeleteFile('C:\Users\��.mdb');
        end
    end;
end;

procedure TForm2.ButtonCopyDbInShefComputerClick(Sender: TObject);
begin
if not (GetLocalIP = '10.91.31.80') then
  begin
    if not FileExists('C:\Users\��.mdb') then
      begin
         copyfile(Pchar('\\10.91.31.80\Users\��.mdb'),Pchar('C:\Users\��.mdb'),true);
      end;
      if FileExists('C:\Users\��.mdb') then
          ADOConnection1.Connected:=False;
          DeleteFile('C:\Users\��.mdb');
          copyfile(Pchar('\\10.91.31.80\Users\��.mdb'),Pchar('C:\Users\��.mdb'),true);

//         ADOTable1.Active:=True;
//          ShowMessage('�������� � ��������� �����, ��������� �����������');
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

procedure ViewShefDataBase(Sender:TObject);
begin;
//  if not FileExists('C:\Users\��.mdb') then
//  begin
//     copyfile(Pchar('\\10.91.31.80\Users\��.mdb'),Pchar('C:\Users\��.mdb'),true);
//  end
//  else   DeleteFile('C:\Users\��.mdb');



end;


procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not (GetLocalIP = '10.91.31.80') then
      begin
        if  FileExists('C:\Users\��.mdb') then
          begin
               ADOConnection1.Connected:=False;
               DeleteFile('C:\Users\��.mdb');
          end
      end;
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

