import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:local_telephone_dairy/core/presentation/form/app_form_builder_email_field.dart';
import 'package:local_telephone_dairy/core/presentation/form/app_form_builder_number.dart';
import 'package:local_telephone_dairy/core/presentation/form/app_form_builder_dropdown_field.dart';
import 'package:local_telephone_dairy/core/presentation/form/app_form_builder_text_field.dart';
import 'package:local_telephone_dairy/core/theme/app_color.dart';
import 'package:local_telephone_dairy/features/contact/application/cubit/contact_cubit.dart';
import 'package:local_telephone_dairy/features/contact/entities/contact_entities.dart';

class AddContactForm extends StatelessWidget {
  const AddContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return _FormContainer();
  }
}

class _FormContainer extends StatefulWidget {
  @override
  State<_FormContainer> createState() => __FormContainerState();
}

class __FormContainerState extends State<_FormContainer> {
  final _addContactFormKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FormBuilder(
        key: _addContactFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30),
              AppFormBuilderTextField(
                name: "name",
                labelText: "Name *",
                validators: FormBuilderValidators.required(
                  errorText: "This field is required",
                ),
                hintText: 'Name',
              ),
              const SizedBox(height: 12),
              const AppFormBuilderEmailField(
                  name: "email",
                  labelText: "E-mail",
                  hintText: "*****@gmail.com"),
              const SizedBox(
                height: 12,
              ),
              AppFormBuilderDropdownField(
                  name: "address",
                  labelText: "Address *",
                  validators: FormBuilderValidators.required(),
                  hintText: "",
                  items: const [
                    DropdownMenuItem(
                      value: "khokana",
                      child: Text("Khokana"),
                    ),
                    DropdownMenuItem(
                      value: "bungamati",
                      child: Text("Bungamati"),
                    ),
                    DropdownMenuItem(
                      value: "khokana_dobato",
                      child: Text("Khokana Dobato"),
                    ),
                  ]),
              const SizedBox(height: 12),
              AppFormBuilderDropdownField(
                  name: "tole",
                  labelText: "Tole *",
                  validators: FormBuilderValidators.required(),
                  hintText: "",
                  items: const [
                    DropdownMenuItem(
                      value: "nhyabu",
                      child: Text("Nhyabu"),
                    ),
                    DropdownMenuItem(
                      value: "gabu",
                      child: Text("Gabu"),
                    ),
                    DropdownMenuItem(
                      value: "taile",
                      child: Text("Taile"),
                    ),
                    DropdownMenuItem(
                      value: "nanchya",
                      child: Text("Nanchya"),
                    ),
                    DropdownMenuItem(
                      value: "thalxi",
                      child: Text("Thalxi"),
                    ),
                    DropdownMenuItem(
                      value: "thokasi",
                      child: Text("Thokasi"),
                    ),
                  ]),
              const SizedBox(height: 12),
              const AppFormBuilderNumber(
                name: 'telephone_number',
                labelText: 'Telephone Number',
                hintText: '+977 ********',
              ),
              const SizedBox(height: 12),
              AppFormBuilderTextField(
                name: "occupation",
                labelText: "Occupation *",
                validators: FormBuilderValidators.required(
                  errorText: "This field is required",
                ),
                hintText: 'Occupation',
              ),
              const SizedBox(height: 12),
              const AppFormBuilderTextField(
                name: 'citizenship_number',
                labelText: 'Citizenship Number',
                hintText: '000-000-0000000',
                validators: null,
              ),
              const SizedBox(height: 12),
              const AppFormBuilderTextField(
                name: 'pan_number',
                labelText: 'PAN Number',
                validators: null,
                hintText: '0000000000000',
              ),
              const SizedBox(height: 12),
              FormBuilderRadioGroup<String>(
                name: 'gender',
                initialValue: 'male',
                validator: FormBuilderValidators.required(),
                options: const [
                  FormBuilderFieldOption(
                    value: 'male',
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Male'),
                    ),
                  ),
                  FormBuilderFieldOption(
                    value: 'female',
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Female'),
                    ),
                  ),
                  FormBuilderFieldOption(
                    value: 'others',
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Others'),
                    ),
                  ),
                ],
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                activeColor: Colors.blue,
                controlAffinity: ControlAffinity.trailing,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  if (_addContactFormKey.currentState!.saveAndValidate()) {
                    final formData = _addContactFormKey.currentState!.value;

                    final contact = ContactEntities(
                        name: formData['name'],
                        phoneNumber: formData['telephone_number'],
                        address: formData['address'],
                        tole: formData['tole'],
                        occupation: formData['occupation'],
                        citizenshipNumber: formData['citizenship_number'],
                        gender: formData['gender'],
                        email: formData['email']);

                    log("Contact Created: ${contact.toString()}");

                    context.read<ContactCubit>().addContact(contact);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Send for Verfication",
                  style: TextStyle(
                      color: AppColor.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 52),
            ],
          ),
        ),
      ),
    );
  }
}
