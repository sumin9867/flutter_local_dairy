import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_telephone_dairy/core/theme/app_color.dart';
import 'package:local_telephone_dairy/core/theme/responsive_size.dart';
import 'package:local_telephone_dairy/features/profile/application/cubit/profile_cubit_cubit.dart';
import 'package:local_telephone_dairy/features/profile/application/cubit/profile_cubit_state.dart';
import 'package:local_telephone_dairy/features/profile/domain/user_model.dart';
import 'package:local_telephone_dairy/features/profile/presentation/edit_profile.dart';
import 'package:local_telephone_dairy/features/profile/presentation/view_profile.dart';
import 'package:local_telephone_dairy/features/profile/presentation/widgets/logout_confirmation_dailog.dart';
import 'package:local_telephone_dairy/features/profile/presentation/widgets/profile_item.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = 'Profile';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _profileImage;
  bool _uploadingImage = false;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
      _updateProfilePicture();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileLoaded) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  floating: false,
                  backgroundColor: AppColor.background,
                  elevation: 0,
                  leading: const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(IconsaxPlusLinear.search_normal_1),
                    ),
                  ),
                  actions: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(IconsaxPlusLinear.profile),
                          const SizedBox(width: 6),
                          Text(state.userModel.name),
                        ],
                      ),
                    )
                  ],
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Stack(
                        children: [
                          Center(
                            child: GestureDetector(
                              onTap: _pickImage,
                              child: Container(
                                padding: const EdgeInsets.all(
                                    4), // Thickness of white border
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white, // Border color
                                ),
                                child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundColor: Colors.grey[200],
                                  child: state.userModel.profileImageUrl !=
                                              null &&
                                          state.userModel.profileImageUrl!
                                              .isNotEmpty
                                      ? CachedNetworkImage(
                                          imageUrl:
                                              state.userModel.profileImageUrl!,
                                          placeholder: (context, url) =>
                                              const Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              Text(
                                            state
                                                .userModel.name.characters.first
                                                .toUpperCase(),
                                            style: const TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        )
                                      : Text(
                                          state.userModel.name.characters.first
                                              .toUpperCase(),
                                          style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                          if (_uploadingImage)
                            const Positioned.fill(
                              child: Center(child: CircularProgressIndicator()),
                            ),
                          Positioned(
                            bottom: ScreenUtils.getHeight(context, .006),
                            left: ScreenUtils.getWidth(context, .27),
                            child: const CircleAvatar(
                              child: Icon(IconsaxPlusLinear.image),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        state.userModel.name,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        state.userModel.email,
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ViewProfile(userModel: state.userModel),
                            ));
                          },
                          child: const ProfileItem(
                            icon: IconsaxPlusLinear.profile,
                            text: 'View Profile',
                            subText: "Check your personal information",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const EditProfile(),
                            ));
                          },
                          child: const ProfileItem(
                            icon: IconsaxPlusLinear.edit,
                            text: 'Edit Profile',
                            subText: "Update your name, email, and more",
                          ),
                        ),
                        GestureDetector(
                          onTap: () => LogoutConfirmationDialog.show(context),
                          child: const ProfileItem(
                            icon: IconsaxPlusLinear.logout,
                            text: 'Logout',
                            subText: "Sign out of your account safely",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 30)),
              ],
            );
          } else if (state is ProfileError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${state.message}',
                      style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<ProfileCubit>().fetchUserProfile(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  void _updateProfilePicture() async {
    if (_profileImage != null) {
      final userProfileState = context.read<ProfileCubit>().state;
      String name = '';
      String email = '';
      String location = '';
      String profileImageUrl = '';

      if (userProfileState is ProfileLoaded) {
        name = userProfileState.userModel.name;
        email = userProfileState.userModel.email;
        location = userProfileState.userModel.location;
        profileImageUrl = userProfileState.userModel.profileImageUrl ?? '';
      }

      setState(() {
        _uploadingImage = true;
      });

      UserModel updatedUser = UserModel(
        id: userProfileState is ProfileLoaded
            ? userProfileState.userModel.id
            : "",
        name: name,
        email: email,
        location: location,
        profileImageUrl: profileImageUrl,
        admin: false,
      );

      try {
        await context
            .read<ProfileCubit>()
            .updateuser(updatedUser, _profileImage);

        setState(() {
          _uploadingImage = false;
        });
      } catch (e) {
        setState(() {
          _uploadingImage = false;
        });
      }
    }
    // ignore: use_build_context_synchronously
    context.read<ProfileCubit>().fetchUserProfile();
  }
}
