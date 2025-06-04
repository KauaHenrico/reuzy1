import '../models/message.dart';

final List<Message> chatFlow = [
  Message(
    text:
        '👋 Olá! Bem-vindo(a) ao app Reuzy. Me chamo Solidarynho e estou aqui para te ajudar! 😁👌Antes de começarmos, você gostaria de usar a versão com mais acessibilidade?',
    type: MessageType.bot,
  ),
  Message(
    text:
        '📖 Modo acessível oferece:\n• Fontes maiores\n• Contraste alto\n• Textos mais claros e objetivos',
    type: MessageType.bot,
  ),
  Message(
    text: '',
    type: MessageType.bot,
    options: [
      'Não, continuar com visual padrão',
      'Sim, quero um visual acessível',
    ],
  ),
  Message(
    text:
        'Tudo bem! Você pode ativar a versão acessível depois, quando quiser, no menu principal.',
    type: MessageType.bot,
  ),
  Message(
    text:
        'Vi aqui que você não está logado em nenhuma conta. Você já tem uma conta no Reuzy?',
    type: MessageType.bot,
    options: ['Quero me cadastrar'],
  ),
  Message(text: 'Informe seu e-mail:', type: MessageType.bot, options: null),
  Message(
    text: '',
    type: MessageType.input, // Mostra campo de texto
  ),
  Message(
    text: 'Seu email está correto?',
    type: MessageType.bot,
    options: ['Meu email está correto!'],
  ),
  Message(text: 'Informe sua senha:', type: MessageType.bot, options: null),
  Message(text: '', type: MessageType.input),
  Message(
    text: 'Você deseja cadastrar com CPF ou CNPJ?',
    type: MessageType.bot,
    options: ['CPF', 'CNPJ'],
  ),
  Message(text: 'Informe seu CPF:', type: MessageType.bot, options: null),
  Message(text: '', type: MessageType.input),
  Message(
    text: 'Informe seu número de telefone com DDD:',
    type: MessageType.bot,
    options: null,
  ),
  Message(text: '', type: MessageType.input),
  Message(
    text: 'Qual o seu papel na comunidade?',
    type: MessageType.bot,
    options: [
      '🙋‍♂️ Sou doador',
      'Preciso de ajuda',
      'Ofereço serviço',
      'Outro',
    ],
  ),
  Message(text: '🎉 Cadastro concluído com sucesso!', type: MessageType.bot),
  Message(
    text:
        'Agora você pode:\n• 📦 Anunciar doações\n• 🔍 Buscar ou solicitar ajuda\n• 🛠️ Oferecer serviços',
    type: MessageType.bot,
  ),
  Message(
    text: 'O que deseja fazer agora?',
    type: MessageType.bot,
    options: [
      '📦 Anunciar doação',
      '🔍 Buscar doações',
      '🛠️ Anunciar serviço',
      '👤 Ver meu perfil',
    ],
  ),
];
