import 'package:flutter/material.dart';

class OptionButtons extends StatelessWidget {
  final List<String> options;
  final void Function(String) onSelected;

  const OptionButtons({
    super.key,
    required this.options,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options
          .map(
            (option) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFE0B2),
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () => onSelected(option),
                child: Text(option),
              ),
            ),
          )
          .toList(),
    );
  }
}
