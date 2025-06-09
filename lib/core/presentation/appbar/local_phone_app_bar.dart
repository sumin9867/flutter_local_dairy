import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:local_telephone_dairy/core/presentation/search/search_container.dart';
import 'package:local_telephone_dairy/core/theme/app_color.dart';
import 'package:local_telephone_dairy/features/contact/entities/contact_entities.dart';
import 'package:local_telephone_dairy/features/contact/presentation/widgets/search_screen.dart';

class LocalPhoneAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<ContactEntities> contact;
  final String title;

  const LocalPhoneAppBar({
    super.key,
    required this.title,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
    
      // leading: const CircleAvatar(
      //     backgroundColor: AppColor.primaryColor,
      //     radius: 8,
      //     child: Icon(IconsaxPlusBold.profile)),
      // title: BlocBuilder<ProfileCubit, ProfileState>(
      //   builder: (context, state) {
      //     if (state is ProfileLoading) {
      //       return const Text("......");
      //     }
      //     if (state is ProfileLoaded) {
      //       return Text(
      //         "Hello, ${state.userModel.name} 😊",
      //         style: const TextStyle(color: Colors.black),
      //       );
      //     }
      //     return const Text("Hello,Have a good Day 😊");
      //   },
      // ),
      title: GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SearchScreen(contact: contact))),
          child: const SearchContainer()),
      actions: [
        IconButton(
          icon:  const Icon(IconsaxPlusLinear.notification,color: AppColor.dark,),
          onPressed: () {
          
          },
        ),
        const SizedBox(
          width: 15,
        ),
        const Icon(IconsaxPlusLinear.profile,color: AppColor.dark,),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
