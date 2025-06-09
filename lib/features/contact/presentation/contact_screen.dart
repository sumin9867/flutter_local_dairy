// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:local_telephone_dairy/core/presentation/animation/app_animated_switcher.dart';
import 'package:local_telephone_dairy/core/presentation/app_router.dart';
import 'package:local_telephone_dairy/core/presentation/snackbar_utils/snack_bar_utils.dart';
import 'package:local_telephone_dairy/core/presentation/utils.dart';
import 'package:local_telephone_dairy/core/theme/app_color.dart';
import 'package:local_telephone_dairy/features/catagories/presentation/contact_catogories.dart';
import 'package:local_telephone_dairy/features/contact/application/cubit/contact_cubit.dart';
import 'package:local_telephone_dairy/features/contact/application/cubit/contact_state.dart';
import 'package:local_telephone_dairy/features/contact/presentation/contact_detail_screen.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactCubit, ContactState>(
      builder: (context, state) {
        switch (state.status) {
          case ContactStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case ContactStatus.success:
            return _buildSuccessState(context, state);
          case ContactStatus.error:
            return Center(
              child: Text(state.errorMessage ?? "Unexpected Error Occurred"),
            );
          default:
            return const Center(
                child: Text("Unexpected Error Occurred, Try Again"));
        }
      },
    );
  }

  Scaffold _buildSuccessState(BuildContext context, ContactState state) {
    return Scaffold(

      floatingActionButton: FloatingActionButton.extended(
        key: const Key('add_contact_fab'),
        backgroundColor: AppColor.primaryColor,
        onPressed: () => context.push(AppRoutes.addContact),
        label: const Text(
          "Add Contact",
          style: TextStyle(color: Colors.white), // white text
        ),
        icon: const Icon(
          IconsaxPlusLinear.add_circle,
          color: Colors.white, // white icon
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // more rounded corners
        ),
      ),
      body: AppAnimatedSwitcher(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Icon(IconsaxPlusLinear.profile),
                      SizedBox(
                        width: 6,
                      ),
                      Text("Sumin Mhrx")
                    ],
                  ),
                )
              ],
              leading: const Padding(
                padding: EdgeInsets.only(left: 12),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(IconsaxPlusLinear.search_normal_1),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Icon(IconsaxPlusLinear.arrow_right_3)
                  ],
                ),
              ),
            ),
        ContactCategories(
            onCategorySelected: (selectedAddress) {
              // Handle the selected address here
              log('Selected Address: $selectedAddress');
              // For example: fetch contacts or navigate to another screen
            },
          ),
            SliverList.builder(
              itemCount: state.contacts.length,
              itemBuilder: (context, index) {
                final data = state.contacts[index];
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ContactDetailScreen(contact: data),
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
                  title: Text(data.name),
                  subtitle: Text(data.phoneNumber),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          Utils.makePhoneCall(data.phoneNumber);
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
                          FlutterClipboard.copy(data.phoneNumber).then((value) {
                            SnackBarUtils.showSuccessMessage(
                              context,
                              "Phone Number Copied: ${data.phoneNumber}",
                            );
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
