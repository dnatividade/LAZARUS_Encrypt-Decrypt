unit Unit1;
//Source:
//lazarus: encrypt the string with AES
//https://www.programmersought.com/article/30105222250/

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls, DCPrijndael, DCPsha256;

type

  { TEnDeCrypt }

  TEnDeCrypt = class(TForm)
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    edKey: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private

  public

  end;

var
  EnDeCrypt: TEnDeCrypt;

implementation

{$R *.lfm}

{ TEnDeCrypt }

procedure TEnDeCrypt.BitBtn1Click(Sender: TObject);
var Cipher: TDCP_rijndael;
begin
  if (edKey.Text <> '') then
  begin
    Cipher:= TDCP_rijndael.Create(Self);
    Cipher.InitStr(edKey.Text, TDCP_sha256);
    Edit2.Text:= Cipher.EncryptString(Edit1.Text);
    Cipher.Burn;
    Cipher.Free;
  end;
end;

procedure TEnDeCrypt.BitBtn3Click(Sender: TObject);
var Cipher: TDCP_rijndael;
begin
  if (edKey.Text <> '') then
  begin
    Cipher:= TDCP_rijndael.Create(Self);
    Cipher.InitStr(EDKey.Text,TDCP_sha256);
    Edit1.Text:=Cipher.DecryptString(Edit2.Text);
    Cipher.Burn;
    Cipher.Free;
  end;
end;

end.

