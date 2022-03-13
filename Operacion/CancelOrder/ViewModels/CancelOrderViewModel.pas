unit CancelOrderViewModel;

interface

uses
  CancelOrderModel, CancelOrderService, System.Classes,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  Graphics, Controls, Vcl.Forms, Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TCancelOrderViewModel = Class
  private
    CancelOrderModel : TCancelOrderModel;
    CancelOrderService : TCancelOrderService;
    _noGra, _pagCueIva, _pagCueOtr, _perIIBB, _perImpMun, _impInt, _otrTrib : Double;
    function GetCodigo: string;
    function GetTipo: string;
    procedure SetCodigo(const Value: string);
    procedure SetTipo(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;

    procedure FindButton;
    procedure YesButton(codigo,tipo,comp,bonificar,fecha :string);
    procedure SetRetPerc(noGra, pagCueIva, pagCueOtr, perIIBB, perImpMun, impInt, otrTrib : Double);
    procedure GetRetPerc();

    property Codigo: string read GetCodigo write SetCodigo;
    property Tipo: string read GetTipo write SetTipo;

    property PnoGra: double read _noGra write _noGra;
    property PpagCueIva: double read _pagCueIva write _pagCueIva;
    property PpagCueOtr: double read _pagCueOtr write _pagCueOtr;
    property PperIIBB: double read _perIIBB write _perIIBB;
    property PperImpMun: double read _perImpMun write _perImpMun;
    property PimpInt: double read _impInt write _impInt;
    property PotrTrib: double read _otrTrib write _otrTrib;

  end;

implementation

{ TCancelOrderViewModel }

uses BuscarOperacion;

constructor TCancelOrderViewModel.Create;
begin
  inherited Create;
  CancelOrderModel := TCancelOrderModel.Create;
end;

destructor TCancelOrderViewModel.Destroy;
begin
  CancelOrderModel.Free;
  inherited;
end;

procedure TCancelOrderViewModel.FindButton;
begin
  BuscarOperacionForm := TBuscarOperacionForm.Create(nil);
  with BuscarOperacionForm do
  begin
    anular := true;
    esCompra := (Self.Tipo='Compra');
    try
      ShowModal;
  //    salir := BuscarOperacionForm.salir;
  //    if salir then Exit;
    finally
      if (TipoRadioGroup.ItemIndex=0) or (TipoRadioGroup.ItemIndex=3) then
        begin
          Self.Codigo := Codigo;
  //        BitBtn1.Click;
        end
      else
        ShowMessage('Solo se pueden anular Facturas!!!');
      Free;
    end;
  end;
end;

function TCancelOrderViewModel.GetCodigo: string;
begin
   Result := CancelOrderModel.Codigo;
end;

procedure TCancelOrderViewModel.GetRetPerc;
begin
  PpagCueIva := CancelOrderModel.pagCueIva;
  PpagCueOtr := CancelOrderModel.pagCueOtr;
  PperIIBB := CancelOrderModel.perIIBB;
  PperImpMun := CancelOrderModel.perImpMun;
  PimpInt := CancelOrderModel.impInt;
  PotrTrib := CancelOrderModel.otrTrib;
end;

function TCancelOrderViewModel.GetTipo: string;
begin
   Result := CancelOrderModel.Tipo;
end;

procedure TCancelOrderViewModel.SetRetPerc(noGra, pagCueIva, pagCueOtr, perIIBB,
  perImpMun, impInt, otrTrib: Double);
begin
  CancelOrderModel.pagCueIva := pagCueIva;
  CancelOrderModel.pagCueOtr := pagCueOtr;
  CancelOrderModel.perIIBB := perIIBB;
  CancelOrderModel.perImpMun := perImpMun;
  CancelOrderModel.impInt := impInt;
  CancelOrderModel.otrTrib := otrTrib;
end;

procedure TCancelOrderViewModel.SetCodigo(const Value: string);
begin
  CancelOrderModel.Codigo := Value;
end;

procedure TCancelOrderViewModel.SetTipo(const Value: string);
begin
  CancelOrderModel.Tipo := Value;
end;

procedure TCancelOrderViewModel.YesButton(codigo,tipo,comp,bonificar,fecha :string);
begin
  if (codigo<>'') and (tipo<>'') then
  begin
    GetRetPerc();
    CancelOrderService := TCancelOrderService.Create(codigo,tipo,comp,bonificar,fecha,
    PnoGra, PpagCueIva, PpagCueOtr, PperIIBB, PperImpMun, PimpInt, PotrTrib);
    CancelOrderService.Execute;
    CancelOrderService.Free;
  end;
end;

end.
