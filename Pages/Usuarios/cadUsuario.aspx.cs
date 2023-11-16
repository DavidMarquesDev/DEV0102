using DEV0102.DAL;
using DEV0102.Utils;
using System;
using System.Collections.Generic;
using System.Globalization;
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
            try
            {
                tabUsuario objusuario = new tabUsuario();

                objusuario.nome = txtNome.Text;
                objusuario.cep = txtCep.Text;
                objusuario.endereco = txtEndereco.Text;
                objusuario.bairro = txtBairro.Text;
                objusuario.cidade = txtCidade.Text;
                objusuario.uf = txtUf.Text;
                objusuario.email = txtEmail.Text;
                objusuario.senha = txtSenha.Text;

                objusuario.pessoa = ddlPessoaFJ.SelectedValue;

                if (objusuario.pessoa == "Física")
                {
                    objusuario.cpfCnpj = txtCpf.Text;
                }
                else
                {
                    objusuario.cpfCnpj = txtCnpj.Text;
                }

                objusuario.telefone = txtTelefone.Text;
                DateTime dataFundacao = DateTime.ParseExact(txtDtNasc.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                txtDtNasc.Text = dataFundacao.ToString("dd/MM/yyyy");
                objusuario.DataFundacao = DateTime.ParseExact(txtDtNasc.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                objusuario.razaoSocial = txtRazao.Text;

                if (fupFoto.HasFile)
                {
                    string caminhoArquivo = Server.MapPath("/fotoUsuario/");
                    string nomeArquivo = fupFoto.FileName;

                    fupFoto.SaveAs(caminhoArquivo + nomeArquivo);

                    objusuario.nomeFoto = fupFoto.FileName;
                }

                tabUsuario objValidador = new tabUsuario();
                usuarioDAL uDal = new usuarioDAL();

                if (HiddenFieldCodigo.Value != "0")
                {
                    objusuario.codigo = Convert.ToInt32(HiddenFieldCodigo.Value);
                    uDal.editarUsuario(objusuario);
                    HiddenFieldCodigo.Value = "0";
                    btnCadastrar.Text = "Cadastrar";
                    GridUsuario.DataBind();
                    LimparCampos();
                    ExibirMensangem("Usuário editado com sucesso!");

                }
                else
                {
                    objValidador = uDal.consultarUsuarioPorEmail(txtEmail.Text);

                    if (objValidador != null && btnCadastrar.Text == "Cadastrar")
                    {
                        ExibirMensangem("Usuário ja cadastrado!");
                    }
                    else
                    {
                        if (btnCadastrar.Text == "Salvar")
                        {
                            uDal.editarUsuario(objusuario);
                        }

                        uDal.cadastrarUsuario(objusuario);
                        GridUsuario.DataBind();
                        ExibirMensangem("Usuário cadastrado com sucesso!");
                        //EnviarEmails(txtNome.Text, txtEmail.Text);
                        LimparCampos();
                    }
                }
            }
            catch (Exception ex)
            {

                ExibirMensangem("Erro ao salvar cadastro! Entre em contato com o administrador do sistemas!");
            }
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

        private void LimparCampos()
        {
            txtNome.Text = string.Empty;
            txtCep.Text = string.Empty;
            txtEndereco.Text = string.Empty;
            txtBairro.Text = string.Empty;
            txtCidade.Text = string.Empty;
            txtUf.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtSenha.Text = string.Empty;
            txtCpf.Text = string.Empty;
            txtCnpj.Text = string.Empty;
            txtTelefone.Text = string.Empty;
            ddlPessoaFJ.SelectedValue = string.Empty;
            txtDtNasc.Text = string.Empty;
            txtRazao.Text = string.Empty;

            // Limpar ou reinicializar outros campos conforme necessário
        }

        private void EnviarEmails(string nomeText, string emailText)
        {
            try
            {
                Suporte objsup = new Suporte();
                string corpoEmail = "Olá " + nomeText + ", bem vindo ao sistema, você já está cadastrado!";
                objsup.EnviarEmail("Bem vindo ao Sistema Desenvti", emailText, corpoEmail);
            }
            catch (Exception ex)
            {

                ExibirMensangem("Erro ao enviar Email! Entre em contato com o administrador do sistemas!");
            }

        }

        protected void GridUsuario_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Deletar")
            {
                int linhaClicada = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridUsuario.Rows[linhaClicada];
                int codigo = Convert.ToInt32(GridUsuario.DataKeys[linhaClicada]["codigo"].ToString());

                usuarioDAL uDal = new usuarioDAL();
                uDal.deletarUsuario(codigo);

                GridUsuario.DataBind();
                ExibirMensangem("Usuário excluido com sucesso");

            }
            else if (e.CommandName == "Editar")
            {
                int linhaClicada = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridUsuario.Rows[linhaClicada];
                int codigo = Convert.ToInt32(GridUsuario.DataKeys[linhaClicada]["codigo"].ToString());

                usuarioDAL objDal = new usuarioDAL();
                tabUsuario obj = objDal.consultarUsuarioPorCodigo(codigo);

                txtNome.Text = obj.nome;
                txtCep.Text = obj.cep;
                txtEndereco.Text = obj.endereco;
                txtBairro.Text = obj.bairro;
                txtCidade.Text = obj.cidade;
                txtUf.Text = obj.uf;
                txtEmail.Text = obj.email;
                txtCpf.Text = obj.cpfCnpj;
                txtCnpj.Text = obj.cpfCnpj;
                txtTelefone.Text = obj.telefone;
                ddlPessoaFJ.SelectedValue = obj.pessoa;
                txtDtNasc.Text = obj.DataFundacao.ToString("yyyy-MM-dd");
                txtRazao.Text = obj.razaoSocial;

                HiddenFieldCodigo.Value = obj.codigo.ToString();
                btnCadastrar.Text = "Salvar";
                ExibirMensangem("Liberado para edição!");
            }

        }
    }
}