import 'package:flutter/material.dart';

class ChatOptions extends StatelessWidget {
  final List<String> options;
  final void Function(String) onSelected;

  const ChatOptions({
    super.key,
    required this.options,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: options.map((option) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 0),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF217A6B), // texto verde
              backgroundColor: Colors.white,
              side: const BorderSide(color: Color(0xFF217A6B), width: 2), // borda verde
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24), // formato pill
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () => onSelected(option),
            child: Text(option, textAlign: TextAlign.center),
          ),
        );
      }).toList(),
    );
  }
}
