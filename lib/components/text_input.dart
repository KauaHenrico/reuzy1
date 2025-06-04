import 'package:flutter/material.dart';

class ChatTextInput extends StatefulWidget {
  final void Function(String) onSubmitted;

  const ChatTextInput({super.key, required this.onSubmitted});

  @override
  State<ChatTextInput> createState() => _ChatTextInputState();
}

class _ChatTextInputState extends State<ChatTextInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Digite sua resposta...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                fillColor: Color(0xFFFFFFFF),
                filled: true,
              ),
              onSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  widget.onSubmitted(value.trim());
                  _controller.clear();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
