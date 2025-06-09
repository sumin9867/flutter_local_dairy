import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/services.dart';

class AppFormBuilderNumber extends StatelessWidget {
  final String name;
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final String? initialValue;

  const AppFormBuilderNumber({
    super.key,
    required this.name,
    required this.labelText,
    this.validator,
    required this.hintText,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      initialValue: initialValue != null ? '+977 $initialValue' : '+977 ',
      validator: validator,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly, 
        LengthLimitingTextInputFormatter(15),  
      ],
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
      ),
      valueTransformer: (value) {
        
        if (value != null && !value.startsWith('+977')) {
          return '+977$value';
        }
        return value;
      },
    );
  }
}
