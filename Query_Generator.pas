unit Query_Generator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, StrUtils, Clipbrd;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//Button1 Start

procedure TForm1.Button1Click(Sender: TObject);
var
  Columns, ColumnName, Query, SumParts: string;
  i: Integer;
begin
  // Initialize variables
  Columns := Memo1.Lines.Text;
  Query := 'SELECT' + sLineBreak +

           '    COUNT(*) as Total_Record,' + sLineBreak +
           '    SUM(' + sLineBreak;
  SumParts := '';

  // Process each column name
  for i := 0 to Memo1.Lines.Count - 1 do
  begin
    ColumnName := Trim(Memo1.Lines[i]);
    if ColumnName <> '' then
    begin
      if SumParts <> '' then
        SumParts := SumParts + ' + ' + sLineBreak;

      if AnsiEndsText('_date', ColumnName) then
        SumParts := SumParts + '        LEN(COALESCE(REPLACE(' + ColumnName + ', ''/'', ''''), ''''))'
      else
        SumParts := SumParts + '        LEN(COALESCE(' + ColumnName + ', ''''))';
    end;
  end;

  // Finalize the query
  Query := Query + SumParts + sLineBreak +
           '    ) AS TotalCharacter' + sLineBreak +
           'FROM' + sLineBreak +
           '    DATA';

  // Output the query
  Memo2.Lines.Text := Query;

  ShowMessage('Query Generate Complete')

end;

//Button2 Start

procedure TForm1.Button2Click(Sender: TObject);
begin

Clipboard.AsText := Memo2.Lines.Text;

end;



//Button3 Start

//procedure TForm1.Button3Click(Sender: TObject);
//var
//  Columns, ColumnName, Query: string;
//  i: Integer;
//begin
//  // Initialize variables
//  Columns := Memo1.Lines.Text;
//  Query := 'SELECT' + sLineBreak +
//           '    COUNT(*) as Total_Record,' + sLineBreak;
//
//  // Process each column name
//  for i := 0 to Memo1.Lines.Count - 1 do
//  begin
//    ColumnName := Trim(Memo1.Lines[i]);
//    if ColumnName <> '' then
//    begin
//      if i > 0 then
//        Query := Query + ',' + sLineBreak;
//
//        Query := Query + '    LEN(COALESCE(' + ColumnName + ', '''')) AS ' + ColumnName + '_Length,' + sLineBreak +
//                         '    AVG(LEN(COALESCE(' + ColumnName + ', ''''))) AS ' + ColumnName + '_Avg_Length';
//    end;
//  end;
//
//  // Finalize the query
//  Query := Query + sLineBreak +
//           'FROM' + sLineBreak +
//           '    DATA';
//
//  // Output the query
//  Memo2.Lines.Text := Query;
//end;



procedure TForm1.Button3Click(Sender: TObject);
var
  ColumnName, Query: string;
  i: Integer;
begin
//  // Initialize the query
//  Query := 'SELECT' + sLineBreak +
//           '    COUNT(*) as Total_Record,' + sLineBreak;

  Query := 'SELECT' + sLineBreak;



  // Process each column name from Memo1
  for i := 0 to Memo1.Lines.Count - 1 do
  begin
    ColumnName := Trim(Memo1.Lines[i]);
    if ColumnName <> '' then
    begin
      if i > 0 then
        Query := Query + ',' + sLineBreak;

      // Append SUM and AVG calculations for each column
      Query := Query +
    					 '  SUM(CASE WHEN COALESCE(' + ColumnName + ', '''') <> '''' THEN LEN(' + ColumnName + ') ELSE 0 END) AS ' + ColumnName + '_Char,' + sLineBreak +
    					 '  CAST(AVG(CAST(CASE WHEN COALESCE(' + ColumnName + ', '''') <> '''' THEN LEN(' + ColumnName + ') ELSE NULL END AS DECIMAL(20, 15))) AS DECIMAL(20, 15)) AS ' + ColumnName + '_AVG';
    end;
  end;

  // Finalize the query
  Query := Query + sLineBreak +
           'FROM' + sLineBreak +
           '    DATA';

  // Output the query to Memo2
  Memo2.Lines.Text := Query;

  ShowMessage('Query Generate Complete')

end;






end.


end.


end.

