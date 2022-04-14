unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Spin;

type

  { TFTimer }

  TFTimer = class(TForm)
    btstart: TButton;
    btreset: TButton;
    SpinH: TSpinEdit;
    SpinM: TSpinEdit;
    SpinS: TSpinEdit;
    tmtimer: TTimer;
    procedure btstartClick(Sender: TObject);
    procedure btresetClick(Sender: TObject);
    procedure SpinHChange(Sender: TObject);
    procedure tmtimerTimer(Sender: TObject);
  private

  public

  end;

var
  FTimer: TFTimer;
  th, tm, ts: Integer;
  press: boolean;
implementation

{$R *.lfm}

{ TFTimer }

procedure TFTimer.SpinHChange(Sender: TObject);
begin

end;

procedure TFTimer.tmtimerTimer(Sender: TObject);
begin
 if (ts=0) and (tm=0) and (th=0) and (press=true) then
 begin
 tmtimer.Enabled:=false;
 showmessage('Время вышлоî');
 end

 else if (ts=-1) and (tm<>0) then
  begin
    ts:=59;
    tm:=tm-1;
  end

  else if (ts=-1) and (tm=0) and (th<>0) then
   begin
    ts:=59;
    tm:=59;
    th:=th-1;
   end;

spinh.Value:=th;
spinm.Value:=tm;
spins.Value:=ts;
ts:=ts-1;
end;

procedure TFTimer.btstartClick(Sender: TObject);
begin
  th:=spinh.Value;
  tm:=spinm.Value;
  ts:=spins.Value;
  tmtimer.Enabled:=true;
  ts:=ts-1;
  press:=true;

end;
procedure TFTimer.btresetClick(Sender: TObject);
begin
  tmtimer.Enabled:=false;
  th:=0;
  tm:=0;
  ts:=0;
  spinh.Value:=0;
  spinm.Value:=0;
  spins.Value:=0;
end;

end.

