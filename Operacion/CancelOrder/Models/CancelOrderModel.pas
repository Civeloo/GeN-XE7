unit CancelOrderModel;

interface

uses
  System.SysUtils;

type
  TCancelOrderModel = Class
  private
    c,t: string;
    _noGra, _pagCueIva, _pagCueOtr, _perIIBB, _perImpMun, _impInt, _otrTrib : Double;
    function GetCodigo: string;
    procedure SetCodigo(const Value: string);
    function GetTipo: string;
    procedure SetTipo(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;

    property Codigo: string read GetCodigo write SetCodigo;
    property Tipo: string read GetTipo write SetTipo;
    property noGra: double read _noGra write _noGra;
    property pagCueIva: double read _pagCueIva write _pagCueIva;
    property pagCueOtr: double read _pagCueOtr write _pagCueOtr;
    property perIIBB: double read _perIIBB write _perIIBB;
    property perImpMun: double read _perImpMun write _perImpMun;
    property impInt: double read _impInt write _impInt;
    property otrTrib: double read _otrTrib write _otrTrib;
  end;

implementation

{ TCancelOrderModel }

constructor TCancelOrderModel.Create;
begin
  inherited Create;
  c := '';
  t := '';
end;

destructor TCancelOrderModel.Destroy;
begin
  inherited;
end;

function TCancelOrderModel.GetCodigo: string;
begin
  Result := c;
end;

function TCancelOrderModel.GetTipo: string;
begin
  Result := t;
end;

procedure TCancelOrderModel.SetCodigo(const Value: string);
begin
  c := Value;
end;

procedure TCancelOrderModel.SetTipo(const Value: string);
begin
  t := Value;
end;

end.
