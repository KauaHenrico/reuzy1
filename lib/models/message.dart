enum MessageType { bot, user, input, options }

class Message {
  final String text;
  final MessageType type;
  final List<String>? options;
  final Map<String, int>? next;
  final bool showInput; // <-- Adicione isso

  Message({
    required this.text,
    required this.type,
    this.options,
    this.next,
    this.showInput = false, // <-- valor padrão
  });
}
