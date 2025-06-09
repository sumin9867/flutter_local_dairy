import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';

class AppFormBuilderFilePicker extends StatelessWidget {
  const AppFormBuilderFilePicker({
    super.key,
    required this.name,
    required this.allowMultiple,
    required this.labelText,
    this.hintText,
    this.maxFiles,
  });

  final String name;
  final bool allowMultiple;
  final String labelText;
  final String? hintText;
  final int? maxFiles;

  @override
  Widget build(BuildContext context) {
    return FormBuilderFilePicker(
      name: name,
      allowMultiple: allowMultiple,
      valueTransformer: (value) {
        if (value != null && value.isNotEmpty) {
          return File(value.first.path!);
        }
      },
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText,
      ),
      maxFiles: maxFiles,
    );
  }
}
