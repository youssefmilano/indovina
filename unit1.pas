unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TIndovinaNumero }

  TIndovinaNumero = class(TForm)
    ButtonNuova: TButton;
    ButtonProva: TButton;
    EditNumero: TEdit;
    Label1: TLabel;
    LabelRisposta: TLabel;

    procedure ButtonNuovaClick(Sender: TObject);
    procedure ButtonProvaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  IndovinaNumero: TIndovinaNumero;
    segreto: Integer;     // il numero pensato dal computer
  tentativi: Integer;   // quante prove hai fatto

implementation

{$R *.lfm}

{ TIndovinaNumero }

procedure TIndovinaNumero.FormCreate(Sender: TObject);
begin
    Randomize;                     // mescola i numeri a caso
  segreto := Random(100) + 1;    // un numero da 1 a 100
  tentativi := 0;
end;
  procedure TIndovinaNumero.ButtonProvaClick(Sender: TObject);
var
  numero: Integer;
begin
  numero := StrToInt(EditNumero.Text);
  tentativi := tentativi + 1;
  if numero = segreto then
    begin
      LabelRisposta.Caption := 'Indovinato! Tentativi: ' + IntToStr(tentativi);
    end
  else
    begin
      if numero < segreto then
        begin
          LabelRisposta.Caption := 'Troppo BASSO: prova un numero più grande';
        end
      else
        begin
          LabelRisposta.Caption := 'Troppo ALTO: prova un numero più piccolo';
        end;
    end;
  EditNumero.Clear;
end;

procedure TIndovinaNumero.ButtonNuovaClick(Sender: TObject);
begin
  segreto := Random(100) + 1;
  tentativi := 0;
  LabelRisposta.Caption := 'Ho pensato un nuovo numero da 1 a 100';
end;

end.

