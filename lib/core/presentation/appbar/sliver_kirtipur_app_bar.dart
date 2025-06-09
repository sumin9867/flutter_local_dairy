import 'package:flutter/material.dart';
import 'package:local_telephone_dairy/core/theme/app_color.dart';

class SliverKritipurAppbar extends StatelessWidget {
  final String title;

  const SliverKritipurAppbar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      primary: true,
      foregroundColor: AppColor.white,
      backgroundColor: AppColor.primaryColor,
      centerTitle: false,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w600,
          color: AppColor.offWhite,
        ),
      ),
    );
  }
}
