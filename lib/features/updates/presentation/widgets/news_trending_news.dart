import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:local_telephone_dairy/core/responsive_size.dart';

class NewsTrendingNews extends StatelessWidget {
  const NewsTrendingNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            log('Tapped on Card $index');
          },
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 8,
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/news.jpg',
                fit: BoxFit.fill,
                height: 200,
                width: ScreenUtils.getWidth(
                  context,
                  .15,
                ),
              ),
            ),
            title: const Text(
              'Sikali Jatra Starting From 26 Aug',
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: const Text(
              'Basically, it is a town where a Sikali festival is celebrated, and now I can say I am happy that Jatra is coming.',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        );
      },
      itemCount: 5,
    );
  }
}
