import '../models/message.dart';
import '../data/chat_flow.dart';

class FlowController {
  int _step = 0;
  final List<Message> _history = [];

  List<Message> get history => List.unmodifiable(_history);

  Message? get current => _step < chatFlow.length ? chatFlow[_step] : null;

  void next([String? userInput]) {
    if (userInput != null) {
      _history.add(Message(text: userInput, type: MessageType.user));
    }
    // Avança automaticamente por mensagens bot sem opções/input
    while (_step < chatFlow.length) {
      final msg = chatFlow[_step];
      _history.add(msg);
      _step++;
      if (msg.options != null || msg.type == MessageType.input) {
        break;
      }
    }
  }

  bool get hasNext => _step < chatFlow.length;
}
