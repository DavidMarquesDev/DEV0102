<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadUsuario.aspx.cs" Inherits="DEV0102.cadUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/jquery.inputmask.bundle.min.js"></script>
    <script src="Script/Validacoes/validaCEP.js"></script>
    <script src="Script/Validacoes/validaTel.js"></script>
    <%--<script src="Script/Validacoes/validaPessoa.js"></script>--%>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">


    <title>Cadastro de Usuários</title>
</head>
<body>
    <div class="container">
        <form id="form1" runat="server">
            <div class="row">
                <h1>Cadastro de Usuário</h1>
                <div class="col-md-6">
                    <label><strong>Pessoa Fisica/juridica</strong>:</label>
                    <asp:DropDownList ID="ddlPessoaFJ" CssClass="pessoa-input form-control" runat="server" Width="461px">
                        <asp:ListItem Value="Física" Selected="True">Física</asp:ListItem>
                        <asp:ListItem Value="Jurídica">Jurídica</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-6">
                    <label id="labelNome"><strong>Nome:</strong></label>
                    <asp:TextBox ID="txtNome" CssClass="form-control" runat="server" Width="461px"></asp:TextBox>
                </div>
                <div class="col-md-6" id="divRazao">
                    <label><strong>Razão Social:</strong></label>
                    <asp:TextBox ID="txtRazao" CssClass="form-control" runat="server" Width="461px"></asp:TextBox>
                </div>
                <div class="col-md-6" id="divCpf">
                    <label><strong>Cpf:</strong></label>
                    <asp:TextBox ID="txtCpf" CssClass="cpf-input form-control" runat="server" Width="461px"></asp:TextBox>
                </div>
                <div class="col-md-6" id="divCnpj">
                    <label><strong>Cnpj:</strong></label>
                    <asp:TextBox ID="txtCnpj" CssClass="cnpj-input form-control" runat="server" Width="461px"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label><strong>Telefone:</strong></label>
                    <asp:TextBox ID="txtTelefone" CssClass="tel-input form-control" runat="server" Width="461px"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label id="labelDtNasc"><strong>Data de Nascimento:</strong></label>
                    <asp:TextBox ID="txtDtNasc" CssClass="form-control" type="date" runat="server" Width="461px"></asp:TextBox>
                </div>

                <div class="col-md-6">
                    <label><strong>CEP:</strong></label>
                    <asp:TextBox ID="txtCep" CssClass="cep-input form-control" runat="server" Width="461px"></asp:TextBox>
                    <asp:Button ID="btnConsultaCEP" runat="server" Text="Validar CEP" OnClick="btnConsultaCEP_Click" />
                    <br />
                </div>

                <div class="col-md-6">
                    <label><strong>Endereço:</strong></label>
                    <asp:TextBox ID="txtEndereco" CssClass="form-control" runat="server" Width="461px"></asp:TextBox>
                </div>

                <div class="col-md-6">
                    <label><strong>Bairro:</strong></label>
                    <asp:TextBox ID="txtBairro" CssClass="form-control" runat="server" Width="461px"></asp:TextBox>
                </div>

                <div class="col-md-6">
                    <label><strong>Cidade:</strong></label>
                    <asp:TextBox ID="txtCidade" CssClass="form-control" runat="server" Width="461px"></asp:TextBox>
                </div>

                <div class="col-md-6">
                    <label><strong>Estado:</strong></label>
                    <asp:TextBox ID="txtUf" CssClass="form-control" runat="server" Width="461px" MaxLength="2"></asp:TextBox>
                </div>

                <div class="col-md-6">
                    <label><strong>Email:</strong></label>
                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" Width="461px"></asp:TextBox>
                </div>

                <div class="col-md-6">
                    <label><strong>Senha:</strong></label>
                    <asp:TextBox ID="txtSenha" CssClass="form-control" runat="server" Width="461px" TextMode="Password"></asp:TextBox>
                </div>

                <div class="col-md-6">
                    <br />
                    <br />
                    <asp:FileUpload ID="fupFoto" runat="server" />
                    <br />
                    <br />
                    <asp:Button ID="btnCadastrar" runat="server" OnClick="btnCadastrar_Click" Text="Cadastrar" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnVoltar" runat="server" Text="Voltar" />
                    <br />
                    <br />
                </div>


                <asp:GridView ID="GridUsuario" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="codigo" DataSourceID="SqlDataSourceUsuario" Width="1326px" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Style="margin-right: 4px; margin-top: 0px" OnRowCommand="GridUsuario_RowCommand">
                    <Columns>
                        <asp:ImageField DataImageUrlField="caminhoFoto" ControlStyle-Height="50px" HeaderText="Foto">
                            <ControlStyle Height="50px"></ControlStyle>
                        </asp:ImageField>
                        <asp:BoundField DataField="codigo" Visible="false" HeaderText="codigo" InsertVisible="False" ReadOnly="True" SortExpression="codigo" />
                        <asp:BoundField DataField="pessoa" HeaderText="Pessoa" SortExpression="pessoa" />
                        <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                        <asp:BoundField DataField="razaoSocial" HeaderText="Razao Social" SortExpression="razaoSocial" />
                        <asp:BoundField DataField="cpfCnpj" HeaderText="CPF/CNPJ" SortExpression="cpfCnpj" />
                        <asp:BoundField DataField="cep" HeaderText="CEP" SortExpression="cep" />
                        <asp:BoundField DataField="endereco" HeaderText="Endereco" SortExpression="endereco" />
                        <asp:BoundField DataField="bairro" HeaderText="Bairro" SortExpression="bairro" />
                        <asp:BoundField DataField="cidade" HeaderText="Cidade" SortExpression="cidade" />
                        <asp:BoundField DataField="uf" HeaderText="UF" SortExpression="uf" />
                        <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                        <asp:BoundField DataField="senha" Visible="false" HeaderText="Senha" SortExpression="senha" />
                        <asp:BoundField DataField="telefone" HeaderText="Telefone" SortExpression="telefone" />
                        <asp:BoundField DataField="DataFundacao" HeaderText="Data Fundacao" SortExpression="DataFundacao" />
                        <asp:BoundField DataField="nomeFoto" Visible="false" HeaderText="nomeFoto" SortExpression="nomeFoto" />
                        <asp:ButtonField ButtonType="Button" CommandName="Deletar" Text="Excluir" />
                        <asp:ButtonField ButtonType="Button" CommandName="Editar" Text="Editar" />
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:DEV0102ConnectionString %>" SelectCommand="select '~/fotoUsuario/' + nomeFoto as caminhoFoto, * from [tabUsuario]">
                </asp:SqlDataSource>
                <asp:HiddenField ID="HiddenFieldCodigo" runat="server" Value="0" />
                <br />
                <br />
            </div>
        </form>
    </div>

</body>
</html>
<script src="Script/Validacoes/validaPessoa.js"></script>
<script src="Script/Validacoes/validaCpf.js"></script>
<script src="Script/Validacoes/validaCnpj.js"></script>



