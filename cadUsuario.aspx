<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadUsuario.aspx.cs" Inherits="DEV0102.cadUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cadastro de Usuários</title>

    <script src="Script/cadUsuario/inputmask.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Cadastro de Usuário</h1>
            <label>Nome:</label><br />
            <asp:TextBox ID="txtNome" runat="server" Width="461px"></asp:TextBox><br />
            <label>CEP:</label><br />
            <asp:TextBox ID="txtCep" runat="server" Width="461px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnConsultaCEP" runat="server" Text="Validar CEP" OnClick="btnConsultaCEP_Click" /><br />
            <label>Endereço:</label><br />
            <asp:TextBox ID="txtEndereco" runat="server" Width="461px"></asp:TextBox>
            <br />
            <label>Bairro:</label><br />
            <asp:TextBox ID="txtBairro" runat="server" Width="461px"></asp:TextBox>
            <br />
            <label>Cidade:</label><br />
            <asp:TextBox ID="txtCidade" runat="server" Width="461px"></asp:TextBox>
            <br />
            <label>Estado:</label><br />
            <asp:TextBox ID="txtUf" runat="server" Width="461px"></asp:TextBox>
            <br />
            <label>Email:</label><br />
            <asp:TextBox ID="txtEmail" runat="server" Width="461px"></asp:TextBox>
            <br />
            <label>Senha:</label><br />
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
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <br />
            <br />
        </div>
    </form>
</body>
</html>



