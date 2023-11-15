using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DEV0102
{
    public partial class cadUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {

        }

        protected void btnConsultaCEP_Click(object sender, EventArgs e)
        {
            try
            {
                using (var ws = new wsCorreiros.AtendeClienteService())
                {
                    var result = ws.consultaCEP(txtCep.Text);

                    txtEndereco.Text = result.end;
                    txtBairro.Text = result.bairro;
                    txtCidade.Text = result.cidade;
                    txtUf.Text = result.uf;
                }
            }
            catch (Exception ex)
            {

                ExibirMensangem(ex.Message);
            }
        }

        public void ExibirMensangem(string msg)
        {
            Response.Write("<script>alert('" + msg + "')</script>");
        }
    }
}