import '../models/message.dart';

final List<Message> chatFlow = [
  // 0 - Saudação inicial
  Message(
    text:
        '👋 Olá! Bem‑vindo(a) ao app Reuzy. Me chamo Solidarynho e estou aqui para te ajudar! 😁👌\nAntes de começarmos, você gostaria de usar a versão com mais acessibilidade?',
    type: MessageType.bot,
  ),
  // 1 - Explicação do modo acessível
  Message(
    text:
        '📖 Modo acessível oferece:\n• Fontes maiores\n• Contraste alto\n• Textos mais claros e objetivos',
    type: MessageType.bot,
  ),
  // 2 - Pergunta sobre ativar acessibilidade
  Message(
    text: 'Você gostaria de ativar o modo acessível?',
    type: MessageType.bot,
    options: ['Sim, quero ativar', 'Não, obrigado'],
    next: {'Sim, quero ativar': 3, 'Não, obrigado': 4},
  ),
  // 3 - Confirmação de ativação (pode adicionar lógica para ativar o modo)
  Message(text: 'Ótimo! Modo acessível ativado.', type: MessageType.bot),
  // 4 - Segue fluxo normal
  Message(
    text: 'Você pode ativar ou desativar a qualquer momento no menu principal.',
    type: MessageType.bot,
  ),
  // 5 - Pergunta sobre conta
  Message(
    text:
        'Percebi que você não está logado(a). Você já tem uma conta no Reuzy?',
    type: MessageType.bot,
    options: [
      'Quero me cadastrar',
      'Já tenho conta',
      'Quero saber como o Reuzy funciona',
    ],
    next: {
      'Quero me cadastrar': 6,
      'Já tenho conta': 20,
      'Quero saber como o Reuzy funciona': 30,
    },
  ),
  // 6 - Cadastro: e-mail
  Message(
    text: 'Vamos começar seu cadastro! Informe seu e‑mail:',
    type: MessageType.bot,
  ),
  // Mensagem de input para o e-mail
  Message(
    text: '',
    type: MessageType.input,
    showInput: true,
  ),
  Message(
    text: 'Seu e‑mail está correto?',
    type: MessageType.bot,
    options: ['Sim', 'Não'],
    next: {'Sim': 9, 'Não': 6},
  ),
  // 9 - Cadastro: senha
  Message(text: 'Informe sua senha:', type: MessageType.bot),
  // 10 - Input de senha
  Message(text: '', type: MessageType.input),
  // 11 - Cadastro: CPF ou CNPJ
  Message(
    text: 'Você deseja cadastrar com CPF ou CNPJ?',
    type: MessageType.bot,
    options: ['CPF', 'CNPJ'],
    next: {'CPF': 12, 'CNPJ': 15},
  ),
  // 12 - Cadastro: CPF
  Message(text: 'Informe seu CPF:', type: MessageType.bot),
  // 13 - Input de CPF
  Message(text: '', type: MessageType.input),
  // 14 - Cadastro: telefone
  Message(
    text: 'Informe seu número de telefone com DDD:',
    type: MessageType.bot,
  ),
  // 15 - Cadastro: CNPJ
  Message(text: 'Informe seu CNPJ:', type: MessageType.bot),
  // 16 - Input de CNPJ
  Message(text: '', type: MessageType.input),
  // 17 - Cadastro: razão social
  Message(text: 'Informe a razão social:', type: MessageType.bot),
  // 18 - Input de razão social
  Message(text: '', type: MessageType.input),
  // 19 - Cadastro: telefone (CNPJ)
  Message(
    text: 'Informe seu número de telefone com DDD:',
    type: MessageType.bot,
  ),
  // 20 - Papel na comunidade
  Message(
    text: 'Qual é seu papel na comunidade?',
    type: MessageType.bot,
    options: ['Sou doador', 'Busco ajuda', 'Ofereço serviços', 'Outro'],
    next: {
      'Sou doador': 21,
      'Busco ajuda': 21,
      'Ofereço serviços': 21,
      'Outro': 21,
    },
  ),
  // 21 - Cadastro concluído
  Message(text: '✅ Cadastro concluído com sucesso!', type: MessageType.bot),
  // 22 - O que deseja fazer agora?
  Message(
    text:
        'Agora você pode:\n• Anunciar doações\n• Buscar ou solicitar ajuda\n• Oferecer serviços\n\nO que deseja fazer agora?',
    type: MessageType.bot,
    options: [
      'Anunciar doação',
      'Buscar ajuda',
      'Oferecer serviço',
      'Ver meu perfil',
    ],
    next: {
      'Anunciar doação': 23,
      'Buscar ajuda': 41,
      'Oferecer serviço': 41,
      'Ver meu perfil': 41,
    },
  ),
  // 23 - Anúncio: título
  Message(
    text:
        'Qual é o título do seu anúncio?\nEx: Cesta básica completa / Corte de cabelo gratuito',
    type: MessageType.bot,
  ),
  // 24 - Input de título
  Message(text: '', type: MessageType.input),
  // 25 - Anúncio: descrição
  Message(
    text:
        'Agora, escreva uma descrição detalhada:\nEx: Arroz, feijão, óleo, açúcar, café – para 1 família',
    type: MessageType.bot,
  ),
  // 26 - Input de descrição
  Message(text: '', type: MessageType.input),
  // 27 - Anúncio: imagem
  Message(
    text: '🖼️ Adicione uma imagem para o anúncio:',
    type: MessageType.bot,
  ),
  // 28 - Confirmação da imagem
  Message(
    text: 'Sua foto está correta?',
    type: MessageType.bot,
    options: ['Sim', 'Não'],
    next: {'Sim': 29, 'Não': 27},
  ),
  // 29 - Anúncio: CEP/localização
  Message(
    text:
        '📍 Onde a doação ou serviço estará disponível? Digite o CEP para encontrar mais fácil.',
    type: MessageType.bot,
  ),
  // 30 - Input de CEP
  Message(text: '', type: MessageType.input),
  // 31 - Confirmação do endereço (exemplo fixo)
  Message(
    text:
        'O endereço está correto?\nEndereço: Travessa São Sebastião\nBairro: Nova Tiuma\nCidade: São Lourenço da Mata – PE',
    type: MessageType.bot,
    options: ['Sim', 'Não'],
    next: {'Sim': 32, 'Não': 29},
  ),
  // 32 - Confirmação do telefone
  Message(
    text: 'Esse é seu número de telefone para contato? (55) 99116‑6578',
    type: MessageType.bot,
    options: ['Sim', 'Não'],
    next: {'Sim': 33, 'Não': 14},
  ),
  // 33 - Anúncio: categorias/tags
  Message(
    text:
        'Por último, vamos atribuir algumas categorias para o seu anúncio. Digite as tags e envie que vou adicionar ao seu anúncio.\nEx: Roupa, Comida, Higiene',
    type: MessageType.bot,
  ),
  // 34 - Input de tags
  Message(text: '', type: MessageType.input),
  // 35 - Revisão do anúncio
  Message(
    text: 'Revise seu anúncio:',
    type: MessageType.bot,
    options: [
      'Sim, publicar agora',
      'Editar alguma informação',
      'Cancelar anúncio',
    ],
    next: {
      'Sim, publicar agora': 42,
      'Editar alguma informação': 42,
      'Cancelar anúncio': 42,
    },
  ),
  // 36 - Login (caso já tenha conta)
  Message(text: 'Informe seu e‑mail para login:', type: MessageType.bot),
  Message(text: '', type: MessageType.input),
  Message(text: 'Informe sua senha:', type: MessageType.bot),
  Message(text: '', type: MessageType.input),
  Message(text: 'Login realizado com sucesso!', type: MessageType.bot),
  // 41 - Explicação sobre o Reuzy
  Message(
    text:
        'O Reuzy é uma plataforma para conectar pessoas que querem doar, receber ajuda ou oferecer serviços na sua comunidade. Você pode criar anúncios, buscar doações e muito mais!',
    type: MessageType.bot,
  ),
  // 42 - Em breve
  Message(
    text: 'Esta funcionalidade estará disponível em breve!',
    type: MessageType.bot,
  ),
];
