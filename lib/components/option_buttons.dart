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
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black87,
                  side: const BorderSide(color: Color(0xFFB2DFDB), width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 16,
                  ),
                  elevation: 2,
                  shadowColor: Colors.black12,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () => onSelected(option),
                child: Text(option, textAlign: TextAlign.center),
              ),
            ),
          )
          .toList(),
    );
  }
}
