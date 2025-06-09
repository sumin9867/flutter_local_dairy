// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:local_telephone_dairy/core/theme/app_color.dart';

class ProfileContainer extends StatelessWidget {
  final String name;
  final IconData icon;

  const ProfileContainer({super.key, 
    required this.name,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.blue.withOpacity(0.08), 
          child: Icon(
            icon,
            size: 40,
            color: AppColor.ctaBlue, 
          ),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
