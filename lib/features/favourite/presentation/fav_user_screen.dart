import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:local_telephone_dairy/core/theme/app_color.dart';

class FavoriteContactsScreen extends StatelessWidget {
   FavoriteContactsScreen({super.key});
  final List<Map<String, String>> favoriteContacts = [
    {
      'name': 'Alice Johnson',
      'phone': '+1 234 567 890',
      'avatarUrl': 'https://randomuser.me/api/portraits/women/1.jpg',
    },
    {
      'name': 'Bob Smith',
      'phone': '+1 987 654 321',
      'avatarUrl': 'https://randomuser.me/api/portraits/men/2.jpg',
    },
    {
      'name': 'Carol Williams',
      'phone': '+1 555 123 456',
      'avatarUrl': 'https://randomuser.me/api/portraits/women/3.jpg',
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: CustomScrollView(
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
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final contact = favoriteContacts[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(contact['avatarUrl']!),
                    ),
                    title: Text(contact['name']!),
                    subtitle: Text(contact['phone']!),
                    trailing: Icon(IconsaxPlusBold.lovely, color: AppColor.error2),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Tapped on ${contact['name']}')),
                      );
                    },
                  );
                },
                childCount: favoriteContacts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}