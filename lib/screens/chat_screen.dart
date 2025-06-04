import 'package:flutter/material.dart';
import 'package:reuzy/components/chat_bubble.dart';
import 'package:reuzy/components/option_buttons.dart';
import 'package:reuzy/components/text_input.dart';
import '../widgets/chat_input_bar.dart';
import '../widgets/custom_chat_appbar.dart';
import '../controllers/flow_controller.dart';
import '../models/message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FlowController _controller = FlowController();
  final TextEditingController _inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.next(); // Mostra as mensagens iniciais automaticamente
  }

  void _handleOption(String option) {
    setState(() {
      _controller.next(option);
    });
  }

  void _handleInput(String input) {
    setState(() {
      _controller.next(input);
    });
  }

  @override
  Widget build(BuildContext context) {
    final messages = _controller.history;
    final current = _controller.hasNext ? _controller.current : null;

    return Scaffold(
      backgroundColor: const Color(0xFFFAF3E0),
      appBar: const CustomChatAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ...messages.map(
                  (msg) => ChatBubble(
                    text: msg.text,
                    isUser: msg.type == MessageType.user,
                  ),
                ),
                if (current != null && current.options != null)
                  OptionButtons(
                    options: current.options!,
                    onSelected: _handleOption,
                  ),
              ],
            ),
          ),
          if (current != null && current.type == MessageType.input)
            ChatTextInput(onSubmitted: _handleInput),
        ],
      ),
      // Só mostra a barra fixa se NÃO for input
      bottomNavigationBar:
          (current != null && current.type == MessageType.input)
          ? null
          : ChatInputBar(
              controller: _inputController,
              onSend: () {
                // Lógica para enviar mensagem
              },
              onImage: () {
                // Lógica para enviar imagem
              },
              onMic: () {
                // Lógica para gravar áudio
              },
            ),
    );
  }
}
