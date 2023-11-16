using System;
using System.Collections.Generic;
using System.Linq;

namespace DEV0102.DAL
{
    public class usuarioDAL
    {
        public tabUsuario consultarUsuarioPorEmail(string email)
        {
            using (DEV0102Entities1 ctx = new DEV0102Entities1())
            {
                return ctx.tabUsuario.Where(c => c.email == email).FirstOrDefault();
            }
        }

        public void cadastrarUsuario(tabUsuario objU)
        {
            using (DEV0102Entities1 ctx = new DEV0102Entities1())
            {
                ctx.tabUsuario.Add(objU);
                ctx.SaveChanges();
            }
        }

        public void editarUsuario(tabUsuario objU)
        {
            using (DEV0102Entities1 ctx = new DEV0102Entities1())
            {
                ctx.tabUsuario.Attach(objU);
                ctx.Entry(objU).State = System.Data.Entity.EntityState.Modified;
                ctx.SaveChanges();
            }
        }

        public void deletarUsuario(int codigo)
        {
            using (DEV0102Entities1 ctx = new DEV0102Entities1())
            {
                // Verifica se o usuário existe no banco de dados
                var usuarioParaDeletar = ctx.tabUsuario.Find(codigo);

                if (usuarioParaDeletar != null)
                {
                    // Remove o usuário do banco de dados
                    ctx.tabUsuario.Remove(usuarioParaDeletar);
                    ctx.SaveChanges();
                }
                // Se o usuário não existir, você pode tratar isso de acordo com os requisitos do seu aplicativo
            }
        }

        public tabUsuario consultarUsuarioPorCodigo(int usuarioCodigo)
        {
            using (DEV0102Entities1 ctx = new DEV0102Entities1())
            {
                tabUsuario obj = ctx.tabUsuario.Where(c => c.codigo == usuarioCodigo).FirstOrDefault();
                return obj;
            }
        }
    }
}
