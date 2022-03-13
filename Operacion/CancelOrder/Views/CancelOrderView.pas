unit CancelOrderView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, CancelOrderViewModel, Vcl.ComCtrls;

type
  TFCancelOrderView = class(TForm)
    RightPanel: TPanel;
    TopPanel: TPanel;
    yesBitBtn: TBitBtn;
    NoBitBtn: TBitBtn;
    findBitBtn: TBitBtn;
    ClientPanel: TPanel;
    LetterLabel: TLabel;
    TitleLabel: TLabel;
    nroEdit: TEdit;
    bonificarLabel: TLabel;
    bonificarEdit: TEdit;
    compLabel: TLabel;
    compEdit: TEdit;
    fechaDateTimePicker: TDateTimePicker;
    bRetPer: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure findBitBtnClick(Sender: TObject);
    procedure yesBitBtnClick(Sender: TObject);
    procedure NoBitBtnClick(Sender: TObject);
//    procedure bRetPerClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bRetPerClick(Sender: TObject);
  private
    { Private declarations }
    FCancelOrderViewModel: TCancelOrderViewModel;
  public
    { Public declarations }
    tipo : string;
    esBonificar : Boolean;
    noGra, pagCueIva, pagCueOtr, perIIBB, perImpMun, impInt, otrTrib: Double;
  end;

var
  FCancelOrderView: TFCancelOrderView;

implementation

{$R *.dfm}

uses ufRetPerc;

procedure TFCancelOrderView.bRetPerClick(Sender: TObject);
begin
  fRetPerc := TfRetPerc.Create(Self);
  with fRetPerc do begin
    try
      eNoGra.Text := FloatToStr(noGra);
      ePagCueIva.Text := FloatToStr(pagCueIva);
      ePagCueOtr.Text := FloatToStr(pagCueOtr);
      ePerIIBB.Text := FloatToStr(perIIBB);
      ePerImpMun.Text := FloatToStr(perImpMun);
      eImpInt.Text := FloatToStr(impInt);
      eOtrTrib.Text := FloatToStr(otrTrib);
      ShowModal;
    finally
      noGra := StrToFloat(eNoGra.Text);
      pagCueIva := StrToFloat(ePagCueIva.Text);
      pagCueOtr := StrToFloat(ePagCueOtr.Text);
      perIIBB := StrToFloat(ePerIIBB.Text);
      perImpMun := StrToFloat(ePerImpMun.Text);
      impInt := StrToFloat(eImpInt.Text);
      otrTrib := StrToFloat(eOtrTrib.Text);
      Free;
    end;
  end;
//  FEContado.Text := '0';
//  CalculaTotales;
end;

procedure TFCancelOrderView.findBitBtnClick(Sender: TObject);
begin
  with FCancelOrderViewModel do
  begin
    Tipo := Self.tipo;
    FindButton;
    nroEdit.Text := Codigo;
  end;
end;

procedure TFCancelOrderView.FormCreate(Sender: TObject);
begin
  FCancelOrderViewModel := TCancelOrderViewModel.Create;
end;

procedure TFCancelOrderView.FormDestroy(Sender: TObject);
begin
  FCancelOrderViewModel.Free;
end;

procedure TFCancelOrderView.FormShow(Sender: TObject);
begin
  fechaDateTimePicker.Date := now;
  if esBonificar then
  begin
    bonificarEdit.Visible := True;
    bonificarLabel.Visible := True;
    compEdit.Visible := True;
    compLabel.Visible := True;
    Caption := 'Bonificar';
  end;
  noGra := 0;
  pagCueIva := 0;
  pagCueOtr := 0;
  perIIBB := 0;
  perImpMun := 0;
  impInt := 0;
  otrTrib := 0;
end;

procedure TFCancelOrderView.NoBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TFCancelOrderView.yesBitBtnClick(Sender: TObject);
begin
  with FCancelOrderViewModel do
  begin
    SetRetPerc(noGra, pagCueIva, pagCueOtr, perIIBB, perImpMun, impInt, otrTrib);
    YesButton(nroEdit.Text,tipo,compEdit.Text,bonificarEdit.Text,FormatDateTime('mm/dd/yyyy', fechaDateTimePicker.DateTime));
  end;
  Close;
end;

end.
