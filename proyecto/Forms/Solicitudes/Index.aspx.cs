using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Security.Cryptography;
using System.Security.Policy;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ProyectoU.Forms.Solicitudes
{
    public partial class Index : System.Web.UI.Page
    {
        private SqlConnection sqlConexion = null;
        private String sqlConnectionString = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static List<Notas_ViewModel> CargarNotas(int IdEstudiante)
        {
            var ListaDatos = new List<Notas_ViewModel>();
            try
            {
                

                using (var sqlConexion = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlCommand"].ConnectionString))
                {
                    sqlConexion.Open();

                    using (var sqlComando = new SqlCommand("sp_VerNotas", sqlConexion))
                    {
                        sqlComando.CommandType = CommandType.StoredProcedure;
                        sqlComando.Parameters.AddWithValue("@piIDEstudiante", IdEstudiante);
                        sqlComando.CommandTimeout = 240;

                        using (var sqlResultado = sqlComando.ExecuteReader())
                        {
                            while (sqlResultado.Read())
                            {
                                ListaDatos.Add(new Notas_ViewModel()
                                {
                                    fcNombre = (string)sqlResultado["fcNombre"],
                                    fiIDSeccion = (int)sqlResultado["fiIDSeccion"],
                                    fcNombreMateria = (string)sqlResultado["fcNombreMateria"],
                                    fnNota = (decimal)sqlResultado["fnNota"],
                                });
                            }
                        } // using sqlResultado
                    } // using sqlComando
                } // using SqlConexion
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            return ListaDatos;
        }

        [WebMethod]
        public static List<Estudiante_ViewModel> CargarEstudiantes()
        {
            var ListaDatos = new List<Estudiante_ViewModel>();
            try
            {


                using (var sqlConexion = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlCommand"].ConnectionString))
                {
                    sqlConexion.Open();

                    using (var sqlComando = new SqlCommand("sp_ListarEstudiantes", sqlConexion))
                    {
                        sqlComando.CommandType = CommandType.StoredProcedure;
                        sqlComando.CommandTimeout = 240;

                        using (var sqlResultado = sqlComando.ExecuteReader())
                        {
                            while (sqlResultado.Read())
                            {
                                ListaDatos.Add(new Estudiante_ViewModel()
                                {
                                    fiIDEstudiante = (int)sqlResultado["fiIDEstudiante"],
                                    fcNombre = (string)sqlResultado["fcNombre"],
                                    fcCorreo = (string)sqlResultado["fcCorreo"],
                                    fcTelefono = (string)sqlResultado["fcTelefono"],
                                    fdFechaInicio = (DateTime)sqlResultado["fdFechaInicio"],
                                    fnBecado = (Boolean)sqlResultado["fnBecado"],
                                    fnActivo = (Boolean)sqlResultado["fnActivo"],
                                });
                            }
                        } // using sqlResultado
                    } // using sqlComando
                } // using SqlConexion
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            return ListaDatos;
        }

        [WebMethod]
        public static List<Empleado_ViewModel> CargarEmpleados()
        {
            var ListaDatos = new List<Empleado_ViewModel>();
            try
            {


                using (var sqlConexion = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlCommand"].ConnectionString))
                {
                    sqlConexion.Open();

                    using (var sqlComando = new SqlCommand("sp_ListarEmpleados", sqlConexion))
                    {
                        sqlComando.CommandType = CommandType.StoredProcedure;
                        sqlComando.CommandTimeout = 240;

                        using (var sqlResultado = sqlComando.ExecuteReader())
                        {
                            while (sqlResultado.Read())
                            {
                                ListaDatos.Add(new Empleado_ViewModel()
                                {
                                    fiIDEmpleado = (int)sqlResultado["fiIDEmpleado"],
                                    fcNombre = (string)sqlResultado["fcNombre"],
                                    fcCorreo = (string)sqlResultado["fcCorreo"],
                                    fcTelefono = (string)sqlResultado["fcTelefono"],
                                    fcDescripcionPuesto = (string)sqlResultado["fcDescripcionPuesto"],
                                    fnSueldo = (decimal)sqlResultado["fnSueldo"],
                                    fiActivo = (Boolean)sqlResultado["fiActivo"],
                                });
                            }
                        } // using sqlResultado
                    } // using sqlComando
                } // using SqlConexion
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            return ListaDatos;
        }

        [WebMethod]
        public static List<Matricula_ViewModel> CargarMAtricula()
        {
            var ListaDatos = new List<Matricula_ViewModel>();
            try
            {


                using (var sqlConexion = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlCommand"].ConnectionString))
                {
                    sqlConexion.Open();

                    using (var sqlComando = new SqlCommand("sp_ListarMAtricula", sqlConexion))
                    {
                        sqlComando.CommandType = CommandType.StoredProcedure;
                        sqlComando.CommandTimeout = 240;

                        using (var sqlResultado = sqlComando.ExecuteReader())
                        {
                            while (sqlResultado.Read())
                            {
                                ListaDatos.Add(new Matricula_ViewModel()
                                {
                                    fiIDMatricula = (int)sqlResultado["fiIDMatricula"],
                                    fdFechaMatricula = (DateTime)sqlResultado["fdFechaMatricula"],
                                    fiIDSeccion = (int)sqlResultado["fiIDSeccion"],
                                    fcNombreMateria = (string)sqlResultado["fcNombreMateria"],
                                    fiIDEmpleado = (int)sqlResultado["fiIDEmpleado"],
                                    fcNombreEmpleado = (string)sqlResultado["fcNombreEmpleado"],
                                    fiIDEstudiante = (int)sqlResultado["fiIDEstudiante"],
                                    fcNombreEstudiante = (string)sqlResultado["fcNombreEstudiante"],
                                    fnNota = (decimal)sqlResultado["fnNota"],
                                });
                            }
                        } // using sqlResultado
                    } // using sqlComando
                } // using SqlConexion
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            return ListaDatos;
        }

        [WebMethod]
        public static List<Asignacion_ViewModel> CargarAsignaciones()
        {
            var ListaDatos = new List<Asignacion_ViewModel>();
            try
            {


                using (var sqlConexion = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlCommand"].ConnectionString))
                {
                    sqlConexion.Open();

                    using (var sqlComando = new SqlCommand("sp_ListarEmpleados", sqlConexion))
                    {
                        sqlComando.CommandType = CommandType.StoredProcedure;
                        sqlComando.CommandTimeout = 240;

                        using (var sqlResultado = sqlComando.ExecuteReader())
                        {
                            while (sqlResultado.Read())
                            {
                                ListaDatos.Add(new Asignacion_ViewModel()
                                {
                                    fiIDAsignacion = (int)sqlResultado["fiIDEmpleado"],
                                    fcNombreAsignacion = (string)sqlResultado["fcNombre"],
                                    fcDescripcion = (string)sqlResultado["fcCorreo"],
                                    fiIDSeccion = (int)sqlResultado["fcTelefono"],
                                    fiActivo = (Boolean)sqlResultado["fcDescripcionPuesto"],
                                });
                            }
                        } // using sqlResultado
                    } // using sqlComando
                } // using SqlConexion
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            return ListaDatos;
        }

        [WebMethod]
        public static Resultado_ViewModel CrearEmpleados(string Nombre,string tel,string correo, string direccion,int puesto,float sueldo)
        {
            var resultado = new Resultado_ViewModel() { ResultadoExitoso = false };
            var mensajeError = string.Empty;
            try
            {
                using (var sqlConexion = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlCommand"].ConnectionString))
                {
                    sqlConexion.Open();

                    using (var tran = sqlConexion.BeginTransaction())
                    {
                        try
                        {
                            var contadorErrores = 0;

                            /* Actualizar Datos */
                            using (var sqlComando = new SqlCommand("sp_CrearEmpleado", sqlConexion, tran))
                            {
                                sqlComando.CommandType = CommandType.StoredProcedure;
                                sqlComando.Parameters.AddWithValue("@pcNombre", Nombre);
                                sqlComando.Parameters.AddWithValue("@pcTelefono", tel);
                                sqlComando.Parameters.AddWithValue("@pcCorreo", correo);
                                sqlComando.Parameters.AddWithValue("@pcDireccion", direccion);
                                sqlComando.Parameters.AddWithValue("@piIDTipoEmpleado", puesto);
                                sqlComando.Parameters.AddWithValue("@pnSueldo", sueldo);

                                sqlComando.CommandTimeout = 120;

                                using (var sqlResultado = sqlComando.ExecuteReader())
                                {
                                    while (sqlResultado.Read())
                                    {
                                        mensajeError = sqlResultado["MensajeError"].ToString();
                                        if (sqlResultado["MensajeError"].ToString().StartsWith("-1"))
                                            contadorErrores++;

                                    } // sqlResultado.Read()
                                } // sqlComando.ExecuteReader()
                            } // using sqlComando
                            if (contadorErrores > 0)
                            {
                                resultado.ResultadoExitoso = false;
                                resultado.MensajeResultado = "Error al Actualizar datos del requerimiento";
                                return resultado;
                            }
                            
                           
                            tran.Commit();
                            //tran.Rollback();
                            resultado.ResultadoExitoso = true;
                            resultado.MensajeResultado = "La información del requerimiento se actualizó correctamente";


                        }
                        catch (Exception ex)
                        {
                            tran.Rollback();
                            resultado.ResultadoExitoso = false;
                            resultado.MensajeResultado = "No se pudo actualizar la información, contacte al administrador.";
                            resultado.DebugString = ex.Message.ToString();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                resultado.ResultadoExitoso = false;
                resultado.MensajeResultado = "No se pudo actualizar la información de la garantía, contacte al administrador.";
                resultado.DebugString = ex.Message.ToString();
            }
            return resultado;
        }

        #region ViewModel

        public class Estudiante_ViewModel
        {
            public int fiIDEstudiante { get; set; }
            public string fcNombre { get; set; }
            public string fcCorreo { get; set; }
            public string fcTelefono { get; set; }
            public DateTime fdFechaInicio { get; set; }
            public Boolean fnBecado { get; set; }
            public Boolean fnActivo { get; set; }
        }

        public class Empleado_ViewModel
        {
            public int fiIDEmpleado { get; set; }
            public string fcNombre { get; set; }
            public string fcCorreo { get; set; }
            public string fcTelefono { get; set; }
            public string fcDescripcionPuesto { get; set; }
            public decimal fnSueldo { get; set; }
            public Boolean fiActivo { get; set; }
        }

        public class Notas_ViewModel 
        {
            public string fcNombre { get; set; }
            public int fiIDSeccion { get; set; }
            public string fcNombreMateria { get; set; }
            public decimal fnNota { get; set; }
        }

        public class Resultado_ViewModel
        {
            public bool ResultadoExitoso { get; set; }
            public string MensajeResultado { get; set; }
            public string DebugString { get; set; }
        }

        public class Matricula_ViewModel
        {
            public int fiIDMatricula { get; set; }
            public DateTime fdFechaMatricula { get; set; }
            public int fiIDSeccion { get; set; }
            public string fcNombreMateria { get; set; }
            public int fiIDEmpleado { get; set; }
            public string fcNombreEmpleado { get; set; }
            public int fiIDEstudiante { get; set; }
            public string fcNombreEstudiante { get; set; }
            public decimal fnNota { get; set; }
        }

        public class Asignacion_ViewModel
        {
            public int fiIDAsignacion { get; set; }
            public string fcNombreAsignacion { get; set; }
            public string fcDescripcion { get; set; }
            public int fiIDSeccion { get; set; }
            public Boolean fiActivo { get; set; }
        }

        #endregion

    }
}