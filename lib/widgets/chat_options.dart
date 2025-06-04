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
      children: options.map((option) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.teal[900],
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () => onSelected(option),
            child: Text(option),
          ),
        );
      }).toList(),
    );
  }
}