// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';


class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
  
      decoration:  const BoxDecoration(
   
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Row(
          
          children: [
             Icon(
              IconsaxPlusLinear.search_normal_1,
              color: Colors.black,
            ),
            SizedBox(width: 20,),
            Text(
              "Search your People ",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
  
          ],
        ),
      ),
    );
  }
}
