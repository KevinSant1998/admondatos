<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ProyectoU.Forms.Solicitudes.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Bandeja Notas</title>
    <link href="/CSS/Content/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/CSS/Content/css/icons.css" rel="stylesheet" />
    <link href="/CSS/Content/css/style.css?v=202010031105" rel="stylesheet" />
    <link href="/Scripts/plugins/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" />
    <link href="/Scripts/plugins/datatables/buttons.bootstrap4.min.css" rel="stylesheet" />
    <link href="/Scripts/plugins/datatables/responsive.bootstrap4.min.css" rel="stylesheet" />
    <link href="/Scripts/plugins/iziToast/css/iziToast.min.css" rel="stylesheet" />
    <link href="/Scripts/plugins/select2/css/select2.min.css" rel="stylesheet" />
    <link href="/Scripts/plugins/datapicker/datepicker3.css" rel="stylesheet" />
    <link href="/Scripts/plugins/unitegallery/css/unitegallery.min.css" rel="stylesheet" />
    <link href="/Scripts/plugins/unitegallery/themes/default/ug-theme-default.css" rel="stylesheet" />
    <link href="/CSS/Content/css/font/font-fileuploader.css" rel="stylesheet" />
    <link href="/CSS/Content/css/jquery.fileuploader.min.css" rel="stylesheet" />
    <link href="/CSS/Content/css/jquery.fileuploader-theme-dragdrop.css" rel="stylesheet" />
    <link href="/CSS/Estilos_CSS.css" rel="stylesheet" />
    <style>
        .cursor-pointer {
            cursor: pointer;
        }

        #datatable-bandeja tbody tr {
            cursor: pointer;
        }

        #datatable-bandeja tbody td {
            outline: none;
            padding-top: 0 !important;
            padding-bottom: 0 !important;
        }

        div.dt-buttons {
            position: relative;
            float: left;
        }

        #divContenedor_datatableButtons div .dropdown-menu {
            overflow-y: auto;
            max-height: 300px !important;
        }

        table.datatable-cells-responsive tbody td.td-responsive {
            max-width: 200px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

            table.datatable-cells-responsive tbody td.td-responsive:hover {
                overflow: visible;
                white-space: inherit;
            }

        meter {
            -moz-appearance: none;
            width: 400px;
            height: 30px;
        }

            meter::after {
                content: attr(value)"%";
                top: -23px;
                left: 40px;
                position: relative;
            }
    </style>
</head>
<body class="EstiloBody-Listado">
    <form runat="server" id="BandejaRequerimiento" class="" action="#" data-parsley-excluded="[disabled]">
        <div class="card">
            <div class="card-header" style="background-color: black">
                <div class="row justify-content-between">
                    <div class="float-right p-1" id="Loader" style="display: none;">
                        <div class="spinner-border" role="status">
                            <span class="sr-only"></span>
                        </div>
                    </div>
                    <div class="col-auto">
                        <h6 style="color: white">Bandeja Universidad</h6>
                        <small runat="server" id="lblMensajeError" class="text-danger"></small>
                    </div>
                </div>
            </div>

            <div class="card-body">

                <div class="row mb-1">
                    <div class="col-sm-2 col-2 align-self-end">
                        <button type="button" id="btnCrearEmpleado" class="btn btn-block btn-info">
                            <i class="fas fa-plus"></i>
                            Crear Empleado
                        </button>
                    </div>
                    <%--<div class="col-sm-2 col-2 align-self-end">
                        <button type="button" id="btnCrearEstudiante" class="btn btn-block btn-info">
                            <i class="fas fa-plus"></i>
                            Crear Estudiante
                        </button>
                    </div>
                    <div class="col-sm-2 col-2 align-self-end">
                        <button type="button" id="btnCrearMateria" class="btn btn-block btn-info">
                            <i class="fas fa-plus"></i>
                            Crear Materia
                        </button>
                    </div>
                    <div class="col-sm-2 col-2 align-self-end">
                        <button type="button" id="btnCrearSeccion" class="btn btn-block btn-info">
                            <i class="fas fa-plus"></i>
                            Crear Seccion
                        </button>
                    </div>
                    <div class="col-sm-2 col-2 align-self-end">
                        <button type="button" id="btnMatricula" class="btn btn-block btn-info">
                            <i class="fas fa-plus"></i>
                            Crear Matricula
                        </button>
                    </div>
                    <div class="col-sm-2 col-2 align-self-end">
                        <button type="button" id="btnCrearAsignacion" class="btn btn-block btn-info">
                            <i class="fas fa-plus"></i>
                            Crear Asignacion
                        </button>
                    </div>--%>
                    <%--                    <div class="col-lg-3 col-md-3 col-sm-6 col-6 ">
                        <div id="divContenedor_datatableButtons"></div>
                    </div>--%>
                </div>
                
                <div class="table-responsive">
                    <table id="datatable-bandeja" class="table table-bordered table-sm table-hover dataTable datatable-cells-responsive" style="width: 100%" role="grid">
                        <thead>
                            <tr>
                                <th>Nombre Estudiante</th>
                                <th>Telefono | Correo</th>
                                <th>Fecha Inicio</th>
                                <th>Becado</th>
                                <th>Estado</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                        <tfoot>
                        </tfoot>
                    </table>
                </div>
                <br />
                

                <div class="table-responsive">
                    <table id="datatable-bandejaCerrados" class="table table-bordered table-sm table-hover dataTable datatable-cells-responsive" style="width: 100%" role="grid">
                        <thead>
                            <tr>
                                <th>Nombre Empleado</th>
                                <th>Telefono | Correo</th>
                                <th>Puesto Empleado</th>
                                <th>Suledo</th>
                                <th>Activo</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                        <tfoot>
                        </tfoot>
                    </table>
                </div>
                 <br />
                

                <%--<div class="table-responsive">
                    <table id="datatable-bandejaMatricula" class="table table-bordered table-sm table-hover dataTable datatable-cells-responsive" style="width: 100%" role="grid">
                        <thead>
                            <tr>
                                <th>ID Matricula | Fecha</th>
                                <th>Seccion | Materia</th>
                                <th>Docente</th>
                                <th>Estudiante</th>
                                <th>Nota</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                        <tfoot>
                        </tfoot>
                    </table>
                </div>

                <div class="table-responsive">
                    <table id="datatable-bandejaAsignacion" class="table table-bordered table-sm table-hover dataTable datatable-cells-responsive" style="width: 100%" role="grid">
                        <thead>
                            <tr>
                                <th>ID Asignacion |Nombre Asignacion</th>
                                <th>Descripcion</th>
                                <th>Seccion</th>
                                <th>Activo</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                        <tfoot>
                        </tfoot>
                    </table>
                </div>--%>

            </div>
        </div>
        <!-- modal Agregar Requerimiento  -->



        <div id="modalComentarioResolucion" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="modalComentarioResolucionLAbel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title mt-0" id="modalComentarioResolucionLAbel">Crear Empleado</h5>

                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group row mb-4">

                            <div class="col-sm-4">
                                <label class="col-form-label">Nombre</label>
                                <asp:TextBox ID="txtNombreEmpleado" CssClass="form-control form-control-sm " type="text" required="required" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-sm-4">
                                <label class="col-form-label">Telefono</label>
                                <asp:TextBox ID="txtTelefonoEmpleado" CssClass="form-control form-control-sm " type="text" required="required" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-sm-4">
                                <label class="col-form-label">Correo</label>
                                <asp:TextBox ID="txtCorreoEmpleado" CssClass="form-control form-control-sm " type="text" required="required" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-sm-4">
                                <label class="col-form-label">Dirreccion</label>
                                <asp:TextBox ID="txtDireccionEmpleado" CssClass="form-control form-control-sm " type="text" required="required" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-sm-4">
                                <label class="col-form-label">ID Tipo Empleado</label>
                                <asp:TextBox ID="txtTipoEmpleado" CssClass="form-control form-control-sm " type="text" required="required" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-sm-4">
                                <label class="col-form-label">Sueldo</label>
                                <asp:TextBox ID="txtSueldoEmpleado" CssClass="form-control form-control-sm " type="text" required="required" runat="server"></asp:TextBox>
                            </div>
                            
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="btnConfirmarEmpleado" class="btn btn-success waves-effect">
                            Crear Empleado
                        </button>
                        <button type="button" data-dismiss="modal" class="btn btn-secondary waves-effect">
                            Cerrar
                        </button>
                    </div>
                </div>
            </div>
        </div>


    </form>

    <script src="/Scripts/js/jquery.min.js"></script>
    <script src="/Scripts/js/bootstrap.bundle.min.js"></script>
    <script src="/Scripts/plugins/iziToast/js/iziToast.min.js"></script>
    <script src="/Scripts/plugins/parsleyjs/parsley.js"></script>
    <!-- datatable js -->
    <script src="/Scripts/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="/Scripts/plugins/datatables/dataTables.bootstrap4.min.js"></script>
    <!-- Buttons -->
    <script src="/Scripts/plugins/datatables/dataTables.buttons.min.js"></script>
    <script src="/Scripts/plugins/datatables/buttons.bootstrap4.min.js"></script>
    <script src="/Scripts/plugins/datatables/jszip.min.js"></script>
    <script src="/Scripts/plugins/datatables/pdfmake.min.js"></script>
    <script src="/Scripts/plugins/datatables/vfs_fonts.js"></script>
    <script src="/Scripts/plugins/datatables/buttons.html5.min.js"></script>
    <script src="/Scripts/plugins/datatables/buttons.print.min.js"></script>
    <script src="/Scripts/plugins/datatables/buttons.colVis.min.js"></script>
    <!-- Responsive -->
    <script src="/Scripts/plugins/datatables/dataTables.responsive.min.js"></script>
    <script src="/Scripts/plugins/datatables/responsive.bootstrap4.min.js"></script>
    <script src="/Scripts/plugins/select2/js/select2.full.min.js"></script>
    <script src="/Scripts/plugins/datapicker/bootstrap-datepicker.js"></script>
    <script src="/Scripts/plugins/moment/moment.js"></script>
    <script src="/Scripts/plugins/moment/moment-with-locales.min.js"></script>
    <script src="/Scripts/plugins/unitegallery/js/unitegallery.min.js"></script>
    <script src="/Scripts/plugins/unitegallery/themes/default/ug-theme-default.js"></script>
    <script>
        const iconoExito = '<i class="mdi mdi-check-circle mdi-24px text-success p-0"><label style="display:none;">iconoExito</label></i>';
        const iconoPendiente = '<i class="mdi mdi-check-circle mdi-24px text-secondary p-0"><label style="display:none;">iconoPendiente</label></i>';
        const iconoPendienteCampoVisita = '<i class="mdi mdi-alert mdi-24px text-warning p-0"><label style="display:none;">iconoPendiente</label></i>';
        const iconoRojo = '<i class="mdi mdi mdi-close-circle mdi-24px text-danger p-0"></i>';
        const procesoPendiente = "/Date(-2208967200000)/";
        var idCliente = 0;
        var idSolicitud = 0;
        var filtroActual = "";
        var idRequerimiento = 0;

        $(document).ready(function () {


            CargarLista();

           

        });
        function CargarLista() {
            dtBandeja.ajax.reload().draw(false);
            /* busqueda por Estado*/


            

            $("#datatable-bandeja tbody").on("click", "tr", function () {
                let row = dtBandeja.row(this).data();
                idRequerimiento = row.fiIDRequerimiento;
                //idGarantia = row.IdGarantia;
                //idSolicitud = row.IdSolicitud;
                //idExpediente = row.IdExpediente;

            });
            $("#datatable-bandejaCerrados tbody").on("click", "tr", function () {
                let row = dtBandejaCerrados.row(this).data();
                idRequerimiento = row.fiIDRequerimiento;
                //idGarantia = row.IdGarantia;
                //idSolicitud = row.IdSolicitud;
                //idExpediente = row.IdExpediente;

            });
            // FiltrarSolicitudesMesActual();
        }


        var dtBandeja = $('#datatable-bandeja').DataTable({
            "pageLength": 10,
            "aaSorting": [],
            "dom": "<'row'<'col-sm-12'B>>" +
                "<'row'<'col-sm-12'tr>>" +
                "<'row'<'col-sm-6'i><'col-sm-6'p>>",
            "language": {
                "sProcessing": "Cargando información...",
                "sLengthMenu": "Mostrar _MENU_ registros",
                "sZeroRecords": "No se encontraron resultados",
                "sEmptyTable": "Ningún dato disponible en esta tabla",
                "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                "sInfoPostFix": "",
                "sSearch": "Buscar:",
                "sUrl": "",
                "sInfoThousands": ",",
                "sLoadingRecords": "Cargando información...",
                "oPaginate": {
                    "sFirst": "Primero",
                    "sLast": "Último",
                    "sNext": "Siguiente",
                    "sPrevious": "Anterior"
                },
                "oAria": {
                    "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                    "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                },
                "decimal": ".",
                "thousands": ",",
                buttons: {
                    copyTitle: 'Copiado al portapapeles',
                    copySuccess: {
                        _: '%d Lineas copiadas',
                        1: '1 linea copiada'
                    }
                }
            },
            "ajax": {
                type: "POST",
                url: "Index.aspx/CargarEstudiantes",
                contentType: 'application/json; charset=utf-8',
                data: function (dtParms) {

                    return JSON.stringify({ IdEstudiante: 1 });
                },
                "dataSrc": function (json) {
                    var return_data = json.d;
                    return return_data;
                }
            },
            "columns": [

                {//0
                    "data": "fiIDEstudiante", "className": "text-center",
                    "render": function (data, type, row) {
                        return row["fiIDEstudiante"] + " | " + row["fcNombre"];
                        //return '<div class="dropdown mo-mb-2">' +
                        //    '<button class="btn pt-0 pb-0 mt-0 mb-0" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" aria-label="Opciones"><i class="fa fa-bars"></i></button >' +
                        //    '<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">' +
                        //    //'<button type="button" class="dropdown-item" id="btnAbrirCapturaRequerimiento" onclick="RedirigirAccion(' + "'RegistrarRequerimiento.aspx'" + ',' + "'Registrar Requerimiento'" + ')" aria-label="Detalles"><i class="far fa-file-alt"></i>Agregar Requerimiento</button>' +
                        //    '<button type="button" class="dropdown-item" id="btnModuloActualizarRequerimiento" onclick="RedirigirAccion(' + "'RequerimientoActualizar.aspx'" + ',' + "'Actualizar Requerimiento'" + ')" aria-label="Detalles"><i class="far fa-file-alt"></i>Actualizar Requerimiento</button>' +
                        //    //'<button type="button" class="dropdown-item" id="btnAbrirDetalles" onclick="AbrirReporte(' + row["fiIDRequerimiento"] + ')" aria-label="Detalles"><i class="far fa-file-alt"></i> Ver detalles</button>' +
                        //    //(row["UsuarioPermiso"] == true ? `<button type="button" class="dropdown-item" id="btnAbrirDetalleCancelado" onclick="AbrirDetalleCancelado(${row["IdExpediente"]} , ${row["IdSolicitud"]} , '${row["NombreCliente"]}','${row["NombreOficial"]}','${row["Estado"]}', ${row["IdAbogado"]}, ${row["IDEstado"]})" aria-label="Detalles"><i class="far fa-file-alt"></i> detalles cancelados</button>` : '') +
                        //    '</div>' +
                        //    '</div >';
                    }
                },
                {
                    "data": "fcTelefono", "className": "td-responsive",
                    "render": function (data, type, row) {
                        return row["fcTelefono"] + " | " + row["fcCorreo"];
                    }
                },
                {
                    "data": "fdFechaInicio", "className": "td-responsive",
                    "render": function (data, type, row) {

                        return moment(row["fdFechaInicio"]).locale('es').format('YYYY/MM/DD hh:mm a');
                    }
                },
                {
                    "data": "fnBecado", "className": "td-responsive",
                    "render": function (data, type, row) {

                        return row["fnBecado"];
                    }
                },
                {
                    "data": "fnActivo", "className": "td-responsive",
                    "render": function (data, type, row) {

                        return row["fnActivo"];
                    }
                },

            ],
            buttons: [
                //{
                //    extend: 'excelHtml5',
                //    text: '<i class="far fa-file-excel"></i> Exportar',
                //    title: 'Solicitudes_de_credito_' + moment(),
                //    autoFilter: true,
                //    messageTop: 'Solicitudes de crédito ' + moment().format('YYYY/MM/DD'),
                //    exportOptions: {
                //        columns: [1, 2, 3, 4, 5]
                //    }
                //},
                //{
                //    extend: 'colvis',
                //    text: '<i class="mdi mdi-table-column-remove"></i> Columnas',
                //    columns: [0, 1, 2, 3, 4, ] // columnas que pueden ocultarse y mostrarse, por indice para mejorar el tiempo de carga, por className es mas intuitivo toggle-visible-active
                //},
                //{
                //    extend: 'print',
                //    text: '<i class="fas fa-print"></i> Imprimir',
                //    autoFilter: true,
                //    exportOptions: {
                //        columns: [1, 2, 3, 4, 5]
                //    }
                //},
            ],
            columnDefs: [

            ]

        });

        var dtBandejaCerrados = $('#datatable-bandejaCerrados').DataTable({
            "pageLength": 6,
            "aaSorting": [],
            "dom": "<'row'<'col-sm-12'B>>" +
                "<'row'<'col-sm-12'tr>>" +
                "<'row'<'col-sm-6'i><'col-sm-6'p>>",
            "language": {
                "sProcessing": "Cargando información...",
                "sLengthMenu": "Mostrar _MENU_ registros",
                "sZeroRecords": "No se encontraron resultados",
                "sEmptyTable": "Ningún dato disponible en esta tabla",
                "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                "sInfoPostFix": "",
                "sSearch": "Buscar:",
                "sUrl": "",
                "sInfoThousands": ",",
                "sLoadingRecords": "Cargando información...",
                "oPaginate": {
                    "sFirst": "Primero",
                    "sLast": "Último",
                    "sNext": "Siguiente",
                    "sPrevious": "Anterior"
                },
                "oAria": {
                    "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                    "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                },
                "decimal": ".",
                "thousands": ",",
                buttons: {
                    copyTitle: 'Copiado al portapapeles',
                    copySuccess: {
                        _: '%d Lineas copiadas',
                        1: '1 linea copiada'
                    }
                }
            },
            "ajax": {
                type: "POST",
                url: "Index.aspx/CargarEmpleados",
                contentType: 'application/json; charset=utf-8',
                data: function (dtParms) {

                    return JSON.stringify({ dataCrypt: window.location.href });
                },
                "dataSrc": function (json) {
                    var return_data = json.d;
                    return return_data;
                }
            },
            "columns": [

                {//0
                    "data": "fiIDEmpleado", "className": "text-center",
                    "render": function (data, type, row) {
                        return row["fiIDEmpleado"] + " | " + row["fcNombre"];
                        //return '<div class="dropdown mo-mb-2">' +
                        //    '<button class="btn pt-0 pb-0 mt-0 mb-0" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" aria-label="Opciones"><i class="fa fa-bars"></i></button >' +
                        //    '<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">' +
                        //    //'<button type="button" class="dropdown-item" id="btnAbrirCapturaRequerimiento" onclick="RedirigirAccion(' + "'RegistrarRequerimiento.aspx'" + ',' + "'Registrar Requerimiento'" + ')" aria-label="Detalles"><i class="far fa-file-alt"></i>Agregar Requerimiento</button>' +
                        //    '<button type="button" class="dropdown-item" id="btnModuloActualizarRequerimiento" onclick="RedirigirAccion(' + "'RequerimientoActualizar.aspx'" + ',' + "'Actualizar Requerimiento'" + ')" aria-label="Detalles"><i class="far fa-file-alt"></i>Actualizar Requerimiento</button>' +
                        //    //'<button type="button" class="dropdown-item" id="btnAbrirDetalles" onclick="AbrirReporte(' + row["fiIDRequerimiento"] + ')" aria-label="Detalles"><i class="far fa-file-alt"></i> Ver detalles</button>' +
                        //    //(row["UsuarioPermiso"] == true ? `<button type="button" class="dropdown-item" id="btnAbrirDetalleCancelado" onclick="AbrirDetalleCancelado(${row["IdExpediente"]} , ${row["IdSolicitud"]} , '${row["NombreCliente"]}','${row["NombreOficial"]}','${row["Estado"]}', ${row["IdAbogado"]}, ${row["IDEstado"]})" aria-label="Detalles"><i class="far fa-file-alt"></i> detalles cancelados</button>` : '') +
                        //    '</div>' +
                        //    '</div >';
                    }
                },
                {
                    "data": "fcTelefono", "className": "td-responsive",
                    "render": function (data, type, row) {
                        return row["fcTelefono"] + " | " + row["fcCorreo"];
                    }
                },
                {
                    "data": "fcDescripcionPuesto", "className": "td-responsive",
                    "render": function (data, type, row) {

                        return row["fcDescripcionPuesto"];
                    }
                },
                {
                    "data": "fnSueldo", "className": "td-responsive",
                    "render": function (data, type, row) {

                        return row["fnSueldo"];
                    }
                },
                {
                    "data": "fiActivo", "className": "td-responsive",
                    "render": function (data, type, row) {

                        return row["fiActivo"];
                    }
                },

            ],
            buttons: [
                //{
                //    extend: 'excelHtml5',
                //    text: '<i class="far fa-file-excel"></i> Exportar',
                //    title: 'Solicitudes_de_credito_' + moment(),
                //    autoFilter: true,
                //    messageTop: 'Solicitudes de crédito ' + moment().format('YYYY/MM/DD'),
                //    exportOptions: {
                //        columns: [1, 2, 3, 4, 5]
                //    }
                //},
                //{
                //    extend: 'colvis',
                //    text: '<i class="mdi mdi-table-column-remove"></i> Columnas',
                //    columns: [0, 1, 2, 3, 4, ] // columnas que pueden ocultarse y mostrarse, por indice para mejorar el tiempo de carga, por className es mas intuitivo toggle-visible-active
                //},
                //{
                //    extend: 'print',
                //    text: '<i class="fas fa-print"></i> Imprimir',
                //    autoFilter: true,
                //    exportOptions: {
                //        columns: [1, 2, 3, 4, 5]
                //    }
                //},
            ],
            columnDefs: [
                //{ targets: [0,], orderable: false },
                //{ "width": "1%", "targets": 0 }
            ]

        });


        $("#btnCrearEmpleado").click(function () {
            
            $("#modalComentarioResolucion").modal();

        });

        function ProcesosEstados(idRequerimiento) {
            $("#modalComentarioResolucion").modal();
        }


        function RedirigirAccion(nombreFormulario, accion) {

            $.ajax({
                type: "POST",
                url: "BandejaRequerimientoDesarrollo.aspx/EncriptarParametros",
                data: JSON.stringify({ idRequerimiento: idRequerimiento, dataCrypt: window.location.href }),
                contentType: "application/json; charset=utf-8",
                error: function (xhr, ajaxOptions, thrownError) {
                    MensajeError("No se pudo redireccionar a " + accion);
                },
                success: function (data) {

                    data.d != "-1" ? window.location = nombreFormulario + "?" + data.d : MensajeError("No se pudo redireccionar a" + accion);
                }
            });
        }

        function MensajeInformacion(mensaje) {
            iziToast.info({
                title: 'Info',
                message: mensaje
            });
        }

        function MensajeExito(mensaje) {
            iziToast.success({
                title: 'Exito',
                message: mensaje
            });
        }

        function MensajeError(mensaje) {
            iziToast.error({
                title: 'Error',
                message: mensaje
            });
        }



        function pad2(number) {
            return (number < 10 ? '0' : '') + number
        }

        function FechaFormato(pFecha) {
            if (!pFecha)
                return "Sin modificaciones";
            var fechaString = pFecha.substr(6, 19);
            var fechaActual = new Date(parseInt(fechaString));
            var mes = pad2(fechaActual.getMonth() + 1);
            var dia = pad2(fechaActual.getDate());
            var anio = fechaActual.getFullYear();
            var hora = pad2(fechaActual.getHours());
            var minutos = pad2(fechaActual.getMinutes());
            var segundos = pad2(fechaActual.getSeconds().toString());
            var FechaFinal = dia + "/" + mes + "/" + anio + " " + hora + ":" + minutos + ":" + segundos;
            return FechaFinal;
        }

        function FechaFormatoGuiones(pFecha) {
            if (!pFecha)
                return "Sin modificaciones";
            var fechaString = pFecha.substr(6, 19);
            var fechaActual = new Date(parseInt(fechaString));
            var mes = pad2(fechaActual.getMonth() + 1);
            var dia = pad2(fechaActual.getDate());
            var anio = fechaActual.getFullYear();
            var hora = pad2(fechaActual.getHours());
            var minutos = pad2(fechaActual.getMinutes());
            var segundos = pad2(fechaActual.getSeconds().toString());
            var FechaFinal = anio + "/" + mes + "/" + dia + " " + hora + ":" + minutos + ":" + segundos;
            return FechaFinal;
        }

        $("#btnConfirmarEmpleado").click(function () {

            CrearEmpleado();

        });

        function CrearEmpleado() {
           

            if ($("#txtNombreEmpleado").parsley().isValid() && $("#txtTelefonoEmpleado").parsley().isValid() && $("#txtCorreoEmpleado").parsley().isValid() && $("#txtDireccionEmpleado").parsley().isValid() && $("#txtTipoEmpleado").parsley().isValid() && $("#txtSueldoEmpleado").parsley().isValid()) {
                
                $.ajax({
                    type: "POST",
                    url: "Index.aspx/CrearEmpleados",
                    data: JSON.stringify({ Nombre: $("#txtNombreEmpleado").val(), tel: $("#txtTelefonoEmpleado").val(), correo: $("#txtCorreoEmpleado").val(), direccion: $("#txtDireccionEmpleado").val(), puesto: parseInt($("#txtTipoEmpleado").val()), sueldo: parseFloat($("#txtSueldoEmpleado").val()) }),
                    contentType: "application/json; charset=utf-8",
                    error: function (xhr, ajaxOptions, thrownError) {
                        MensajeError("Error, contacte al administrador.");
                    },
                    success: function (data) {
                        MensajeExitoModal('los datos se Actualizaron correctamente.');

                        location.reload();

                    }
                });

            }
            else {
                $("#txtNombreEmpleado").parsley().validate();
                $("#txtTelefonoEmpleado").parsley().validate();
                $("#txtCorreoEmpleado").parsley().validate();
                $("#txtDireccionEmpleado").parsley().validate();
                $("#txtTipoEmpleado").parsley().validate();
                $("#txtSueldoEmpleado").parsley().validate();
            }

        }

        $("#btnConfirmarEmpleado").click(function () {

            CrearEstudiante();

        });

        function CrearEstudiante() {


            if ($("#txtNombreEmpleado").parsley().isValid() && $("#txtTelefonoEmpleado").parsley().isValid() && $("#txtCorreoEmpleado").parsley().isValid() && $("#txtDireccionEmpleado").parsley().isValid() && $("#txtTipoEmpleado").parsley().isValid() && $("#txtSueldoEmpleado").parsley().isValid()) {

                $.ajax({
                    type: "POST",
                    url: "Index.aspx/CrearEmpleados",
                    data: JSON.stringify({ Nombre: $("#txtNombreEmpleado").val(), tel: $("#txtTelefonoEmpleado").val(), correo: $("#txtCorreoEmpleado").val(), direccion: $("#txtDireccionEmpleado").val(), puesto: parseInt($("#txtTipoEmpleado").val()), sueldo: parseFloat($("#txtSueldoEmpleado").val()) }),
                    contentType: "application/json; charset=utf-8",
                    error: function (xhr, ajaxOptions, thrownError) {
                        MensajeError("Error, contacte al administrador.");
                    },
                    success: function (data) {
                        MensajeExitoModal('los datos se Actualizaron correctamente.');

                        location.reload();

                    }
                });

            }
            else {
                $("#txtNombreEmpleado").parsley().validate();
                $("#txtTelefonoEmpleado").parsley().validate();
                $("#txtCorreoEmpleado").parsley().validate();
                $("#txtDireccionEmpleado").parsley().validate();
                $("#txtTipoEmpleado").parsley().validate();
                $("#txtSueldoEmpleado").parsley().validate();
            }

        }
        $("#btnConfirmarEmpleado").click(function () {

            CrearEmpleado();

        });

        


    </script>

</body>
</html>

