﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/principal.Master" CodeBehind="Registro_Portal_Sag.aspx.vb" Inherits="MAS_PMSU.Registro_Portal_Sag" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"></h1>
        </div>
    </div>
    <div id="panelmasiso" runat="server">

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    Registro Plan Producciòn Semilla Frijol
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>Seleccione Ciclo:</label>
                                <asp:DropDownList CssClass="form-control" ID="TxtCiclo" runat="server" AutoPostBack="True">
                                    <asp:ListItem>Todos</asp:ListItem>

                                    <asp:ListItem>2023-Ciclo A</asp:ListItem>
                                    <asp:ListItem>2023-Ciclo B</asp:ListItem>
                                    <asp:ListItem>2023-Ciclo C</asp:ListItem>
                                    <asp:ListItem>2024-Ciclo A</asp:ListItem>
                                    <asp:ListItem>2024-Ciclo B</asp:ListItem>
                                    <asp:ListItem>2024-Ciclo C</asp:ListItem>
                                    <asp:ListItem>2025-Ciclo A</asp:ListItem>
                                    <asp:ListItem>2025-Ciclo B</asp:ListItem>
                                    <asp:ListItem>2026-Ciclo C</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>Seleccione Departamento:</label>
                                <asp:DropDownList CssClass="form-control" ID="TxtDepto" runat="server" AutoPostBack="True"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>Seleccione Productor:</label>
                                <asp:DropDownList CssClass="form-control" ID="TxtProductor" runat="server" AutoPostBack="True"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="table-responsive">
                                <h3>
                                    <span style="float: right;"><small># Lotes:</small>
                                        <asp:Label ID="lblTotalClientes" runat="server" CssClass="label label-warning" /></span>
                                </h3>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                                <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn_REDPASH %>" ProviderName="<%$ ConnectionStrings:conn_REDPASH.ProviderName %>"></asp:SqlDataSource>
                                <asp:GridView ID="GridDatos" runat="server" CellPadding="4" ForeColor="#333333" Width="100%"
                                    GridLines="None" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-bordered table-hover" DataSourceID="SqlDataSource1" Font-Size="Small">
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <EmptyDataRowStyle ForeColor="Red" CssClass="table table-bordered" />
                                    <EmptyDataTemplate>
                                        ¡No hay bancos inscritos!
                                    </EmptyDataTemplate>
                                    <%--Paginador...--%>
                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                    <PagerTemplate>
                                        <div class="row" style="margin-top: 8px;">
                                            <div class="col-lg-1" style="text-align: right;">
                                                <h5>
                                                    <asp:Label ID="MessageLabel" Text="Ir a la pág." runat="server" /></h5>
                                            </div>
                                            <div class="col-lg-1" style="text-align: left;">
                                                <asp:DropDownList ID="PageDropDownList" Width="80px" AutoPostBack="true" OnSelectedIndexChanged="PageDropDownList_SelectedIndexChanged" runat="server" CssClass="form-control" /></h3>
                                            </div>
                                            <div class="col-lg-10" style="text-align: right;">
                                                <h3>
                                                    <asp:Label ID="CurrentPageLabel" runat="server" CssClass="label label-warning" /></h3>
                                            </div>
                                        </div>
                                    </PagerTemplate>
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>

                                        <asp:BoundField DataField="ID">
                                            <HeaderStyle CssClass="hide" />
                                            <ItemStyle CssClass="hide" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Departamento" HeaderText="DEPARTAMENTO" />
                                        <asp:BoundField DataField="Productor" HeaderText="PRODUCTOR" />
                                        <asp:BoundField DataField="CICLO" HeaderText="CICLO" />
                                        <asp:BoundField DataField="VARIEDAD" HeaderText="VARIEDAD" />
                                        <asp:BoundField DataField="CATEGORIA" HeaderText="CATEGORIA" />
                                       

                                        <%--<asp:BoundField DataField="Habilitado" HeaderText="HABILITADO" />--%>

                                        <asp:ButtonField ButtonType="Button" Text="EDITAR PLAN" ControlStyle-CssClass="btn btn-success" HeaderText="EDITAR PLAN" CommandName="Editar">
                                            <ControlStyle CssClass="btn btn-info"></ControlStyle>
                                        </asp:ButtonField>
                                        <asp:ButtonField ButtonType="Button" Text="INSCRIPCION SENASA" ControlStyle-CssClass="btn btn-danger" HeaderText="INSCRIBIR LOTE" CommandName="Eliminar">
                                            <ControlStyle CssClass="btn btn-danger"></ControlStyle>
                                        </asp:ButtonField>
                                    </Columns>
                                    <EditRowStyle BackColor="#7C6F57" />
                                    <RowStyle BackColor="#E3EAEB" />
                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <%--<asp:Button ID="Button1" runat="server" Text="Exportar Datos" CssClass="btn btn-success" />--%>
                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-warning" Text="Exportar Datos"><span class="glyphicon glyphicon-save"></span>&nbsp;Exportar Datos</asp:LinkButton>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            -----------------------------
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <script type="text/javascript" src='../vendor/jquery/jquery-1.8.3.min.js'></script>
                            <asp:Button ID="BAgregar" runat="server" Text="Agregar Inscripcion" CssClass="btn btn-success" />
                        </div>
                    </div>

                    <div class="modal fade" id="DeleteModal" tabindex="-1" role="dialog" aria-labelledby="ModalTitle2"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <%--  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                    &times;</button>--%>
                                    <h4 class="modal-title" id="ModalTitle2">MAS 2.0 - DICTA - MSU</h4>
                                </div>
                                <div class="modal-body">
                                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div class="modal-footer" style="text-align: center">
                                    <asp:Button ID="BConfirm" Text="Aceptar" Width="80px" runat="server" Class="btn btn-primary" />
                                    <asp:Button ID="BBorrarsi" Text="SI" Width="80px" runat="server" Class="btn btn-primary" />
                                    <asp:Button ID="BBorrarno" Text="NO" Width="80px" runat="server" Class="btn btn-primary" />
                                    <%--<asp:Button ID="Button2" Text="Salir" Width="80px" runat="server" Class="btn btn-primary" />--%>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="DeleteModal2" tabindex="-1" role="dialog" aria-labelledby="ModalTitle2"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title" id="ModalTitle3">MAS 2.0 - TNS</h4>
                                </div>
                                <div class="modal-body">
                                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div class="modal-footer" style="text-align: center">
                                    <asp:Button ID="BConfirm2" Text="Aceptar" Width="80px" runat="server" Class="btn btn-primary" />
                                </div>
                            </div>
                        </div>
                    </div>
                   
                    <div class="modal fade" id="AdInscrip" tabindex="-1" role="dialog" aria-labelledby="ModalTitle"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;</button>
                                    <h4 class="modal-title" id="ModalTitle8">Detalle del lote sembrado</h4>
                                </div>
                                <div class="modal-body">
                                    <asp:TextBox ID="TxtID" runat="server" Visible="False"></asp:TextBox>
                                    <asp:TextBox ID="txt_habilitado" runat="server" Visible="False"></asp:TextBox>
                                    <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>

                                    <asp:TextBox ID="TxtTabla" runat="server" Visible="False"></asp:TextBox>
                                    <%--<asp:CheckBox ID="CheckBox1" runat="server" Visible="False" />--%>
                                    <br />
                                    <label for="TxtNom3">
                                        Nombre del Productor</label>
                                    <asp:TextBox ID="TxtNom" runat="server" ReadOnly="true" CssClass="form-control" autocomplete="off" />
                                    <br />
                                    <label for="Txtciclo">
                                        Ciclo</label>
                                    <asp:TextBox ID="TxtCicloD" runat="server" ReadOnly="true" CssClass="form-control" autocomplete="off" />
                                    <br />
                                    <label for="TxtVariedad">
                                        Variedad</label>
                                    <asp:DropDownList CssClass="form-control" ID="TxtVariedad" runat="server">
                                        <asp:ListItem>PM-2</asp:ListItem>
                                        <asp:ListItem>Amadeus-77</asp:ListItem>
                                        <asp:ListItem>HONDURAS NUTRITIVO</asp:ListItem>
                                        <asp:ListItem>CARRIZALITO</asp:ListItem>
                                        <asp:ListItem>DEOHRO</asp:ListItem>
                                        <asp:ListItem>AZABACHE 40</asp:ListItem>
                                        <asp:ListItem>Inta Cárdenas</asp:ListItem>
                                        <asp:ListItem>Lenca precoz</asp:ListItem>
                                        <asp:ListItem>Rojo Chorti</asp:ListItem>
                                        <asp:ListItem>Tolupan Rojo</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    <label for="TxtCategoria">
                                        Categoria</label>
                                    <asp:DropDownList CssClass="form-control" ID="TxtCategoria" runat="server">
                                        <asp:ListItem>Certificada</asp:ListItem>
                                        <asp:ListItem>Comercial</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    <label for="TxtQuintales">
                                        Area a Semabrar En MZ.</label>
                                    <asp:TextBox ID="TxT_AreaMZ" runat="server" CssClass="form-control"   AutoPostBack="False" onchange="calculateAreaHa();" />
                                  
                                    
                                    <label for="Txt_AreaHa">
                                        Area a Sembrar En HA</label>
                                    <asp:TextBox ID="Txt_AreaHa" runat="server" CssClass="form-control" AutoPostBack="True" ReadOnly="True" />
                                    <br />

                           <%--     esta funcion es de tipo javascript , con documentid agarra los valores de los textbox--%>
                                 <script type="text/javascript">
                                     function calculateAreaHa() {
                                         var areaMZ = parseFloat(document.getElementById('<%= TxT_AreaMZ.ClientID %>').value);
                                                var total = areaMZ * 0.6988;
                                             document.getElementById('<%= Txt_AreaHa.ClientID %>').value = total.toFixed(2);
                                     }
                                 </script>
                                    <label for="TxtFecha">Fecha que siembrarà:</label>
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <div class="form-group">
                                                <label>Dia</label>
                                                <asp:DropDownList CssClass="form-control" ID="TxtDia" runat="server">
                                                    <asp:ListItem>1</asp:ListItem>
                                                    <asp:ListItem>2</asp:ListItem>
                                                    <asp:ListItem>3</asp:ListItem>
                                                    <asp:ListItem>4</asp:ListItem>
                                                    <asp:ListItem>5</asp:ListItem>
                                                    <asp:ListItem>6</asp:ListItem>
                                                    <asp:ListItem>7</asp:ListItem>
                                                    <asp:ListItem>8</asp:ListItem>
                                                    <asp:ListItem>9</asp:ListItem>
                                                    <asp:ListItem>10</asp:ListItem>
                                                    <asp:ListItem>11</asp:ListItem>
                                                    <asp:ListItem>12</asp:ListItem>
                                                    <asp:ListItem>13</asp:ListItem>
                                                    <asp:ListItem>14</asp:ListItem>
                                                    <asp:ListItem>15</asp:ListItem>
                                                    <asp:ListItem>16</asp:ListItem>
                                                    <asp:ListItem>17</asp:ListItem>
                                                    <asp:ListItem>18</asp:ListItem>
                                                    <asp:ListItem>19</asp:ListItem>
                                                    <asp:ListItem>20</asp:ListItem>
                                                    <asp:ListItem>21</asp:ListItem>
                                                    <asp:ListItem>22</asp:ListItem>
                                                    <asp:ListItem>23</asp:ListItem>
                                                    <asp:ListItem>24</asp:ListItem>
                                                    <asp:ListItem>25</asp:ListItem>
                                                    <asp:ListItem>26</asp:ListItem>
                                                    <asp:ListItem>27</asp:ListItem>
                                                    <asp:ListItem>28</asp:ListItem>
                                                    <asp:ListItem>29</asp:ListItem>
                                                    <asp:ListItem>30</asp:ListItem>
                                                    <asp:ListItem>31</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label>Mes</label>
                                                <asp:DropDownList CssClass="form-control" ID="TxtMes" runat="server">
                                                    <asp:ListItem>Enero</asp:ListItem>
                                                    <asp:ListItem>Febrero</asp:ListItem>
                                                    <asp:ListItem>Marzo</asp:ListItem>
                                                    <asp:ListItem>Abril</asp:ListItem>
                                                    <asp:ListItem>Mayo</asp:ListItem>
                                                    <asp:ListItem>Junio</asp:ListItem>
                                                    <asp:ListItem>Julio</asp:ListItem>
                                                    <asp:ListItem>Agosto</asp:ListItem>
                                                    <asp:ListItem>Septiembre</asp:ListItem>
                                                    <asp:ListItem>Octubre</asp:ListItem>
                                                    <asp:ListItem>Noviembre</asp:ListItem>
                                                    <asp:ListItem>Diciembre</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label>Año</label>
                                                <asp:DropDownList CssClass="form-control" ID="TxtAno" runat="server">
                                                    <asp:ListItem>2018</asp:ListItem>
                                                    <asp:ListItem>2019</asp:ListItem>
                                                    <asp:ListItem>2020</asp:ListItem>
                                                    <asp:ListItem>2021</asp:ListItem>
                                                    <asp:ListItem>2022</asp:ListItem>
                                                    <asp:ListItem>2023</asp:ListItem>
                                                    <asp:ListItem>2024</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                       <br />
                                    <label for="TxtRegistradaQQ">
                                        Requerimiento de semilla registrada QQ</label>
                                    <asp:TextBox ID="TxtRegistradaQQ" runat="server" CssClass="form-control" onkeypress="return numericOnly(this);" autocomplete="off" />
                                    <br />
                                
                                     <label for="TxtCantLotes">
                                        Cantidad de lotes a sembrar</label>
                                    <asp:TextBox ID="TxtCantLotes" runat="server" CssClass="form-control" onkeypress="return numericOnly(this);" autocomplete="off" />
                                        <br />
                             
                                     <label for="txtNombreFinca">
                                        Nombre o No. del lote dentro de la finca</label>                           
                                    <asp:TextBox ID="txtNombreFinca" runat="server" CssClass="form-control"></asp:TextBox>
                                     <br />
                                   
                                      <label for="TxtProduccionQQMZ">
                                        Estimado de producción en campo QQ/MZ</label>                           
                                    <asp:TextBox ID="TxtProduccionQQMZ" runat="server" CssClass="form-control" AutoPostBack="False" onchange="calculateAreaHaPRO();"></asp:TextBox>
                                     <br />
                            
                                    <label for="TxtProduccionQQHA">
                                        Estimado de producción en campo QQ/HA</label>                           
                                    <asp:TextBox ID="TxtProduccionQQHA" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                                    <script type="text/javascript">
                                        function calculateAreaHaPRO() {
                                            var areaMZ = parseFloat(document.getElementById('<%= TxtProduccionQQMZ.ClientID %>').value);
                                            var areaHA = parseFloat(document.getElementById('<%= Txt_AreaHa.ClientID %>').value);
                                            var total = areaMZ / areaHA;
                                                  document.getElementById('<%= TxtProduccionQQHA.ClientID %>').value = total.toFixed(2);
                                        }
                                    </script>
                                     <br />
                                  
                                      <label for="TxtSemillaQQ">
                                        Estimado semilla a producir QQ.</label>                           
                                    <asp:TextBox ID="TxtSemillaQQ" runat="server" CssClass="form-control" AutoPostBack="False" onchange="calculateAreaHaEs();"></asp:TextBox>
                                     <br />
                                
                                     <label for="TxtEstimadoProducir">
                                       Estimado semilla a producir QQ/HA</label>                           
                                    <asp:TextBox ID="TxtEstimadoProducir" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                                 <script type="text/javascript">
                                     var calculatedTotal = 0; // Declarar la variable para almacenar el total calculado

                                     function calculateAreaHaEs() {
                                         var areaMZ = parseFloat(document.getElementById('<%= TxtSemillaQQ.ClientID %>').value);
                                         var areaHA = parseFloat(document.getElementById('<%= Txt_AreaHa.ClientID %>').value);
                                            calculatedTotal = areaMZ / areaHA; // Guardar el total en la variable
                                         document.getElementById('<%= TxtEstimadoProducir.ClientID %>').value = calculatedTotal.toFixed(2);
                                     }
                                 </script>
                                     <br />
                                 
                                    <script type="text/javascript">
                                        function numericOnly(elementRef) {
                                            var keyCodeEntered = (event.which) ? event.which : (window.event.keyCode) ? window.event.keyCode : -1;

                                            // Un-comment to discover a key that I have forgotten to take into account...
                                            //alert(keyCodeEntered);

                                            if ((keyCodeEntered >= 48) && (keyCodeEntered <= 57)) {
                                                return true;
                                            }
                                            // '+' sign...
                                            //else if (keyCodeEntered == 43) {
                                            //    // Allow only 1 plus sign ('+')...
                                            //    if ((elementRef.value) && (elementRef.value.indexOf('+') >= 0))
                                            //        return false;
                                            //    else
                                            //        return true;
                                            //}
                                            //    // '-' sign...
                                            //else if (keyCodeEntered == 45) {
                                            //    // Allow only 1 minus sign ('-')...
                                            //    if ((elementRef.value) && (elementRef.value.indexOf('-') >= 0))
                                            //        return false;
                                            //    else
                                            //        return true;
                                            //}
                                            // '.' decimal point...
                                            else if (keyCodeEntered == 46) {
                                                // Allow only 1 decimal point ('.')...
                                                if ((elementRef.value) && (elementRef.value.indexOf('.') >= 0))
                                                    return false;
                                                else
                                                    return true;
                                            }

                                            return false;
                                        }
                                    </script>
                                    <div id="Div5" runat="server" visible="false" class="alert alert-danger">
                                        <strong>Error!</strong>
                                        <asp:Label ID="Label6" runat="server" />
                                    </div>
                                </div>
                                <div class="modal-footer" style="text-align: center">
                                    <asp:Button ID="BGuardar" Text="Guardar" Width="80px" runat="server" Class="btn btn-primary" />
                                    <asp:Button ID="BSalir" Text="Salir" Width="80px" runat="server" Class="btn btn-primary" />
                                </div>

                                <%-- <script>
                                      $(function () {

                                          $("#<%=TxtProductor.ClientID%>").select2();

          })
                                  </script>--%>
                            </div>
                        </div>
                    </div>
                     
                </div>
            </div>
        </div>
    </div>

</div>

       
        <ContentTemplate>
        
            <div id="div_nuevo_prod" runat="server">

                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"></h1>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <asp:Label ID="laBEL2" runat="server" Text=""></asp:Label>INSCRIPCIÒN 

                                    <asp:TextBox ID="TextBox2" Visible="false" runat="server"></asp:TextBox>
                                    <asp:TextBox ID="TextBox3" Visible="false" runat="server"></asp:TextBox>
                                    <asp:TextBox ID="TextBox4" Visible="false" runat="server"></asp:TextBox>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                          
                                                 <div class="form-group">
                                               <h3>Subir archivos</h3>
                                                <br />
                                                <div class="mb-3">
                                                <label for="FileUploadSemilla" class="form-label">Tipo de semilla recibida para sembrar el lote de producción:</label>
                                                    <asp:DropDownList CssClass="form-control" ID="CmbTipoSemilla" runat="server" AutoPostBack="False">
                                                            <asp:ListItem Text=""></asp:ListItem>
                                                            <asp:ListItem id="registrada" Text="Registrada"></asp:ListItem>
                                                            <asp:ListItem id="certificada" Text="Certificada"></asp:ListItem>
                                                            <asp:ListItem id="comercial" Text="Comercial"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                 <br />
                                                 <div class="mb-3">
                                                   <label for="FileUploadFicha" class="form-label">Ficha de inscripción de lote o campos para la producción de semilla</label>
                                                 <asp:FileUpload ID="FileUploadFicha" runat="server" class="form-control" />
                                                 </div>
                                                <br />
                                               <div class="mb-3">
                                                  <label for="FileUploadPagoTGR" class="form-label">Pago de TGR:</label>
                                                 <asp:FileUpload ID="FileUploadPagoTGR" runat="server" class="form-control" />
                                                     </div>
                                                            <br />
                                  
                                                 <label for="TxtSemillaQQ">
                                                 Etiqueta De Semilla Registrada</label>                           
                                                   <asp:FileUpload ID="FileUploadEtiquetaSemilla" runat="server" class="form-control" />
                                                   <br />
                                            <asp:Button ID="BtnUpload" runat="server" Text="Guardar" OnClick="BtnUpload_Click" AutoPostBack="True" class="btn btn-primary" />
                                                     <asp:Button ID="Button1" runat="server" Text="Regresar"  AutoPostBack="True" class="btn btn-warning" />
                                                     <hr />
                                               
                                          
            </div>
        </div>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </ContentTemplate>
   
    

</asp:Content>