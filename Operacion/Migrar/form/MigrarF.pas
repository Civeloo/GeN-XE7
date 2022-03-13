unit MigrarF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Authenticator.Basic, Datasnap.DBClient,
  REST.Response.Adapter, Vcl.Grids, Vcl.DBGrids, Data.DB, IPPeerClient,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Types, IBX.IBCustomDataSet, IBX.IBTable,
  FireDAC.Stan.Async, FireDAC.DApt, IBX.IBQuery, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, System.JSON ,DataModule ,OperacionDM,
  Vcl.ExtCtrls, Vcl.ExtDlgs, System.Ansistrings, RestDM;

type
  TMigrarForm = class(TForm)
    ImportarButton: TButton;
    ProgressBar1: TProgressBar;
    EditUrl: TEdit;
    EditResource: TEdit;
    EditUser: TEdit;
    EditPassword: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BorrarArticulosCheckBox: TCheckBox;
    DesdeRadioGroup: TRadioGroup;
    OpenTextFileDialog1: TOpenTextFileDialog;
    StringGrid1: TStringGrid;
    Timer1: TTimer;
    ActualizarCB: TCheckBox;
    ExportarButton: TButton;
    SaveTextFileDialog1: TSaveTextFileDialog;
    procedure ImportarButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ExportarButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
//    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    RubroId, CategoriaId, SubCategoriaId : string;
    procedure Procesar;
    procedure ImportarArticulo;
    procedure ImportarVenta;
  public
    { Public declarations }
    tabla : string;
  end;

var
  MigrarForm: TMigrarForm;

implementation

{$R *.dfm}

uses ImprimirDM;

// implentacin de la clase THilo


procedure TMigrarForm.ExportarButtonClick(Sender: TObject);
var
  Stream: TFileStream;
  i: Integer;
  OutLine: string;
  sTemp: string;
begin
with dm do begin
  SaveTextFileDialog1.FileName := tabla;
  with OperacionDataModule do begin
    qQ.SQL.Text:='Select * from "'+tabla+'"';
    qQ.Open;
    SaveTextFileDialog1.Execute();
    DataSetToCsv( SaveTextFileDialog1.FileName );
  end;
  ShowMessage('Exportacin finalizada con xito!!!');
end;
  close;
end;

procedure TMigrarForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.FormatearFecha;
end;

procedure TMigrarForm.FormCreate(Sender: TObject);
begin
//  with FormatSettings do
//  begin
//    DecimalSeparator := '.';
//    ThousandSeparator := '';
//    ShortDateFormat := 'mm/dd/yyyy';
//  end;
  with dm do begin
    LeerINI;
    EditUrl.Text := webUrl;
    EditResource.Text := webRes;
    EditUser.Text := webUsr;
    EditPassword.Text := webPsw;
    if (webUpd <> '') then ActualizarCB.checked := StrToBool(webUpd);
  end;
  OperacionDataModule := TOperacionDataModule.Create(self);
  DMR := TDMR.Create(self);
end;

procedure TMigrarForm.FormShow(Sender: TObject);
begin
  Caption := Caption + tabla;
end;

procedure TMigrarForm.ImportarButtonClick(Sender: TObject);
begin
  Timer1.Enabled:=True;
  if BorrarArticulosCheckBox.Checked then OperacionDataModule.BorrarArticulos;
  if DesdeRadioGroup.ItemIndex = 0 then
    begin
      if tabla = 'Venta' then ImportarVenta;
      if tabla = 'Articulo' then ImportarArticulo;
    end
  else Procesar;
end;

procedure TMigrarForm.Timer1Timer(Sender: TObject);
begin
  ProgressBar1.Position := ProgressBar1.Position+1;
end;

procedure TMigrarForm.Procesar;
var
  i,p : integer;
  mar, col, cat, subcat, rub, s, disponible, costo, fecha : string;
  categories: TJSONArray;
  precio, iva, ganancia, porcentaje : Double;
  function ConvertToDateTimeStr(DateStr: String): String;
  var
    s: string;
    fmt: TFormatSettings;
  begin
    fmt := TFormatSettings.Create;
    fmt.ShortDateFormat := 'YYYY-MM-DD';
    //      fmt.ShortTimeFormat := 'hh:mm:ss';
    //      fmt.TimeSeparator := ':';
    fmt.DateSeparator := '-';
    Result := formatdatetime('mm/dd/yyyy hh:mm:ss',StrToDateTime(DateStr, fmt));
  end;

begin
with DMR do
  begin
    ProgressBar1.Position := ProgressBar1.Position+1;
//    with dm do begin
      webUrl := EditUrl.Text;
      webRes := EditResource.Text;
      webUsr := EditUser.Text;
      webPsw := EditPassword.Text;
      webUpd := BoolToStr(ActualizarCB.checked);
      DM.EscribirINI;
//    end;
    ProgressBar1.Position := ProgressBar1.Position+1;
    importCategories(BorrarArticulosCheckBox.Checked);
    p:=0;
    ProgressBar1.Position := ProgressBar1.Position+1;
    repeat
      Inc(p);
      GetREST(WebRes+'status=publish&per_page=100&page='+IntToStr(p)+'&');
      if (O<>nil) then
        if  (O.RecordCount>0) then
          for i := 0 to O.RecordCount - 1 do
          begin
            ProgressBar1.Max := O.RecordCount;
            categories := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(O.FieldByName('categories').AsString),0) as TJSONArray;
            rub := existeEnTJSONArray('Rubro',categories);
  //          if rub = '' then
  //          begin
  //            insertarTabla2('Rubro','0','Sin Rubro');
  //            rub := '0';
  //          end;
            cat := existeEnTJSONArray('Categoria',categories);
  //          if cat = '' then
  //          begin
  //            insertarTabla2('Categoria','0','Sin Categora');
  //            cat := '0';
  //          end;
            subcat := existeEnTJSONArray('SubCategoria',categories);
  //          if subcat = '' then
  //          begin
  //            insertarTabla2('SubCategoria','0','Sin SubCategora');
  //            subcat := '0';
  //          end;
            disponible:=O.FieldByName('stock_quantity').AsString;
            dm.TraerConfig;
            porcentaje := dm.ConfigQuery.FieldByName('PP').AsFloat;
            if O.FieldByName('price').AsString='' then precio:=0 else precio:=O.FieldByName('price').AsFloat;
            if (O.FieldByName('tax_class').AsString = 'tasa-reducida') then
              iva := 10.5
              else
                iva := 21;
            ganancia := precio/(iva/100+1);
            costo := FloatToStrF( ( ganancia/(porcentaje/100+1) ), ffFixed, 16, 2 );
            fecha := ConvertToDateTimeStr(O.FieldByName('date_modified').AsString);
            if disponible='' then disponible:='0';
            if not (OperacionDataModule.existeEnTabla('Articulo','CODIGO='+O.FieldByName('id').AsString)) then
            begin
              dm.qD.SQL.Text := 'INSERT INTO "Articulo" ( CODIGO, DESCRIPCION '
              + ', ULTCOSTO, COSTO, PRECIO, PRECIO1, PRECIO2, DISPONIBLE'
              + ', PORCENTAJE, IMPOTROS, UNIDAD, TASA, IIBB, CTANOMBRE, CTATIPO, CTAANTICIPO, CTAIIBB '
              + ', FECHA, FECHACOMPULT, CODIGOBARRA'
              + ', CATEGORIA, COLOR, MARCA, PROVEEDOR, RUBRO, SUBCATEGORIA'
              + ' ) VALUES ( '
              + IntToStr(O.FieldByName('id').AsInteger) + ', ' + QuotedStr(O.FieldByName('name').AsString)
              + ', ' + costo + ', ' + costo + ', ' + FloatToStr(precio) + ', ' + O.FieldByName('regular_price').AsString+'0' + ', ' + O.FieldByName('sale_price').AsString+'0' + ', ' + disponible
              + ', 30, 5, ''c/u'', '+FloatToStr(iva)+', 1, 13, 13, 13, 66'
              + ', ' + QuotedStr(fecha) + ', ' + QuotedStr(fecha) + ', ' + QuotedStr(O.FieldByName('sku').AsString)
              + ', '+cat+', 0, 0, 1, '+rub+', '+subcat+' )';
  //            dm.qD.ExecSQL;
            end
              else
                dm.qD.SQL.Text := 'UPDATE "Articulo" SET'
                +' DESCRIPCION = ' + QuotedStr(O.FieldByName('name').AsString)
    //            +', ULTCOSTO = ' + costo
  //              +', COSTO = ' + costo
                +', PRECIO = ' + FloatToStr(precio)
                +', PRECIO1 = ' + O.FieldByName('regular_price').AsString+'0'
                +', PRECIO2 = ' + O.FieldByName('sale_price').AsString+'0'
                +', DISPONIBLE = ' + disponible
  //              +', PORCENTAJE = 30' +
  //              +', IMPOTROS = 5' +
  //              +', UNIDAD = ''c/u''' +
  //              +', TASA = ' + FloatToStr(iva)
  //              +', IIBB = 1' +
  //              +', CTANOMBRE = 13' +
  //              +', CTATIPO = 13' +
  //              +', CTAANTICIPO = 13' +
  //              +', CTAIIBB = 66' +
  //              +', FECHA = ' + QuotedStr(fecha)
  //              +', FECHACOMPULT = ' + QuotedStr(fecha)
                +', CODIGOBARRA = ' + QuotedStr(O.FieldByName('sku').AsString)
                +', CATEGORIA = ' + cat
  //              +', COLOR = 0' +
  //              +', MARCA = 0' +
  //              +', PROVEEDOR = 1' +
                +', RUBRO = ' + rub
                +', SUBCATEGORIA = ' + subcat
                +' WHERE CODIGO ='+ IntToStr(O.FieldByName('id').AsInteger);
            dm.qD.ExecSQL;
            ProgressBar1.Position := i;
            O.Next;
          end;
    until (O.RecordCount<2); //  until ((O.RecordCount=0) or (O.RecordCount=1));
    dm.qD.Transaction.Commit;
    ShowMessage('IMPORTACION DE PRODUCTOS FINALIZADA');
    Close;
    end;
end;

procedure TMigrarForm.ImportarArticulo;
var
  csv : TStringList;
  fila : TStringList;
  i, j, cb,
  codigo,descripcion,costo,ultcosto,precio1,precio2,precio3,precio4,precio5,
  precio6,precio,porcentaje,ultprecio,marca,color,categoria,subcategoria,
  ubicacion,unidad,disponible,enproduccion,notas,iva, tasa,impotros,iibb,
  stockminimo,stockmaximo, stockvendido,fechacompult,lista,procedencia
  ,codigobarra, rubro,proveedor,garantia,fecha,pedido,stock, existente
  ,actual,marcadocontado,marcadolista,marcadofinal,preparado,ctanombre,
  ctatipo,ctaanticipo,ctaiibb,estado,vence,vencimiento
  : Integer;
  campo : string;
begin
  cb:=0;
  costo:=0;
	try
		csv := TStringList.Create;
		// cargar a partir del fichero csv
//		csv.LoadFromFile(FolderDialog.Directory + 'datos.csv');
    OpenTextFileDialog1.Execute();
		csv.LoadFromFile( OpenTextFileDialog1.FileName );

		fila := TStringList.Create;
    fila.StrictDelimiter := True;
    fila.Delimiter := ',';

//		ProgressBar1.Max := csv.Count -1;

    StringGrid1.Cells[0,0]:='code';
   // fila.CommaText := csv.Strings[0];

    fila.DelimitedText:= csv.Strings[0];
    StringGrid1.ColCount := fila.Count;
    	// recorrer la columna
			for j := 0 to fila.Count -1 do
			begin
//				lista.Items.Add(fila[j]);
        campo:=Trim(fila[j]);
//        if campo='CODIGOBARRA' then cb:=j else if campo='COSTO' then costo:=j;

        Case IndexStr(campo, [
        'CODIGO', 'DESCRIPCION', 'COSTO', 'ULTCOSTO', 'PRECIO1', 'PRECIO2'
        , 'PRECIO3', 'PRECIO4', 'PRECIO5', 'PRECIO6', 'PRECIO', 'PORCENTAJE'
        , 'ULTPRECIO', 'MARCA', 'COLOR', 'CATEGORIA', 'SUBCATEGORIA'
        , 'UBICACION', 'UNIDAD', 'DISPONIBLE', 'ENPRODUCCION', 'NOTAS', 'IVA'
        , 'TASA', 'IMPOTROS', 'IIBB', 'STOCKMINIMO', 'STOCKMAXIMO'
        , 'STOCKVENDIDO', 'FECHACOMPULT', 'LISTA', 'PROCEDENCIA', 'CODIGOBARRA'
        , 'RUBRO', 'PROVEEDOR', 'GARANTIA', 'FECHA', 'PEDIDO', 'STOCK'
        , 'EXISTENTE', 'ACTUAL', 'MARCADOCONTADO', 'MARCADOLISTA'
        , 'MARCADOFINAL', 'PREPARADO', 'CTANOMBRE', 'CTATIPO', 'CTAANTICIPO'
        , 'CTAIIBB', 'ESTADO', 'VENCE', 'VENCIMIENTO']) of
        0 : codigo:=j;
        1 : descripcion:=j;
        2 : costo:=j;
        3 : ultcosto:=j;
        4 : precio1:=j;
        5 : precio2:=j;
        6 : precio3:=j;
        7 : precio4:=j;
        8 : precio5:=j;
        9 : precio6:=j;
        10 : precio:=j;
        11 : porcentaje:=j;
        12 : ultprecio:=j;
        13 : marca:=j;
        14 : color:=j;
        15 : categoria:=j;
        16 : subcategoria:=j;
        17 : ubicacion:=j;
        18 : unidad:=j;
        19 : disponible:=j;
        20 : enproduccion:=j;
        21 : notas:=j;
        22 : iva:=j;
        23 : tasa:=j;
        24 : impotros:=j;
        25 : iibb:=j;
        26 : stockminimo:=j;
        27 : stockmaximo:=j;
        28 : stockvendido:=j;
        29 : fechacompult:=j;
        30 : lista:=j;
        31 : procedencia:=j;
        32 : codigobarra:=j;
        33 : rubro:=j;
        34 : proveedor:=j;
        35 : garantia:=j;
        36 : fecha:=j;
        37 : pedido:=j;
        38 : stock:=j;
        39 : existente:=j;
        40 : actual:=j;
        41 : marcadocontado:=j;
        42 : marcadolista:=j;
        43 : marcadofinal:=j;
        44 : preparado:=j;
        45 : ctanombre:=j;
        46 : ctatipo:=j;
        47 : ctaanticipo:=j;
        48 : ctaiibb:=j;
        49 : estado:=j;
        50 : vence:=j;
        51 : vencimiento:=j;
//        else ShowMessage('Unknown!');
        end;

        StringGrid1.Cells[j,0]:=campo;
			end;

    StringGrid1.RowCount := csv.Count;
		// recorrer las filas
		for i := 1 to csv.Count -1 do
		begin
//			ProgressBar1.Position := i;

//			fila.CommaText := csv.Strings[i];

      fila.DelimitedText:= csv.Strings[i];
      OperacionDataModule.
        ModificarArticulos(
          fila[codigo]
          , fila[descripcion]
          , fila[ultcosto]
          , fila[costo]
          , fila[precio]
          , fila[precio1]
          , fila[precio2]
          , fila[disponible]
          , fila[porcentaje]
          , fila[impotros]
          , fila[unidad]
          , fila[tasa]
          , fila[iibb]
          , fila[ctanombre]
          , fila[ctatipo]
          , fila[ctaanticipo]
          , fila[ctaiibb]
          , fila[fecha]
          , fila[fechacompult]
          , fila[codigobarra]
          , fila[categoria]
          , fila[color]
          , fila[marca]
          , fila[proveedor]
          , fila[rubro]
          , fila[subcategoria]
        );

			// recorrer las columnas
			for j := 0 to fila.Count -1 do
			begin
//				lista.Items.Add(fila[j]);
        campo:=fila[j];
        StringGrid1.Cells[j,i]:=campo;
			end;
		end;
		MessageDlg('Lectura Exitosa..', mtInformation, [mbOK], 0);
  dm.qQ.Transaction.Commit;
	Except
	    on E : Exception do
	    begin
			MessageDlg('Ocurrio un Error: ' + E.Message, mtInformation, [mbOK], 0);
	    end;
	end;
	// liberar la memoria
	csv.Free;
Close;
end;

procedure TMigrarForm.ImportarVenta;
var
  csv : TStringList;
  fila : TStringList;
  i, j,
  codigo,
  letra,
  fecha,
  cliente,
  terminos,
  comprobante,
  remito,
  vendedor,
  excento,
  anulada,
  subtotal,
  descuento,
  impuesto,
  iva1,
  iva2,
  iva3,
  iibb,
  minimp,
  total,
  contado,
  cheque,
  tarjeta,
  otros,
  monedaextranjera,
  meimporte,
  metipocambio,
  saldo,
  pagado,
  descripcion,
  usuario,
  empresa,
  pagare,
  costo,
  deuda,
  comision
  : Integer;
  campo : string;
  n10, n21 : Double;
begin
	try
		csv := TStringList.Create;
		// cargar a partir del fichero csv
//		csv.LoadFromFile(FolderDialog.Directory + 'datos.csv');
    OpenTextFileDialog1.Execute();
		csv.LoadFromFile( OpenTextFileDialog1.FileName );

		fila := TStringList.Create;
    fila.StrictDelimiter := True;
    fila.Delimiter := ',';

//		ProgressBar1.Max := csv.Count -1;

    StringGrid1.Cells[0,0]:='code';
   // fila.CommaText := csv.Strings[0];

    fila.DelimitedText:= csv.Strings[0];
    StringGrid1.ColCount := fila.Count;
    // recorrer la columna
    for j := 0 to fila.Count -1 do
    begin
//				lista.Items.Add(fila[j]);
      campo:=Trim(fila[j]);
//        if campo='CODIGOBARRA' then cb:=j else if campo='COSTO' then costo:=j;

      Case IndexStr(campo, ['CODIGO', 'LETRA', 'FECHA', 'CLIENTE', 'TERMINOS'
      , 'COMPROBANTE', 'REMITO', 'VENDEDOR', 'EXCENTO', 'ANULADA', 'SUBTOTAL'
      , 'DESCUENTO', 'IMPUESTO', 'IVA1', 'IVA2', 'IVA3', 'IIBB', 'MINIMP', 'TOTAL'
      , 'CONTADO', 'CHEQUE', 'TARJETA', 'OTROS', 'MONEDAEXTRANJERA', 'MEIMPORTE'
      , 'METIPOCAMBIO', 'SALDO', 'PAGADO', 'DESCRIPCION', 'USUARIO', 'EMPRESA'
      , 'PAGARE', 'COSTO', 'DEUDA', 'COMISION']) of
      0 : codigo:=j;
      1 : letra:=j;
      2 : fecha:=j;
      3 : cliente:=j;
      4 : terminos:=j;
      5 : comprobante:=j;
      6 : remito:=j;
      7 : vendedor:=j;
      8 : excento:=j;
      9 : anulada:=j;
      10 : subtotal:=j;
      11 : descuento:=j;
      12 : impuesto:=j;
      13 : iva1:=j;
      14 : iva2:=j;
      15 : iva3:=j;
      16 : iibb:=j;
      17 : minimp:=j;
      18 : total:=j;
      19 : contado:=j;
      20 : cheque:=j;
      21 : tarjeta:=j;
      22 : otros:=j;
      23 : monedaextranjera:=j;
      24 : meimporte:=j;
      25 : metipocambio:=j;
      26 : saldo:=j;
      27 : pagado:=j;
      28 : descripcion:=j;
      29 : usuario:=j;
      30 : empresa:=j;
      31 : pagare:=j;
      32 : costo:=j;
      33 : deuda:=j;
      34 : comision:=j;
//        else ShowMessage('Unknown!');
      end;

      StringGrid1.Cells[j,0]:=campo;
    end;

    StringGrid1.RowCount := csv.Count;
		// recorrer las filas
		for i := 1 to csv.Count -1 do
		begin
//			ProgressBar1.Position := i;
//			fila.CommaText := csv.Strings[i];
      fila.DelimitedText:= csv.Strings[i];

      if fila[iva1]='' then fila[iva1]:='0';
      if fila[iva1]='0' then n10 := 0 else n10:=(StrToFloat(fila[iva1])*100)/10.5;
      if fila[iva2]='' then fila[iva2]:='0';
      if fila[iva2]='0' then n21:=0 else n21:=(StrToFloat(fila[iva2])*100)/21;

      if fila[pagare]='1' then fila[pagare]:='True' else fila[pagare]:='False';
//      fila[fecha] := FormatDateTime('mm/dd/yyyy hh:mm:ss', StrToDateTime(fila[fecha]));
      OperacionDataModule.
        ProcVTA(
         PuntoVenta
        , ''//comprobante
        , fila[letra]// let
        , fila[cliente]// cod
        , fila[fecha]// fech
        , fila[vendedor]// ven
        , ''// cui
        , ''// ctan
        , False// pre
        , StrToBool(fila[pagare])// pgr: Boolean;
        , False// impr
        , StrToFloat(fila[costo])// cost
        , StrToFloat(fila[comision])// comv
        , StrToFloat(fila[impuesto])// impu
        , StrToFloat(fila[cheque])// cheq
        , 0// ch3q
        , StrToFloat(fila[contado])// cont
        , StrToFloat(fila[total])// tot
        , StrToFloat(fila[subtotal])// sbt
        , StrToFloat(fila[descuento])// des
        , StrToFloat(fila[tarjeta])// tarj
        , StrToFloat(fila[otros])// otr
        , StrToFloat(fila[saldo])// sal
        , StrToFloat(fila[pagado])// pag
        , 0// int
        , n10
        , n21
        , StrToFloat(fila[iva1])// i10
        , StrToFloat(fila[iva2])// i21
        , StrToFloat(fila[deuda])// deud
        , 0// ulc
        , 0//NGO
        , 0//IVAO
        , 0//Exento
        , 0//noGra
        , 0//pagCueIva
        , 0//pagCueOtr
        , 0//perIIBB
        , 0//perImpMun
        , 0//impInt
        , 0//otrTrib
        );
    {
          fila[codigo]
          , fila[terminos]
          , fila[comprobante]
          , fila[remito]
          , fila[excento]
          , fila[anulada]
          , fila[iva3]
          , fila[iibb]
          , fila[minimp]
          , fila[monedaextranjera]
          , fila[meimporte]
          , fila[metipocambio]
          , fila[descripcion]
          , fila[usuario]
          , fila[empresa]
}
			// recorrer las columnas
			for j := 0 to fila.Count -1 do
			begin
//				lista.Items.Add(fila[j]);
        campo:=fila[j];
        StringGrid1.Cells[j,i]:=campo;
			end;
		end;
		MessageDlg('Lectura Exitosa..', mtInformation, [mbOK], 0);
  dm.qQ.Transaction.Commit;
	Except
	    on E : Exception do
	    begin
			MessageDlg('Ocurrio un Error: ' + E.Message, mtInformation, [mbOK], 0);
	    end;
	end;
	// liberar la memoria
	csv.Free;
Close;
end;

end.
