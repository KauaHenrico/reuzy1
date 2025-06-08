import '../models/message.dart';
import '../data/chat_flow.dart';

class FlowController {
  int _step = 0;
  final List<Message> _history = [];

  List<Message> get history => List.unmodifiable(_history);

  Message? get current => _step < chatFlow.length ? chatFlow[_step] : null;

  Future<void> next([String? userInput]) async {
    if (userInput != null) {
      _history.add(Message(text: userInput, type: MessageType.user));
      final prev = chatFlow[_step - 1];
      if (prev.next != null && prev.next![userInput] != null) {
        _step = prev.next![userInput]!;
      }
    }
    // Avança automaticamente por mensagens do bot sem opções/input
    while (_step < chatFlow.length) {
      final msg = chatFlow[_step];
      _history.add(msg);
      _step++;
      if (msg.options != null || msg.type == MessageType.input) {
        break; // Para quando precisa de interação do usuário
      }
    }
  }

  bool get hasNext => _step < chatFlow.length;
}
