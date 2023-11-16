document.addEventListener("DOMContentLoaded", function () {
    // Obter referências aos elementos HTML
    var ddlPessoaFJ = document.getElementById('ddlPessoaFJ');
    var divCpf = document.getElementById('divCpf');
    var divCnpj = document.getElementById('divCnpj');
    var divRazao = document.getElementById('divRazao');
    var txtCpf = document.getElementById('txtCpf');
    var txtCnpj = document.getElementById('txtCnpj');
    var txtRazao = document.getElementById('txtRazao');
    var labelDtNasc = document.getElementById('labelDtNasc');
    var labelNome = document.getElementById('labelNome');

    // Adicionar a função de manipulador diretamente no evento onchange da lista suspensa
    ddlPessoaFJ.onchange = function () {
        // Verificar o valor do atributo "value" da opção selecionada
        var selectedValue = ddlPessoaFJ.options[ddlPessoaFJ.selectedIndex].value;

        // Atualizar a label com base na escolha de pessoa física ou jurídica
        if (selectedValue === "Física") {
            labelDtNasc.innerHTML = "<strong>Data de Nascimento:</strong>";
            labelNome.innerHTML = "<strong>Nome:</strong>"; // Para pessoa física, use "Nome"
            divRazao.style.display = "none"; // Ocultar o campo Razão Social para pessoa física
            txtRazao.disabled = true;
        } else {
            labelDtNasc.innerHTML = "<strong>Data de Fundação:</strong>";
            labelNome.innerHTML = "<strong>Nome Fantasia:</strong>"; // Para pessoa jurídica, use "Nome Fantasia"
            divRazao.style.display = "block"; // Exibir o campo Razão Social para pessoa jurídica
            txtRazao.disabled = false;
        }

        // Verificar se a opção selecionada é Pessoa Física ou Jurídica
        if (selectedValue === "Física") {
            // Se for Pessoa Física, exibir o campo CPF e ocultar o campo CNPJ
            divCpf.style.display = "block";
            txtCpf.disabled = false;

            divCnpj.style.display = "none";
            txtCnpj.disabled = true;
        } else {
            // Se for Pessoa Jurídica, exibir o campo CNPJ e ocultar o campo CPF
            divCnpj.style.display = "block";
            txtCnpj.disabled = false;

            divCpf.style.display = "none";
            txtCpf.disabled = true;
        }
    };

    // Inicializar o estado dos campos com base na opção inicial da lista suspensa
    var selectedValue = ddlPessoaFJ.options[ddlPessoaFJ.selectedIndex].value;

    if (selectedValue === "Física") {
        labelDtNasc.innerHTML = "<strong>Data de Nascimento:</strong>";
        labelNome.innerHTML = "<strong>Nome:</strong>";
        divCpf.style.display = "block";
        txtCpf.disabled = false;

        divCnpj.style.display = "none";
        txtCnpj.disabled = true;

        divRazao.style.display = "none";
        txtRazao.disabled = true;
    } else {
        labelDtNasc.innerHTML = "<strong>Data de Fundação:</strong>";
        labelNome.innerHTML = "<strong>Nome Fantasia:</strong>";
        divCnpj.style.display = "block";
        txtCnpj.disabled = false;

        divCpf.style.display = "none";
        txtCpf.disabled = true;

        divRazao.style.display = "block";
        txtRazao.disabled = false;
    }
});
