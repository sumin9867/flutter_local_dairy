import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppFormBuilderDropdownField<T> extends StatelessWidget {
  final String name;
  final String hintText;

  final String labelText;
  final FormFieldValidator<T>? validators;
  final T? initialValue;
  final bool enabled;
  final int? maxLines;
  final List<DropdownMenuItem<T>> items;

  const AppFormBuilderDropdownField({
    super.key,
    required this.name,
    required this.labelText,
    required this.validators,
    required this.hintText,
    this.initialValue,
    this.enabled = true,
    this.maxLines,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<T>(
      name: name,
      // Set initial value to the first item if initialValue is not provided
      initialValue: initialValue ?? (items.isNotEmpty ? items.first.value : null),
      enabled: enabled,
      items: items,
      decoration: InputDecoration(
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: const TextStyle(color: Colors.grey),
        labelText: labelText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      ),
      validator: validators,
    );
  }
}
