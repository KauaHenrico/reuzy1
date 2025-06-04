enum MessageType { bot, user, input, options }

class Message {
  final String text;
  final MessageType type;
  final List<String>? options;

  Message({required this.text, required this.type, this.options});
}
