import 'package:flutter/material.dart';
import 'package:reuzy/components/chat_bubble.dart';
import 'package:reuzy/components/option_buttons.dart';
import 'package:reuzy/components/text_input.dart';
import '../widgets/chat_input_bar.dart';
import '../widgets/custom_chat_appbar.dart';
import '../controllers/flow_controller.dart';
import '../models/message.dart';
import '../widgets/chat_options.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FlowController _controller = FlowController();
  final TextEditingController _inputController = TextEditingController();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final ScrollController _scrollController =
      ScrollController(); // <-- Adicione aqui
  bool isAcessivel = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addInitialMessages();
    });
  }

  void _addInitialMessages() {
    _controller.next();
    for (int i = 0; i < _controller.history.length; i++) {
      _listKey.currentState?.insertItem(
        i,
        duration: const Duration(milliseconds: 500),
      );
    }
    setState(() {});
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  void _handleOption(String option) {
    final oldLength = _controller.history.length;
    _controller.next(option);
    final newLength = _controller.history.length;
    if (newLength > oldLength) {
      for (int i = oldLength; i < newLength; i++) {
        _listKey.currentState?.insertItem(
          i,
          duration: const Duration(milliseconds: 500),
        );
      }
    }
    setState(() {});
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  void _handleInput(String input) {
    final oldLength = _controller.history.length;
    _controller.next(input);
    final newLength = _controller.history.length;
    if (newLength > oldLength) {
      for (int i = oldLength; i < newLength; i++) {
        _listKey.currentState?.insertItem(
          i,
          duration: const Duration(milliseconds: 500),
        );
      }
    }
    setState(() {});
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  @override
  void didUpdateWidget(covariant ChatScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    }
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
          const SizedBox(height: 8), // Espaço inicial no topo do chat
          Expanded(
            child: AnimatedList(
              key: _listKey,
              controller: _scrollController, // <-- Adicione aqui
              initialItemCount: messages.length,
              itemBuilder: (context, index, animation) {
                final msg = messages[index];
                final bool showOptions =
                    msg.options != null &&
                    msg.options!.isNotEmpty &&
                    index ==
                        messages.lastIndexWhere(
                          (m) => m.options != null && m.options!.isNotEmpty,
                        );
                final bool showInput =
                    msg.showInput &&
                    index == messages.lastIndexWhere((m) => m.showInput);

                return SizeTransition(
                  sizeFactor: animation,
                  child: ChatBubble(
                    text: msg.text,
                    isUser: msg.type == MessageType.user,
                    isAcessivel: isAcessivel,
                    options: msg.options,
                    onOptionSelected: (option) => _handleOption(option),
                    showOptions: showOptions,
                    showInput: showInput,
                    onInputSubmitted: (input) => _handleInput(input),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          (current != null && current.type == MessageType.input)
          ? null
          : ChatInputBar(
              controller: _inputController,
              onSend: () {
                final input = _inputController.text.trim();
                if (input.isNotEmpty) {
                  _handleInput(input);
                  _inputController.clear();
                }
              },
              onImage: () {},
              onMic: () {},
            ),
    );
  }
}
