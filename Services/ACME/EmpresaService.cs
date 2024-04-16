﻿
using Models.ACME;
using DateAccess.ACME;


namespace Services.ACME
{
    public class EmpresaService
    {
        public bool crear(EmpresaEntidad empresaEntidad)
        {
            EmpresaDA empresaDA = new EmpresaDA();

            try
            {
                empresaDA.Insertar(empresaEntidad);

                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool Actualizar(EmpresaEntidad empresaEntidad)
        {
            EmpresaDA empresaDA = new EmpresaDA();

            try
            {
                empresaDA.Modificar(empresaEntidad);

                return true;
            }
            catch
            {
                return false;
            }
        }
        public EmpresaEntidad? BuscarID(int IDEmpresa)
        {
            EmpresaDA? empresaDA=new EmpresaDA();

            try
            {
                return empresaDA.BuscarID(IDEmpresa);
            }
            catch
            {
                return null;
            }
        }
        public List< EmpresaEntidad>? Listar()
        {
            EmpresaDA? empresaDA = new EmpresaDA();

            try
            {
                return empresaDA.Listar();
            }
            catch
            {
                return null;
            }
        }
        public bool Eliminar(EmpresaEntidad empresaEntidad)
        {
            EmpresaDA empresaDA = new EmpresaDA();

            try
            {
                empresaDA.Anular(empresaEntidad);

                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
