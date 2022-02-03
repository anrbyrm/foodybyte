import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodbyte/util/restaurants.dart';
import 'package:foodbyte/widgets/search_card.dart';
import 'package:foodbyte/widgets/trending.dart';
import 'package:sizer/sizer.dart';

class Trending extends HookWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Trending Restaurants'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: .5.h),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              SizedBox(height: 2.h),
              const SearchCard(),
              SizedBox(height: 2.h),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: restaurants.length,
                itemBuilder: (BuildContext context, int index) {
                  final restaurant = restaurants[index];

                  return TrendingItem(
                    img: restaurant['img'],
                    title: restaurant['title'],
                    address: restaurant['address'],
                    rating: restaurant['rating'],
                  );
                },
              ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}
