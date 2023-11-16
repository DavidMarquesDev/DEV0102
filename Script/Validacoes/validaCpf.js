$(document).ready(function () {
    // Máscara para CPF (999.999.999-99)
    $('.cpf-input').inputmask('999.999.999-99');

    // Adicione uma div para mostrar mensagens de validação
    var mensagemValidacao = $('<div class="mensagem-validacao"></div>');
    $('.cpf-input').after(mensagemValidacao);

    // Validação de CPF
    $('.cpf-input').on('blur', function () {
        var cpfValue = $(this).val().replace(/\D/g, ''); // Remove caracteres não numéricos

        // Verifica se o CPF possui o número correto de dígitos
        if (cpfValue.length === 11) {
            // Verifica se o CPF é válido
            if (validarCPF(cpfValue)) {
                // Exibe a mensagem de CPF válido
                mensagemValidacao.text('CPF válido!');
            } else {
                // Exibe a mensagem de CPF inválido
                mensagemValidacao.text('CPF inválido!');
            }
        } else {
            // Exibe a mensagem de comprimento incorreto
            mensagemValidacao.text('CPF inválido (comprimento incorreto)!');
        }
    });
    // Função para validar CPF
    function validarCPF(cpf) {
        var soma = 0;
        var resto;

        // Elimina CPFs invalidos conhecidos
        if (cpf.length !== 11 || /^(\d)\1{10}$/.test(cpf)) {
            return false;
        }

        for (var i = 1; i <= 9; i++) {
            soma = soma + parseInt(cpf.substring(i - 1, i)) * (11 - i);
        }

        resto = (soma * 10) % 11;

        if ((resto === 10) || (resto === 11)) {
            resto = 0;
        }

        if (resto !== parseInt(cpf.substring(9, 10))) {
            return false;
        }

        soma = 0;

        for (var i = 1; i <= 10; i++) {
            soma = soma + parseInt(cpf.substring(i - 1, i)) * (12 - i);
        }

        resto = (soma * 10) % 11;

        if ((resto === 10) || (resto === 11)) {
            resto = 0;
        }

        if (resto !== parseInt(cpf.substring(10, 11))) {
            return false;
        }

        return true;
    }
});
