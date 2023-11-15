<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadUsuario.aspx.cs" Inherits="DEV0102.cadUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/jquery.inputmask.bundle.min.js"></script>
    <script src="Script/cadUsuario/validaCEP.js"></script>

    <title>Cadastro de Usuários</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Cadastro de Usuário</h1>
            <label><strong>Nome</strong>:</label><br />
            <asp:TextBox ID="txtNome" runat="server" Width="461px"></asp:TextBox><br />
            <label><strong>CEP</strong>:</label><br />
            <asp:TextBox ID="txtCep" runat="server" Width="461px" CssClass="cep-input"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnConsultaCEP" runat="server" Text="Validar CEP" OnClick="btnConsultaCEP_Click" /><br />
            <label><strong>Endereço</strong>:</label><br />
            <asp:TextBox ID="txtEndereco" runat="server" Width="461px"></asp:TextBox>
            <br />
            <label><strong>Bairro</strong>:</label><br />
            <asp:TextBox ID="txtBairro" runat="server" Width="461px"></asp:TextBox>
            <br />
            <label><strong>Cidade</strong>:</label><br />
            <asp:TextBox ID="txtCidade" runat="server" Width="461px"></asp:TextBox>
            <br />
            <label><strong>Estado</strong>:</label><br />
            <asp:TextBox ID="txtUf" runat="server" Width="461px"></asp:TextBox>
            <br />
            <label><strong>Email</strong>:</label><br />
            <asp:TextBox ID="txtEmail" runat="server" Width="461px"></asp:TextBox>
            <br />
            <label><strong>Senha</strong>:</label><br />
            <asp:TextBox ID="txtSenha" runat="server" Width="461px" TextMode="Password"></asp:TextBox>
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
            <asp:GridView ID="GridUsuario" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="codigo" DataSourceID="SqlDataSourceUsuario" Width="765px" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" style="margin-right: 4px; margin-top: 0px" OnRowCommand="GridUsuario_RowCommand">
                <Columns>
                    <asp:ImageField DataImageUrlField="caminhoFoto" ControlStyle-Height="50px" HeaderText="Foto">
<ControlStyle Height="50px"></ControlStyle>
                    </asp:ImageField>
                    <asp:BoundField DataField="codigo" Visible="false" HeaderText="codigo" InsertVisible="False" ReadOnly="True" SortExpression="codigo" />
                    <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                    <asp:BoundField DataField="cep" HeaderText="CEP" SortExpression="cep" />
                    <asp:BoundField DataField="endereco" HeaderText="Endereco" SortExpression="endereco" />
                    <asp:BoundField DataField="bairro" HeaderText="Bairro" SortExpression="bairro" />
                    <asp:BoundField DataField="cidade" HeaderText="Cidade" SortExpression="cidade" />
                    <asp:BoundField DataField="uf" HeaderText="UF" SortExpression="uf" />
                    <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                    <asp:BoundField DataField="senha" Visible="false" HeaderText="senha" SortExpression="senha" />
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
            <asp:SqlDataSource ID="SqlDataSourceUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:DEV0102ConnectionString %>" SelectCommand="select '~/fotoUsuario/' + nomeFoto as caminhoFoto, * from [tabUsuario]" DeleteCommand="DELETE FROM [tabUsuario] WHERE [codigo] = @codigo" InsertCommand="INSERT INTO [tabUsuario] ([nome], [cep], [endereco], [bairro], [cidade], [uf], [email], [senha], [nomeFoto]) VALUES (@nome, @cep, @endereco, @bairro, @cidade, @uf, @email, @senha, @nomeFoto)" UpdateCommand="UPDATE [tabUsuario] SET [nome] = @nome, [cep] = @cep, [endereco] = @endereco, [bairro] = @bairro, [cidade] = @cidade, [uf] = @uf, [email] = @email, [senha] = @senha, [nomeFoto] = @nomeFoto WHERE [codigo] = @codigo">
                <DeleteParameters>
                    <asp:Parameter Name="codigo" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="nome" Type="String" />
                    <asp:Parameter Name="cep" Type="String" />
                    <asp:Parameter Name="endereco" Type="String" />
                    <asp:Parameter Name="bairro" Type="String" />
                    <asp:Parameter Name="cidade" Type="String" />
                    <asp:Parameter Name="uf" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="senha" Type="String" />
                    <asp:Parameter Name="nomeFoto" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nome" Type="String" />
                    <asp:Parameter Name="cep" Type="String" />
                    <asp:Parameter Name="endereco" Type="String" />
                    <asp:Parameter Name="bairro" Type="String" />
                    <asp:Parameter Name="cidade" Type="String" />
                    <asp:Parameter Name="uf" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="senha" Type="String" />
                    <asp:Parameter Name="nomeFoto" Type="String" />
                    <asp:Parameter Name="codigo" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:HiddenField ID="HiddenFieldCodigo" runat="server" Value="0"/>
            <br />
            <br />
        </div>
    </form>
</body>
</html>



