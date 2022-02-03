import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodbyte/screens/categories.dart';
import 'package:foodbyte/screens/trending.dart';
import 'package:foodbyte/util/categories.dart';
import 'package:foodbyte/util/friends.dart';
import 'package:foodbyte/util/restaurants.dart';
import 'package:foodbyte/widgets/category_item.dart';
import 'package:foodbyte/widgets/search_card.dart';
import 'package:foodbyte/widgets/slide_item.dart';
import 'package:sizer/sizer.dart';

class Home extends HookWidget {
  const Home({Key? key}) : super(key: key);

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
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.fromLTRB(6.w, .5.h, 6.w, 3),
          child: ListView(
            padding: EdgeInsets.only(bottom: 3.h),
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              const SearchCard(),
              SizedBox(height: 2.h),
              buildRestaurantRow(context, 'Trending Restaurants')!,
              SizedBox(height: 1.h),
              buildRestaurantList(context)!,
              SizedBox(height: 1.h),
              buildCategoryRow(context, 'Category')!,
              SizedBox(height: 1.5.h),
              buildCategoryList(context)!,
              SizedBox(height: 2.h),
              buildCategoryRow(context, 'Friends', isFriendRow: true)!,
              SizedBox(height: 1.5.h),
              buildFriendsList()!,
            ],
          ),
        ),
      ),
    );
  }

  Widget? buildRestaurantRow(BuildContext context, String? restaurant) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '$restaurant',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
          ),
          child: Text(
            'See All (${restaurants.length})',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 10.sp,
            ),
          ),
          onPressed: () => Navigator.push<Widget>(
            context,
            MaterialPageRoute(
              builder: (context) => const Trending(),
            ),
          ),
        ),
      ],
    );
  }

  Widget? buildRestaurantList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.4,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: restaurants.length - 5,
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];

          return Padding(
            padding: EdgeInsets.only(right: 2.w),
            child: SlideItem(
              image: restaurant['img'],
              title: restaurant['title'],
              address: restaurant['address'],
              rating: restaurant['rating'],
            ),
          );
        },
      ),
    );
  }

  Widget? buildCategoryRow(
    BuildContext? context,
    String? category, {
    bool? isFriendRow = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          category!,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        if (isFriendRow!)
          Container()
        else
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
            ),
            onPressed: () => Navigator.push<Widget>(
              context!,
              MaterialPageRoute(
                builder: (context) => const Categories(),
              ),
            ),
            child: Text(
              'See all (${categories.length})',
              style: TextStyle(
                color: Theme.of(context!).colorScheme.secondary,
                fontSize: 10.sp,
              ),
            ),
          )
      ],
    );
  }

  Widget? buildCategoryList(BuildContext? context) {
    return SizedBox(
      height: MediaQuery.of(context!).size.height / 6,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];

          return CategoryItem(category: category);
        },
      ),
    );
  }

  Widget? buildFriendsList() {
    return SizedBox(
      height: 5.h,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: friends.length,
        itemBuilder: (BuildContext context, int index) {
          final image = friends[index];

          return Padding(
            padding: EdgeInsets.only(right: 2.w),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                image,
              ),
              radius: 25,
            ),
          );
        },
      ),
    );
  }
}
