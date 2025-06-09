import 'package:flutter/material.dart';
import 'package:local_telephone_dairy/core/theme/app_color.dart';

class AppbarWithoutSearch extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const AppbarWithoutSearch({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: AppColor.white,
      backgroundColor: AppColor.primaryColor,
      centerTitle: false,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          letterSpacing: 1,
          fontWeight: FontWeight.w600,
          color: AppColor.offWhite,
        ),
      ),
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     bottomLeft: Radius.circular(20),
      //     bottomRight: Radius.circular(20),
      //   ),
      // ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 5);
}
