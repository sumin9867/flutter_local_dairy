import 'package:flutter/material.dart';
import 'package:local_telephone_dairy/core/responsive_size.dart';
import 'package:local_telephone_dairy/core/theme/app_color.dart';


class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.all(16),
          margin: EdgeInsets.all(8),
          width: ScreenUtils.getWidth(context, .5),
          child: Text(
            '"The best doctor in the world is a veterinarian. \n They cant ask their patients whats \n wrong , they have got to just know."',
            style: TextStyle(
              fontSize: ScreenUtils.getHeight(context, .016),
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * .46,

          // child: Image.asset(
          //   'assets/.png',
          //   width: MediaQuery.of(context).size.height * .18,
          //   height: MediaQuery.of(context).size.height * .19,
          // ),
          child: Image.asset(
            "assets/images/news.jpg",
            width: ScreenUtils.getWidth(context, 100),
            height: MediaQuery.of(context).size.height * .19,
          ),
        ),
      ],
    );
  }
}
