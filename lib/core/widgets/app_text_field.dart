import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Reusable application text field.
class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.controller,
    required this.label,
    required this.hint,
    this.focusNode,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters,
    this.validator,
    this.onFieldSubmitted,
    super.key,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(labelText: label, hintText: hint),
    );
  }
}
