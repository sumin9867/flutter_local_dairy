
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:local_telephone_dairy/core/presentation/appbar/appbar_without_search.dart';
import 'package:local_telephone_dairy/core/presentation/snackbar_utils/snack_bar_utils.dart';
import 'package:local_telephone_dairy/features/contact/application/cubit/contact_cubit.dart';
import 'package:local_telephone_dairy/features/contact/application/cubit/contact_state.dart';
import 'package:local_telephone_dairy/features/contact/infrastructure/contact_repositary.dart';
import 'package:local_telephone_dairy/features/contact/presentation/widgets/add_contact_form.dart';

class AddContactScreen extends StatelessWidget {

  const AddContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ContactCubit(contactRepository: GetIt.instance<ContactRepository>()),
      child: Scaffold(
        appBar: const AppbarWithoutSearch(title: "Add New Contact"),
        body: BlocConsumer<ContactCubit, ContactState>(
          listener: (context, state) {
            if (state.status == ContactStatus.error && state.errorMessage != null) {
              SnackBarUtils.showErrorMessage(context, state.errorMessage!);
            } else if (state.status == ContactStatus.success) {
              SnackBarUtils.showSuccessMessage(context, "Contact added successfully");
              
        
            }
          },
          builder: (context, state) {
            if (state.status == ContactStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const AddContactForm();
            }
          },
        ),
      ),
    );
  }
}
