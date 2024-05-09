import 'package:flutter/material.dart';

class DialogTextField extends StatelessWidget {
  const DialogTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.changed,
  });

  final TextEditingController controller;
  final String hint;
  final void Function(String) changed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
      ),
      onChanged: (value) {
        changed(value);
      },
    );
  }
}
