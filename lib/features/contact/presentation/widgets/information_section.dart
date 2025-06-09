// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:local_telephone_dairy/core/theme/app_color.dart';

class InformationSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String detail;

  const InformationSection({
    super.key,
    required this.icon,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tileColor: AppColor.white,
        leading: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 75, 99, 255).withOpacity(0.08),
          radius: 20,
          child: Icon(
            icon,
            color: AppColor.ctaBlue,
    
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColor.text2,
          ),
        ),
        subtitle: Text(
          detail,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
