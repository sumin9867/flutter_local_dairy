// ignore_for_file: use_build_context_synchronously

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:local_telephone_dairy/core/presentation/snackbar_utils/snack_bar_utils.dart';
import 'package:local_telephone_dairy/core/presentation/utils.dart';
import 'package:local_telephone_dairy/core/theme/app_color.dart';
import 'package:local_telephone_dairy/features/contact/application/cubit/contact_cubit.dart';
import 'package:local_telephone_dairy/features/contact/application/cubit/contact_state.dart';
import 'package:local_telephone_dairy/features/contact/presentation/contact_detail_screen.dart';

class ContactList extends StatelessWidget {
  final String address;

  const ContactList({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactCubit, ContactState>(
      builder: (context, state) {
        if (state.status == ContactStatus.loading) {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state.status == ContactStatus.error) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errorMessage ?? 'Unexpected error')),
          );
        }

        if (state.status == ContactStatus.success) {
          // Filter contacts based on the provided address
          final filteredContacts = state.contacts.where((contact) {
            return contact.tole == address; // Ensure 'title' matches 'address'
          }).toList();

          if (filteredContacts.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(child: Text("No Contacts Found")),
            );
          }

          return SliverList.builder(
            itemCount: filteredContacts.length,
            itemBuilder: (context, index) {
              final contact = filteredContacts[index];
              return ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ContactDetailScreen(contact: contact),
                  ));
                },
                leading: const CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColor.background,
                  child: Icon(
                    IconsaxPlusLinear.profile,
                    color: AppColor.ctaBlue,
                  ),
                ),
                title: Text(contact.name),
                subtitle: Text(contact.phoneNumber),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        Utils.makePhoneCall(contact.phoneNumber);
                      },
                      icon: const Icon(
                        IconsaxPlusLinear.call,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(IconsaxPlusLinear.copy,
                          color: AppColor.hover),
                      onPressed: () {
                        FlutterClipboard.copy(contact.phoneNumber).then((value) {
                          SnackBarUtils.showSuccessMessage(
                            context,
                            "Phone Number Copied: ${contact.phoneNumber}",
                          );
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          );
        }

        return SliverToBoxAdapter(
          child: Center(child: Text("No Contacts Found")),
        );
      },
    );
  }
}
