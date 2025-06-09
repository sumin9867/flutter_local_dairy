import 'package:flutter/material.dart';
import 'package:local_telephone_dairy/core/theme/app_color.dart';

class ContactCategories extends StatefulWidget {
  final void Function(String selectedAddress) onCategorySelected;

  const ContactCategories({
    super.key,
    required this.onCategorySelected,
  });

  @override
  State<ContactCategories> createState() => _ContactCategoriesState();
}

class _ContactCategoriesState extends State<ContactCategories> {
  final List<String> addresses = [
    "Nhyabu",
    "Gabu",
    "Taile",
    "Nanchya",
    "Thalxi",
    "Thokasi",
    "Kutupukhu",
  ];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 75,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: addresses.length,
          itemBuilder: (context, index) => _buildCategoryItem(index),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(int index) {
    final isSelected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: () => _onCategoryTap(index),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColor.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              addresses[index],
              maxLines: 1,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onCategoryTap(int index) {
    setState(() => selectedIndex = index);
    widget.onCategorySelected(addresses[index]);
  }
}
