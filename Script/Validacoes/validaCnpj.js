$(document).ready(function () {
    // Máscara para CNPJ (99.999.999/9999-99)
    $('.cnpj-input').inputmask('99.999.999/9999-99');

    // Adicione uma div para mostrar mensagens de validação
    var mensagemValidacao = $('<div class="mensagem-validacao"></div>');
    $('.cnpj-input').after(mensagemValidacao);

    // Validação de CNPJ
    $('.cnpj-input').on('blur', function () {
        var cnpjValue = $(this).val().replace(/\D/g, ''); // Remove caracteres não numéricos

        // Verifica se o CNPJ possui o número correto de dígitos
        if (cnpjValue.length === 14) {
            // Verifica se o CNPJ é válido
            if (validarCNPJ(cnpjValue)) {
                // Exibe a mensagem de CNPJ válido
                mensagemValidacao.text('CNPJ válido: ' + cnpjValue);
            } else {
                // Exibe a mensagem de CNPJ inválido
                mensagemValidacao.text('CNPJ inválido: ' + cnpjValue);
            }
        } else {
            // Exibe a mensagem de comprimento incorreto
            mensagemValidacao.text('CNPJ inválido (comprimento incorreto): ' + cnpjValue);
        }
    });

    // Função para validar CNPJ
    function validarCNPJ(cnpj) {
        // Lógica de validação de CNPJ
        // ...

        return true; // Ou false, dependendo da validação
    }
});
