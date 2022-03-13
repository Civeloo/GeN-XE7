unit FullMainF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids,
  DBGrids,
  Menus, DB, jpeg, DataModule, shellapi, OleCtrls, SHDocVw, UrlMon
  ,System.Net.HttpClient ;

type

  EExecAppError = class(Exception);

  TFullMainForm = class(TForm)
    MainMenu1: TMainMenu;
    ABM1: TMenuItem;
    Proveedores: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Operaciones1: TMenuItem;
    Vender1: TMenuItem;
    Comprar1: TMenuItem;
    Clientes: TMenuItem;
    Rubro: TMenuItem;
    Categoria: TMenuItem;
    SubCategorias: TMenuItem;
    Bancos: TMenuItem;
    IngresosBrutos: TMenuItem;
    Aumentarporporcentaje1: TMenuItem;
    Productos: TMenuItem;
    Listados1: TMenuItem;
    Cheques2: TMenuItem;
    Productos1: TMenuItem;
    Anular: TMenuItem;
    ListadePrecios1: TMenuItem;
    Configuracion1: TMenuItem;
    Clientes1: TMenuItem;
    Proveedores1: TMenuItem;
    Caja2: TMenuItem;
    EnCartera1: TMenuItem;
    Entregados1: TMenuItem;
    Pagos1: TMenuItem;
    PagosaProveedores1: TMenuItem;
    PagoaCobradores1: TMenuItem;
    PagoaVendedores1: TMenuItem;
    Empresa1: TMenuItem;
    Sistema1: TMenuItem;
    Pedido1: TMenuItem;
    Ganancias1: TMenuItem;
    VaciarBasedeDatos1: TMenuItem;
    Vendedores: TMenuItem;
    Cobradores: TMenuItem;
    CrearPedido1: TMenuItem;
    CuentaCorriente1: TMenuItem;
    BACKUPCopiadeSeguridad1: TMenuItem;
    Login1: TMenuItem;
    CREDITOS1: TMenuItem;
    CREARCREDITO1: TMenuItem;
    RENDICION2: TMenuItem;
    NOTADECREDITO1: TMenuItem;
    IMPRIMIRCARTON1: TMenuItem;
    PLANES1: TMenuItem;
    RENDICION1: TMenuItem;
    COBRADOR1: TMenuItem;
    CLIENTE1: TMenuItem;
    ESTADODECUENTA1: TMenuItem;
    COBRADOR2: TMenuItem;
    RENDICIONDECOBRADORES1: TMenuItem;
    RENDICIONDECLIENTES1: TMenuItem;
    RENDICIONDECUOTAS1: TMenuItem;
    CONTABILIDAD1: TMenuItem;
    PAGODEIVA1: TMenuItem;
    APORTEDECAPITAL1: TMenuItem;
    ABM2: TMenuItem;
    CUENTAS1: TMenuItem;
    CAPITULOS1: TMenuItem;
    RUBROS1: TMenuItem;
    IPODEGASTO1: TMenuItem;
    SOCIOS1: TMenuItem;
    LIBROS1: TMenuItem;
    DIARIO1: TMenuItem;
    IVAVENTAS1: TMenuItem;
    IVACOMPRAS1: TMenuItem;
    COBRANZA1: TMenuItem;
    REGISTRO1: TMenuItem;
    GESTION1: TMenuItem;
    EMPRANOS1: TMenuItem;
    EXTRAJUDICIAL1: TMenuItem;
    JUDICIAL1: TMenuItem;
    INCOBRABLE1: TMenuItem;
    Ayuda1: TMenuItem;
    Acercade1: TMenuItem;
    MIGRAR1: TMenuItem;
    COMPRAS1: TMenuItem;
    VENTAS1: TMenuItem;
    PAGODEIIBB1: TMenuItem;
    MigrarArticulos: TMenuItem;
    MigrarVentas: TMenuItem;
    REMITO: TMenuItem;
    AnularVenta: TMenuItem;
    AnularCompra: TMenuItem;
    ListadoNotaCredito: TMenuItem;
    Bonificar: TMenuItem;
    BonificarCompra: TMenuItem;
    IniciarSesion1: TMenuItem;
    WooCommerce1: TMenuItem;
    ENVIO1: TMenuItem;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ProveedoresClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure ProductosClick(Sender: TObject);
    procedure ClientesClick(Sender: TObject);
    procedure RubroClick(Sender: TObject);
    procedure CategoriaClick(Sender: TObject);
    procedure Aumentarporporcentaje1Click(Sender: TObject);
    procedure Comprar1Click(Sender: TObject);
    procedure Vender1Click(Sender: TObject);
    procedure ListadePrecios1Click(Sender: TObject);
    procedure ImpuestosyServicios1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Caja2Click(Sender: TObject);
    procedure Entregados1Click(Sender: TObject);
    procedure PlanesClick(Sender: TObject);
    procedure PagoaCobradores1Click(Sender: TObject);
    procedure RendiciondeCobrador1Click(Sender: TObject);
    procedure PagoaVendedores1Click(Sender: TObject);
    procedure RendicindeClientes1Click(Sender: TObject);
    procedure PagosdeServicios1Click(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
    procedure Pedido1Click(Sender: TObject);
    procedure Ganancias1Click(Sender: TObject);
    procedure Sistema1Click(Sender: TObject);
    procedure VaciarBasedeDatos1Click(Sender: TObject);
    procedure VendedoresClick(Sender: TObject);
    procedure CobradoresClick(Sender: TObject);
    procedure VerStock1Click(Sender: TObject);
    procedure CrearPedido1Click(Sender: TObject);
    procedure PagosaProveedores1Click(Sender: TObject);
    procedure CuentaCorriente1Click(Sender: TObject);
    procedure Cuentas1Click(Sender: TObject);
    procedure Productos1Click(Sender: TObject);
    procedure Caja3Click(Sender: TObject);
    procedure Creditos1Click(Sender: TObject);
    procedure Contable1Click(Sender: TObject);
    procedure Co1Click(Sender: TObject);
    procedure BACKUPCopiadeSeguridad1Click(Sender: TObject);
    procedure Stock1Click(Sender: TObject);
    procedure Login1Click(Sender: TObject);
    procedure LibroDiario1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CrearCredito1Click(Sender: TObject);
    procedure RENDICIONDECOBRADORES1Click(Sender: TObject);
    procedure RENDICIONDECLIENTES1Click(Sender: TObject);
    procedure RENDICIONDECUOTAS1Click(Sender: TObject);
    procedure NOTADECREDITO1Click(Sender: TObject);
    procedure IMPRIMIRCARTON1Click(Sender: TObject);
    procedure PLANES1Click(Sender: TObject);
    procedure COBRADOR1Click(Sender: TObject);
    procedure CLIENTE1Click(Sender: TObject);
    procedure ESTADODECUENTA1Click(Sender: TObject);
    procedure COBRADOR2Click(Sender: TObject);
    procedure PAGODEIVA1Click(Sender: TObject);
    procedure APORTEDECAPITAL1Click(Sender: TObject);
    procedure CAPITULOS1Click(Sender: TObject);
    procedure RUBROS1Click(Sender: TObject);
    procedure IPODEGASTO1Click(Sender: TObject);
    procedure SOCIOS1Click(Sender: TObject);
    procedure DIARIO1Click(Sender: TObject);
    procedure IVAVENTAS1Click(Sender: TObject);
    procedure IVACOMPRAS1Click(Sender: TObject);
    procedure REGISTRO1Click(Sender: TObject);
    procedure EMPRANOS1Click(Sender: TObject);
    procedure EXTRAJUDICIAL1Click(Sender: TObject);
    procedure JUDICIAL1Click(Sender: TObject);
    procedure INCOBRABLE1Click(Sender: TObject);
    procedure Acercade1Click(Sender: TObject);
    procedure Ayuda1Click(Sender: TObject);
    procedure IngresosBrutosClick(Sender: TObject);
    procedure COMPRAS1Click(Sender: TObject);
    procedure VENTAS1Click(Sender: TObject);
    procedure SubCategoriasClick(Sender: TObject);
    procedure PAGODEIIBB1Click(Sender: TObject);
    procedure MigrarArticulosClick(Sender: TObject);
    procedure MigrarVentasClick(Sender: TObject);
    procedure REMITOClick(Sender: TObject);
    procedure AnularVentaClick(Sender: TObject);
    procedure AnularCompraClick(Sender: TObject);
    procedure ListadoNotaCreditoClick(Sender: TObject);
    procedure BonificarCompraClick(Sender: TObject);
    procedure IniciarSesion1Click(Sender: TObject);
    procedure WooCommerce1Click(Sender: TObject);
    procedure ENVIO1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    // function WinExecAndWait32(FileName:String; Visibility:integer):integer;
  private
    { Private declarations }
    sinGrabar: boolean;
    procedure Logueado;
  public
    { Public declarations }
  end;

var
  FullMainForm: TFullMainForm;

implementation

uses LoginF, BuscarOperacion, incremento, PagoIVAF, LibroDiarioF,
  UFProductos, ProveedorF, UFClientes, VendedorF, RubroF,
  CategoriaFomUnit, UFBuscaArticulos, CajaLF,
  GananciasL, Precios, ListadoClientes, BuscaCompra, EmpresaF, ConfiguracionF,
  VaciarBaseF, main, OperacionF,
  LibrosF, PagoF, CancelOrderView, WebLoginF, RestDM, WooCommerceFormUnit,
  ZonaEnvioFormUnit;

{$R *.dfm}

procedure TFullMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not dm.HayBase then Exit;
  If not sinGrabar then
    DM.DejarUsuario;
end;

procedure TFullMainForm.FormShow(Sender: TObject);
var i:Integer;
begin
  with DM do begin
    try
      // CONECTAR BASE DE DATOS
      // CONTROL DE USUARIOS
      if not DM.HayBase then Exit;
        TraerConfig;
        Query.SQL.Text :=
          'Select * From "Usuario" Where (NOMBRE=''admin'' and "password"=''admin'')';
        Query.Open;
        If Query.RecordCount = 0 then
        begin
          FLogin := TFLogin.Create(self);
          try
            FLogin.ShowModal;
          finally
            Query.Close;
            Query.Free;
            FLogin.Free;
          end;
        end
        else
        begin
          Usuario := Query.FieldByName('CODIGO').AsString;
          Permiso := Query.FieldByName('PERMISO').AsInteger;
          Query.SQL.Text := 'insert into "Control" (USUARIO, MAQUINA) values (' +
            Usuario + ', ' + QuotedStr(Maquina) + ')';
          Query.ExecSQL;
//          Query.Transaction.Commit;
          LoginOk := True;
        end;
//      WebBrowser1.Navigate(path + 'hlp\index.htm');
      ShellExecute(0,'open','https://www.gamerzone.com.ar/',nil,nil,SW_SHOWMINIMIZED);
      if LoginOk <> True then
      begin
        ShowMessage('el usuario no coincide con la clave...');
        close;
      end
      else
      begin
        if Permiso < 3 then
          Configuracion1.Visible := False;
        if Permiso < 2 then
          CONTABILIDAD1.Visible := False;
        if Permiso < 1 then
        begin
          Listados1.Visible := False;
          ABM1.Visible := False;
          Pagos1.Visible := False;
          Comprar1.Visible := False;
          CuentaCorriente1.Visible := False;
          Aumentarporporcentaje1.Visible := False;
          // AnularVenta1.Visible := False;
          Anular.Visible := False;
          // DevolverMercadera1.Visible := False;
          // Retenciones1.Visible := False;
    //      ReImprimir.Visible := False;
          // AsignarCobrador1.Visible := False;
          CrearPedido1.Visible := False;
        end;
      end;
      FullMainForm.caption := 'Civeloo GeN v'+version+' [OFFLINE]';
      if (webUpd<>'') then
      begin
        DMR := TDMR.Create(Self);
        try
          DMR.WebLogin;
          if (webUpd<>'') then
          begin
            Licencia := DMR.WebLicencia;
            if (Licencia<>'') then Logueado;
          end;
        finally
          DMR.Free;
        end;
      end;
      if Actualizar then Close;
      FormatearFecha;
    finally
//      Query.Close;
      if not DM.HayBase then Close;
    end;
  end;
end;

procedure TFullMainForm.Cuentas1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'CuentaContable.exe')), SW_SHOWNORMAL);
//  CuentasContablesForm := TCuentasContablesForm.Create(self);
//  try
//    CuentasContablesForm.ShowModal;
//  finally
//    CuentasContablesForm.Free;
//  end;
end;

procedure TFullMainForm.DIARIO1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'LibroDiarioL.exe')), SW_SHOWNORMAL);
  LibroDiarioLForm := TLibroDiarioLForm.Create(self);
  try
    LibroDiarioLForm.ShowModal;
  finally
    LibroDiarioLForm.Free;
  end;
end;

procedure TFullMainForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key = VK_F1 then
    Ayuda1.Click;
end;

procedure TFullMainForm.ProveedoresClick(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'Proveedor.exe')), SW_SHOWNORMAL);
  ProveedorForm := TProveedorForm.Create(self);
  try
    ProveedorForm.ShowModal;
  finally
    ProveedorForm.Free;
  end;
end;

procedure TFullMainForm.N1Click(Sender: TObject);
begin
  close;
end;

procedure TFullMainForm.NOTADECREDITO1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'NotaCreditoPlan.exe')), SW_SHOWNORMAL);
//  NotaCreditoPlanForm := TNotaCreditoPlanForm.Create(self);
//  try
//    NotaCreditoPlanForm.ShowModal;
//  finally
//    NotaCreditoPlanForm.Free;
//  end;
end;

procedure TFullMainForm.BACKUPCopiadeSeguridad1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'Backup.exe')), SW_SHOWNORMAL);
//  BackUpForm := TBackUpForm.Create(self);
//  try
//    BackUpForm.ShowModal;
//  finally
//    BackUpForm.Free;
//  end;
end;

procedure TFullMainForm.BonificarCompraClick(Sender: TObject);
begin
  FCancelOrderView := TFCancelOrderView.Create(Self);
  FCancelOrderView.tipo := 'Compra';
  FCancelOrderView.esBonificar := True;
  try
    FCancelOrderView.ShowModal;
  finally
    FCancelOrderView.Free;
  end;
end;

procedure TFullMainForm.Productos1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'Stock.exe')), SW_SHOWNORMAL);
  FBuscaArticulo := TFBuscaArticulo.Create(self);
  FBuscaArticulo.Stock := True;
  try
    FBuscaArticulo.ShowModal;
  finally
    FBuscaArticulo.Free;
  end;
end;

procedure TFullMainForm.ProductosClick(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'Articulos.exe')), SW_SHOWNORMAL);
  FProductos := TFProductos.Create(self);
  try
    FProductos.ShowModal;
  finally
    FProductos.Free;
  end;
end;

procedure TFullMainForm.ClientesClick(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'Clientes.exe')), SW_SHOWNORMAL);
  FClientes := TFClientes.Create(self);
  try
    FClientes.ShowModal;
  finally
    FClientes.Free;
  end;
end;

procedure TFullMainForm.RubroClick(Sender: TObject);
begin
  CategoriaForm := TCategoriaForm.Create(self);
  with CategoriaForm do
  begin
    try
      tabla:='Rubro';
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TFullMainForm.RUBROS1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'RubroContable.exe')), SW_SHOWNORMAL);
//  RubroContableForm := TRubroContableForm.Create(self);
//  try
//    RubroContableForm.ShowModal;
//  finally
//    RubroContableForm.Free;
//  end;
end;

procedure TFullMainForm.REMITOClick(Sender: TObject);
begin
  OperacionForm := TOperacionForm.Create(self);
  OperacionForm.TipoRadioGroup.ItemIndex := 2;
  try
    OperacionForm.ShowModal;
  finally
    OperacionForm.Free;
  end;
end;

procedure TFullMainForm.CategoriaClick(Sender: TObject);
begin
  CategoriaForm := TCategoriaForm.Create(self);
  with CategoriaForm do
  begin
    try
      tabla:='Categoria';
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TFullMainForm.CLIENTE1Click(Sender: TObject);
begin
  WinExec(PAnsiChar(AnsiString(path + 'RendicionClienteL.exe')), SW_SHOWNORMAL);
end;

procedure TFullMainForm.APORTEDECAPITAL1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'AporteCapital.exe')), SW_SHOWNORMAL);
//  AporteCapitalForm := TAporteCapitalForm.Create(self);
//  try
//    AporteCapitalForm.ShowModal;
//  finally
//    AporteCapitalForm.Free;
//  end;
end;

procedure TFullMainForm.MigrarArticulosClick(Sender: TObject);
begin
//  MigrarForm := TMigrarForm.Create(self);
//  MigrarForm.tabla := 'Articulo';
//  try
//    MigrarForm.ShowModal;
//  finally
//    MigrarForm.Free;
//  end;
end;

procedure TFullMainForm.Aumentarporporcentaje1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'IncrementarValor.exe')), SW_SHOWNORMAL);
  IncrementoForm := TIncrementoForm.Create(self);
  try
    IncrementoForm.ShowModal;
  finally
    IncrementoForm.Free;
  end;
end;

procedure TFullMainForm.Ayuda1Click(Sender: TObject);
begin
  HlinkNavigateString(Nil, pChar(path + 'hlp\index.htm'));
end;

procedure TFullMainForm.Acercade1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'about.exe')), SW_SHOWNORMAL);
  mainForm := TmainForm.Create(self);
  try
    mainForm.ShowModal;
  finally
    mainForm.Free;
  end;
end;

procedure TFullMainForm.Comprar1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'Comprar.exe')), SW_SHOWNORMAL);
//  ComprarForm := TComprarForm.Create(self);
//  try
//    ComprarForm.ShowModal;
//  finally
//    ComprarForm.Free;
//  end;
OperacionForm := TOperacionForm.Create(self);
  OperacionForm.Compra := True;
  try
    OperacionForm.ShowModal;
  finally
    OperacionForm.Free;
  end;
end;

procedure TFullMainForm.COMPRAS1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'CompraL.exe')), SW_SHOWNORMAL);
//  BuscaCompraForm := TBuscaCompraForm.Create(self);
//  try
//    BuscaCompraForm.ShowModal;
//  finally
//    BuscaCompraForm.Free;
//  end;
  BuscarOperacionForm := TBuscarOperacionForm.Create(self);
  with BuscarOperacionForm do
  begin
    try
      esCompra:=True;
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TFullMainForm.Vender1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(Path+'Vender.exe')),SW_SHOWNORMAL);
//  VenderForm := TVenderForm.Create(self);
//  try
//    VenderForm.ShowModal;
//  finally
//    VenderForm.Free;
//  end;
  OperacionForm := TOperacionForm.Create(self);
  with OperacionForm do
  begin
    try
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TFullMainForm.AnularCompraClick(Sender: TObject);
begin
  FCancelOrderView := TFCancelOrderView.Create(Self);
  FCancelOrderView.tipo := 'Compra';
  try
    FCancelOrderView.ShowModal;
  finally
    FCancelOrderView.Free;
  end;
end;

procedure TFullMainForm.AnularVentaClick(Sender: TObject);
begin
  FCancelOrderView := TFCancelOrderView.Create(Self);;
  FCancelOrderView.tipo := 'Venta';
  try
    FCancelOrderView.ShowModal;
  finally
    FCancelOrderView.Free;
  end;
end;

procedure TFullMainForm.VENTAS1Click(Sender: TObject);
begin
  BuscarOperacionForm := TBuscarOperacionForm.Create(self);
  try
    BuscarOperacionForm.ShowModal;
  finally
    BuscarOperacionForm.Free;
  end;
end;

procedure TFullMainForm.MigrarVentasClick(Sender: TObject);
begin
//  MigrarForm := TMigrarForm.Create(self);
//  MigrarForm.tabla := 'Venta';
//  try
//    MigrarForm.ShowModal;
//  finally
//    MigrarForm.Free;
//  end;
end;

procedure TFullMainForm.ListadePrecios1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'PreciosL.exe')), SW_SHOWNORMAL);
  ListaPreciosForm := TListaPreciosForm.Create(self);
  try
    ListaPreciosForm.ShowModal;
  finally
    ListaPreciosForm.Free;
  end;
end;

procedure TFullMainForm.ListadoNotaCreditoClick(Sender: TObject);
begin
  BuscarOperacionForm := TBuscarOperacionForm.Create(self);
  with BuscarOperacionForm do
  begin
    try
      esNotaCredito:=True;
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TFullMainForm.Login1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'Usuarios.exe')), SW_SHOWNORMAL);
//  UsuariosForm := TUsuariosForm.Create(self);
//  try
//    UsuariosForm.ShowModal;
//  finally
//    UsuariosForm.Free;
//  end;
end;

procedure TFullMainForm.Logueado;
begin
  FullMainForm.caption := 'Civeloo GeN v'+version +' - [' + Empresa + '] - [USUARIO: ' + Usuario + '] - MODULO COMPLETO - [VENCE: ' + Licencia + ']';
end;

procedure TFullMainForm.Contable1Click(Sender: TObject);
begin
  WinExec(PAnsiChar(AnsiString(path + 'MenuContable.exe')), SW_SHOWNORMAL);
end;

procedure TFullMainForm.Image1Click(Sender: TObject);
begin
  ShellExecute(0,'open','https://www.gamerzone.com.ar/',nil,nil,SW_SHOWMAXIMIZED);
end;

procedure TFullMainForm.IMPRIMIRCARTON1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'CartonCobranza.exe')), SW_SHOWNORMAL);
//  CartonCobranzaForm := TCartonCobranzaForm.Create(self);
//  try
//    CartonCobranzaForm.ShowModal;
//  finally
//    CartonCobranzaForm.Free;
//  end;
end;

procedure TFullMainForm.ImpuestosyServicios1Click(Sender: TObject);
begin
  WinExec(PAnsiChar(AnsiString(path + 'ImpuestoServicio.exe')), SW_SHOWNORMAL);
end;

procedure TFullMainForm.INCOBRABLE1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'CobranzaIncobrable.exe')),SW_SHOWNORMAL);
//  CobranzaIncobrableForm := TCobranzaIncobrableForm.Create(self);
//  try
//    CobranzaIncobrableForm.ShowModal;
//  finally
//    CobranzaIncobrableForm.Free;
//  end;
end;

procedure TFullMainForm.IngresosBrutosClick(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'IngresosBrutos.exe')), SW_SHOWNORMAL);
//  IngresosBrutosForm := TIngresosBrutosForm.Create(self);
//  try
//    IngresosBrutosForm.ShowModal;
//  finally
//    IngresosBrutosForm.Free;
//  end;
end;

procedure TFullMainForm.IniciarSesion1Click(Sender: TObject);
begin
  WebLoginForm := TWebLoginForm.Create(Self);
    with WebLoginForm do
    begin
      try
        ShowModal;
      finally
        Free;
        if (webUpd<>'') then Logueado;
      end;
    end;
end;

procedure TFullMainForm.IPODEGASTO1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'TipoGasto.exe')), SW_SHOWNORMAL);
//  TipoGastoForm := TTipoGastoForm.Create(self);
//  try
//    TipoGastoForm.ShowModal;
//  finally
//    TipoGastoForm.Free;
//  end;
end;

procedure TFullMainForm.IVACOMPRAS1Click(Sender: TObject);
begin
  LibrosForm := TLibrosForm.Create(self);
    with LibrosForm do begin
    try
      Compra := True;
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TFullMainForm.IVAVENTAS1Click(Sender: TObject);
begin
  LibrosForm := TLibrosForm.Create(self);
    with LibrosForm do begin
    try
      Venta := True;
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TFullMainForm.JUDICIAL1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'CobranzaJudicial.exe')), SW_SHOWNORMAL);
//  CobranzaJudicialForm := TCobranzaJudicialForm.Create(self);
//  try
//    CobranzaJudicialForm.ShowModal;
//  finally
//    CobranzaJudicialForm.Free;
//  end;
end;

procedure TFullMainForm.Clientes1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'ClientesL.exe')), SW_SHOWNORMAL);
  ListadoClientesForm := TListadoClientesForm.Create(self);
  try
    ListadoClientesForm.ShowModal;
  finally
    ListadoClientesForm.Free;
  end;
end;

procedure TFullMainForm.Caja2Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'CajaL.exe')), SW_SHOWNORMAL);
  CajaLForm := TCajaLForm.Create(self);
  try
    CajaLForm.ShowModal;
  finally
    CajaLForm.Free;
  end;
end;

procedure TFullMainForm.Caja3Click(Sender: TObject);
begin
  WinExec(PAnsiChar(AnsiString(path + 'Caja.exe')), SW_SHOWNORMAL);
end;

procedure TFullMainForm.CAPITULOS1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'Capitulo.exe')), SW_SHOWNORMAL);
//  CapituloForm := TCapituloForm.Create(self);
//  try
//    CapituloForm.ShowModal;
//  finally
//    CapituloForm.Free;
//  end;
end;

procedure TFullMainForm.Entregados1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'Caja.exe')), SW_SHOWNORMAL);
end;

procedure TFullMainForm.ENVIO1Click(Sender: TObject);
begin
  ZonaEnvioForm := TZonaEnvioForm.Create(Self);
  with ZonaEnvioForm do
  begin
    try
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TFullMainForm.ESTADODECUENTA1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'EstadoCuentaL.exe')), SW_SHOWNORMAL);
//  EstadoCuentaLForm := TEstadoCuentaLForm.Create(self);
//  try
//    EstadoCuentaLForm.ShowModal;
//  finally
//    EstadoCuentaLForm.Free;
//  end;
end;

procedure TFullMainForm.EXTRAJUDICIAL1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'CobranzaExtrajudicial.exe')),SW_SHOWNORMAL);
//  CobranzaExtraJudicialForm := TCobranzaExtraJudicialForm.Create(self);
//  try
//    CobranzaExtraJudicialForm.ShowModal;
//  finally
//    CobranzaExtraJudicialForm.Free;
//  end;
end;

procedure TFullMainForm.PlanesClick(Sender: TObject);
begin
  WinExec(PAnsiChar(AnsiString(path + 'Plan.exe')), SW_SHOWNORMAL);
end;

procedure TFullMainForm.PagoaCobradores1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'PagoCobrador.exe')), SW_SHOWNORMAL);
//  PagoComisionCobradorForm := TPagoComisionCobradorForm.Create(self);
//  try
//    PagoComisionCobradorForm.ShowModal;
//  finally
//    PagoComisionCobradorForm.Free;
//  end;
end;

procedure TFullMainForm.RendiciondeCobrador1Click(Sender: TObject);
begin
  WinExec(PAnsiChar(AnsiString(path + 'PagoCobrador.exe')), SW_SHOWNORMAL);
end;

procedure TFullMainForm.RENDICIONDECOBRADORES1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'PagoCobrador.exe')), SW_SHOWNORMAL);
//  PagoComisionCobradorForm := TPagoComisionCobradorForm.Create(self);
//  try
//    PagoComisionCobradorForm.ShowModal;
//  finally
//    PagoComisionCobradorForm.Free;
//  end;
end;

procedure TFullMainForm.RENDICIONDECUOTAS1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'RendicionCliente.exe')), SW_SHOWNORMAL);
//  RendicionClienteForm := TRendicionClienteForm.Create(self);
//  try
//    RendicionClienteForm.ShowModal;
//  finally
//    RendicionClienteForm.Free;
//  end;
end;

procedure TFullMainForm.PagoaVendedores1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'PagoVendedor.exe')), SW_SHOWNORMAL);
//  PagoVendedorForm := TPagoVendedorForm.Create(self);
//  try
//    PagoVendedorForm.ShowModal;
//  finally
//    PagoVendedorForm.Free;
//  end;
end;

procedure TFullMainForm.PAGODEIIBB1Click(Sender: TObject);
begin
  PagoForm := TPagoForm.Create(self);
  try
    PagoForm.ShowModal;
  finally
    PagoForm.Free;
  end;
end;

procedure TFullMainForm.PAGODEIVA1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'PagoIVA.exe')), SW_SHOWNORMAL);
  PagoIVAForm := TPagoIVAForm.Create(self);
  try
    PagoIVAForm.ShowModal;
  finally
    PagoIVAForm.Free;
  end;
end;

procedure TFullMainForm.RendicindeClientes1Click(Sender: TObject);
begin
  WinExec(PAnsiChar(AnsiString(path + 'RendicionCliente.exe')), SW_SHOWNORMAL);
end;

procedure TFullMainForm.RENDICIONDECLIENTES1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'RendicionClienteL.exe')), SW_SHOWNORMAL);
//  RendicionClienteLForm := TRendicionClienteLForm.Create(self);
//  try
//    RendicionClienteLForm.ShowModal;
//  finally
//    RendicionClienteLForm.Free;
//  end;
end;

procedure TFullMainForm.LibroDiario1Click(Sender: TObject);
begin
  WinExec(PAnsiChar(AnsiString(path + 'LibroDiarioL.exe')), SW_SHOWNORMAL);
end;

procedure TFullMainForm.PagosdeServicios1Click(Sender: TObject);
begin
  WinExec(PAnsiChar(AnsiString(path + 'PagoServicio.exe')), SW_SHOWNORMAL);
end;

procedure TFullMainForm.EMPRANOS1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'GestionCobranza.exe')), SW_SHOWNORMAL);
//  GestionCobranzaForm := TGestionCobranzaForm.Create(self);
//  try
//    GestionCobranzaForm.ShowModal;
//  finally
//    GestionCobranzaForm.Free;
//  end;
end;

procedure TFullMainForm.Empresa1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'Empresa.exe')), SW_SHOWNORMAL);
  EmpresaForm := TEmpresaForm.Create(self);
  try
    EmpresaForm.ShowModal;
  finally
    EmpresaForm.Free;
  end;
end;

procedure TFullMainForm.Pedido1Click(Sender: TObject);
begin
  BuscarOperacionForm := TBuscarOperacionForm.Create(self);
  with BuscarOperacionForm do
  begin
    esPedido := True;
    try
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TFullMainForm.PLANES1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'Plan.exe')), SW_SHOWNORMAL);
//  PlanForm := TPlanForm.Create(self);
//  try
//    PlanForm.ShowModal;
//  finally
//    PlanForm.Free;
//  end;
end;

procedure TFullMainForm.Ganancias1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'GananciaXvta.exe')), SW_SHOWNORMAL);
  GanaciaxVtaLForm := TGanaciaxVtaLForm.Create(self);
  try
    GanaciaxVtaLForm.ShowModal;
  finally
    GanaciaxVtaLForm.Free;
  end;
end;

procedure TFullMainForm.Sistema1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'Configuracion.exe')), SW_SHOWNORMAL);
  ConfiguracionForm := TConfiguracionForm.Create(self);
  try
    ConfiguracionForm.ShowModal;
  finally
    ConfiguracionForm.Free;
  end;
end;

procedure TFullMainForm.SOCIOS1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'Socio.exe')), SW_SHOWNORMAL);
//  SocioForm := TSocioForm.Create(self);
//  try
//    SocioForm.ShowModal;
//  finally
//    SocioForm.Free;
//  end;
end;

procedure TFullMainForm.Stock1Click(Sender: TObject);
begin
  WinExec(PAnsiChar(AnsiString(path + 'MenuStock.exe')), SW_SHOWNORMAL);
end;

procedure TFullMainForm.SubCategoriasClick(Sender: TObject);
begin
  CategoriaForm := TCategoriaForm.Create(self);
  with CategoriaForm do
  begin
    try
      tabla:='SubCategoria';
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TFullMainForm.VaciarBasedeDatos1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'VaciarBase.exe')), SW_SHOWNORMAL);
  VaciarBaseForm := TVaciarBaseForm.Create(self);
  try
    VaciarBaseForm.ShowModal;
  finally
    VaciarBaseForm.Free;
  end;
  sinGrabar := True;
  Close;
end;

procedure TFullMainForm.VendedoresClick(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'Vendedor.exe')), SW_SHOWNORMAL);
  VendedorForm := TVendedorForm.Create(self);
  try
    VendedorForm.ShowModal;
  finally
    VendedorForm.Free;
  end;
end;

procedure TFullMainForm.Co1Click(Sender: TObject);
begin
  WinExec(PAnsiChar(AnsiString(path + 'MenuGestionCobranza.exe')),
    SW_SHOWNORMAL);
end;

procedure TFullMainForm.COBRADOR1Click(Sender: TObject);
begin
  WinExec(PAnsiChar(AnsiString(path + 'RendicionCobradorL.exe')),
    SW_SHOWNORMAL);
end;

procedure TFullMainForm.COBRADOR2Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'RendicionCarton.exe')), SW_SHOWNORMAL);
//  RendicionCartonForm := TRendicionCartonForm.Create(self);
//  try
//    RendicionCartonForm.ShowModal;
//  finally
//    RendicionCartonForm.Free;
//  end;
end;

procedure TFullMainForm.CobradoresClick(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'Cobrador.exe')), SW_SHOWNORMAL);
//  CobradorForm := TCobradorForm.Create(self);
//  try
//    CobradorForm.ShowModal;
//  finally
//    CobradorForm.Free;
//  end;
end;

procedure TFullMainForm.VerStock1Click(Sender: TObject);
begin
  WinExec(PAnsiChar(AnsiString(path + 'Stock.exe')), SW_SHOWNORMAL);
end;

procedure TFullMainForm.WooCommerce1Click(Sender: TObject);
begin
  WooCommerceForm := TWooCommerceForm.Create(self);
  try
    WooCommerceForm.ShowModal;
  finally
    WooCommerceForm.Free;
  end;
end;

procedure TFullMainForm.CrearCredito1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'CrearCredito.exe')), SW_SHOWNORMAL);
//  CrearCreditoForm := TCrearCreditoForm.Create(self);
//  try
//    CrearCreditoForm.ShowModal;
//  finally
//    CrearCreditoForm.Free;
//  end;
end;

procedure TFullMainForm.CrearPedido1Click(Sender: TObject);
begin
OperacionForm := TOperacionForm.Create(self);
  OperacionForm.TipoRadioGroup.ItemIndex := 2;
  try
    OperacionForm.ShowModal;
  finally
    OperacionForm.Free;
  end;
end;

procedure TFullMainForm.Creditos1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'MenuCreditos.exe')), SW_SHOWNORMAL);
end;

procedure TFullMainForm.PagosaProveedores1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'PagoProveedor.exe')), SW_SHOWNORMAL);
//  CtaCteProveedoresForm := TCtaCteProveedoresForm.Create(self);
//  try
//    CtaCteProveedoresForm.ShowModal;
//  finally
//    CtaCteProveedoresForm.Free;
//  end;
end;

procedure TFullMainForm.CuentaCorriente1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'CtaCte.exe')), SW_SHOWNORMAL);
//  CtaCteForm := TCtaCteForm.Create(self);
//  try
//    CtaCteForm.ShowModal;
//  finally
//    CtaCteForm.Free;
//  end;
end;

procedure TFullMainForm.REGISTRO1Click(Sender: TObject);
begin
  // WinExec(PAnsiChar(AnsiString(path + 'GestionCobranza.exe')), SW_SHOWNORMAL);
//  GestionCobranzaForm := TGestionCobranzaForm.Create(self);
//  try
//    GestionCobranzaForm.ShowModal;
//  finally
//    GestionCobranzaForm.Free;
//  end;
end;

end.
