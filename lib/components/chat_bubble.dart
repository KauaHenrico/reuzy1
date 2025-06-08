import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isUser;
  final bool isAcessivel;
  final List<String>? options;
  final void Function(String)? onOptionSelected;
  final bool showOptions;
  final bool showInput;
  final void Function(String)? onInputSubmitted;

  const ChatBubble({
    super.key,
    required this.text,
    this.isUser = false,
    this.isAcessivel = false,
    this.options,
    this.onOptionSelected,
    this.showOptions = false,
    this.showInput = false,
    this.onInputSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8), // Espaço entre mensagens
      child: Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!isUser)
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 20.0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 18,
                  backgroundImage: AssetImage('assets/chat.png'),
                ),
              ),
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.8,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 4,
                  ),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: isUser
                        ? const Color(0xFFFFE0B2)
                        : const Color(0xFFB2DFDB),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                          fontSize: isAcessivel ? 20 : 16,
                          color: isAcessivel ? Colors.black : Colors.black87,
                        ),
                        softWrap: true,
                      ),
                      if (showOptions && options != null && options!.isNotEmpty)
                        ...options!.map(
                          (option) => Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: const Color.fromARGB(
                                  255,
                                  50,
                                  50,
                                  50,
                                ),
                                backgroundColor: Colors.white,
                                side: const BorderSide(
                                  color: Color(0xFF217A6B),
                                  width: 2,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 24,
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onPressed: () => onOptionSelected?.call(option),
                              child: Text(option, textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                      if (showInput)
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: 'Digite aqui...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(18),
                                ),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            onSubmitted: (value) {
                              if (value.trim().isNotEmpty) {
                                onInputSubmitted?.call(value.trim());
                              }
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
