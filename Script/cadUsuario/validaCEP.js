// Arquivo: validaCEP.js

function validarCEP(cep) {
    // Expressão regular para o formato de CEP no Brasil
    var regexCEP = /^[0-9]{5}-[0-9]{3}$/;

    // Testa se o CEP atende ao formato especificado
    return regexCEP.test(cep);
}
