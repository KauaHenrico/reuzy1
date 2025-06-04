import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20, // Substitua pelo número real de mensagens
              itemBuilder: (context, index) {
                return ListTile(title: Text('Mensagem ${index + 1}'));
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: ChatInputBar(
          controller: _controller,
          onSend: () {
            // Lógica para enviar a mensagem
            final message = _controller.text;
            if (message.isNotEmpty) {
              // Enviar mensagem
              _controller.clear();
            }
          },
          onImage: () {
            // Lógica para enviar imagem
          },
          onMic: () {
            // Lógica para gravação de áudio
          },
        ),
      ),
    );
  }
}

class ChatInputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback? onImage;
  final VoidCallback? onMic;

  const ChatInputBar({
    super.key,
    required this.controller,
    required this.onSend,
    this.onImage,
    this.onMic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 12, right: 12, top: 16, bottom: 25),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Digite sua mensagem...',
                filled: true,
                fillColor: const Color(0xFFFDF3E4),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.photo_camera, color: Color(0xFF146356)),
            onPressed: onImage,
          ),
          IconButton(
            icon: const Icon(Icons.mic, color: Color(0xFF146356)),
            onPressed: onMic,
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Color(0xFF146356)),
            onPressed: onSend,
          ),
        ],
      ),
    );
  }
}
