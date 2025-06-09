import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppFormBuilderEmailField extends StatelessWidget {
  final String name;
  final String hintText;
  final String labelText;
  final String? initialValue;
  final bool enabled;
  final FormFieldValidator<String>? validators;

  const AppFormBuilderEmailField({
    super.key,
    required this.name,
    required this.labelText,
    required this.hintText,
    this.initialValue,
    this.enabled = true,
    this.validators,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      initialValue: initialValue,
      enabled: enabled,
      decoration: InputDecoration(
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: const TextStyle(color: Colors.grey),
        labelText: labelText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      ),
      validator: validators ?? emailValidator,
    );
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }
}
