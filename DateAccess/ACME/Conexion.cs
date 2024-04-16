using Microsoft.Data.SqlClient;

namespace DateAccess.ACME
{
    public class Conexion
    {
        public readonly string? _cadenaConexion;

        public Conexion()
        {
            string? cadenaConexion;

            cadenaConexion = Environment.GetEnvironmentVariable("SQLServeEX");
            _cadenaConexion = cadenaConexion;
        }

        public SqlConnection Conectar()
        {
            SqlConnection sqlConn;
            sqlConn = new SqlConnection(_cadenaConexion);
            return sqlConn;
        }

    }
}
