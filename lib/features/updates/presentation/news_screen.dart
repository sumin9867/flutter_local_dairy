import 'package:flutter/material.dart';
import 'package:local_telephone_dairy/core/presentation/appbar/appbar_without_search.dart';
import 'package:local_telephone_dairy/core/theme/app_color.dart';
import 'package:local_telephone_dairy/features/updates/presentation/widgets/news_carousel.dart';
import 'package:local_telephone_dairy/features/updates/presentation/widgets/news_trending_news.dart';

class NewsScreen extends StatelessWidget {


  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarWithoutSearch(title: "News and Updates"),
      body: CustomScrollView(
        slivers: [
          NewsCarousel(),

          SliverToBoxAdapter(
          
            child: Padding(
              padding: EdgeInsets.only(left: 14,top: 20),
              child: Text("Trending News",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColor.primaryColor),),
            ),
          ),
          NewsTrendingNews()
        ],
      ),
    );
  }
}
