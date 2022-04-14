unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls;

type

  { Tfrgame }

  Tfrgame = class(TForm)
    lb1: TLabel;
    lb10: TLabel;
    lb11: TLabel;
    lb12: TLabel;
    lb13: TLabel;
    lb14: TLabel;
    lb15: TLabel;
    lb16: TLabel;
    lb2: TLabel;
    lb3: TLabel;
    lb4: TLabel;
    lb5: TLabel;
    lb6: TLabel;
    lb7: TLabel;
    lb8: TLabel;
    lb9: TLabel;
    mm1: TMainMenu;
    mItem1: TMenuItem;
    mItem2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure lb1Click(Sender: TObject);
    procedure mItem2Click(Sender: TObject);
  private

  public

  end;

var
  frgame: Tfrgame;
  gmas:array[1..16] of TLabel;
  var i: integer;

implementation

{$R *.lfm}

{ Tfrgame }

procedure Tfrgame.FormCreate(Sender: TObject);
begin
  gmas[1]:=lb1;
  gmas[2]:=lb2;
  gmas[3]:=lb3;
  gmas[4]:=lb4;
  gmas[5]:=lb5;
  gmas[6]:=lb6;
  gmas[7]:=lb7;
  gmas[8]:=lb8;
  gmas[9]:=lb9;
  gmas[10]:=lb10;
  gmas[11]:=lb11;
  gmas[12]:=lb12;
  gmas[13]:=lb13;
  gmas[14]:=lb14;
  gmas[15]:=lb15;
  gmas[16]:=lb16;

  for i:=1 to 16 do
  begin
    gmas[i].Tag:=i;
    gmas[i].caption:= inttostr(i);
  end;
  gmas[16].Caption:='';
end;

procedure Tfrgame.lb1Click(Sender: TObject);
var
ni:integer;
tmptext:string;
begin
  ni:=(sender as TLabel).Tag;

  if (ni - 4 >=1) then
  begin
    if (gmas[ni - 4].Caption = '') then
    begin
      tmptext:= gmas[ni - 4].Caption;
      gmas[ni - 4].Caption:= gmas[ni].Caption;
      gmas[ni].Caption:= tmptext;
    end;
  end;

  if (ni + 4 <=16) then
  begin
    if (gmas[ni + 4].Caption='') then
    begin
      tmptext:= gmas[ni +4].Caption;
      gmas[ni + 4].Caption := gmas[ni].caption;
      gmas[ni].Caption:= tmptext;
    end;
  end;

  if (ni - 1 >= 1) then
  begin
    if (gmas[ni - 1].Caption='') then
    begin
      tmptext:= gmas[ni -1].Caption;
      gmas[ni - 1].Caption := gmas[ni].Caption;
      gmas[ni].caption := tmptext;
    end;
  end;

  if ((ni + 1 <=16)) then
  begin
    if (gmas[ni + 1].Caption = '') then
    begin
      tmptext:= gmas[ni+1].Caption;
      gmas[ni+1].Caption:=gmas[ni].Caption;
      gmas[ni].Caption:=tmptext;
    end;
  end;
end;

procedure mixer;
var
k:integer;
tmp:string;

begin
randomize;
for i:=1 to 16 do
  begin
    k:=random(16)+1;
    tmp:=gmas[i].Caption;
    gmas[i].Caption:=gmas[k].Caption;
    gmas[k].Caption:=tmp;
  end;
end;

procedure Tfrgame.mItem2Click(Sender: TObject);
begin
  mixer;
end;

end.

