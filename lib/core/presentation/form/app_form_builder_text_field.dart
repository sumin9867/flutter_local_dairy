import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppFormBuilderTextField extends StatelessWidget {
  final String name;
  final String hintText;

  final String labelText;
  final FormFieldValidator<String>? validators;
  final String? initialValue;
  final bool enabled;
  final int? maxLines;

  const AppFormBuilderTextField({
    super.key,
    required this.name,
    required this.labelText,
    required this.validators,
    required this.hintText,
    this.initialValue,
    this.enabled = true,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      initialValue: initialValue,
      enabled: enabled,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
      ),
      validator: validators,
      autovalidateMode:AutovalidateMode.onUnfocus ,
textInputAction: TextInputAction.next,


    );
  }
}
