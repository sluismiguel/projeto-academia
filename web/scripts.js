// Função para validar o campo de nome
function validateName(field) {
    if (field.value.trim().length < 3) {
        field.classList.add('invalid');  // Borda vermelha se o nome for muito curto
        field.classList.remove('valid');
    } else {
        field.classList.add('valid');  // Borda verde se o nome for válido
        field.classList.remove('invalid');
    }
}

// Função para validar o campo de telefone
function validatePhone(field) {
    const phonePattern = /^\(\d{2}\)\s\d{5}-\d{4}$/; // Exemplo: (11) 98765-4321
    if (!phonePattern.test(field.value.trim())) {
        field.classList.add('invalid');  // Borda vermelha se o telefone não corresponder ao formato
        field.classList.remove('valid');
    } else {
        field.classList.add('valid');  // Borda verde se o telefone estiver correto
        field.classList.remove('invalid');
    }
}

// Função para validar o campo de e-mail
function validateEmail(field) {
    const emailPattern = /^[a-zA-Z0-9._-]+@[a-zAZ0-9.-]+\.[a-zA-Z]{2,6}$/; // E-mail no formato correto
    if (!emailPattern.test(field.value.trim())) {
        field.classList.add('invalid');  // Borda vermelha se o e-mail estiver errado
        field.classList.remove('valid');
    } else {
        field.classList.add('valid');  // Borda verde se o e-mail estiver correto
        field.classList.remove('invalid');
    }
}

// Função para validar um campo
function validateField(field, type) {
    if (type === 'name') {
        validateName(field);
    } else if (type === 'phone') {
        validatePhone(field);
    } else if (type === 'email') {
        validateEmail(field);
    } else if (field.value.trim() === '') {
        field.classList.add('invalid');  // Borda vermelha se o campo estiver vazio
        field.classList.remove('valid');
    } else {
        field.classList.add('valid');  // Borda verde se o campo estiver preenchido corretamente
        field.classList.remove('invalid');
    }
}

// Função que será chamada quando o formulário for enviado
function handleSubmit(event) {
    event.preventDefault();  // Impede o envio do formulário para fazer a validação

    let valid = true;

    // Seleciona todos os campos obrigatórios
    const nome = document.getElementById('nome');
    const telefone = document.getElementById('telefone');
    const email = document.getElementById('email');
    const idade = document.getElementById('idade');
    const observacoes = document.getElementById('observacoes');

    // Validando os campos
    validateField(nome, 'name');
    validateField(telefone, 'phone');
    validateField(email, 'email');
    validateField(idade);
    validateField(observacoes);

    // Verificando se todos os campos obrigatórios estão válidos
    if (nome.classList.contains('invalid') || telefone.classList.contains('invalid') || email.classList.contains('invalid') || idade.classList.contains('invalid')) {
        valid = false;
    }

    // Se tudo estiver válido, envia o formulário (apenas simula) e vai para a próxima página
    if (valid) {
        window.location.href = 'pagamentos.html'; // Redireciona para a página de pagamentos
    } else {
        alert('Por favor, preencha todos os campos corretamente!');
    }
}
