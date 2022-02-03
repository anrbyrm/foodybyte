import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodbyte/util/categories.dart';
import 'package:foodbyte/util/const.dart';
import 'package:sizer/sizer.dart';

class Categories extends HookWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
          style: TextStyle(color: Constants.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(.5.h),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            categories.length,
            (index) {
              final Map<dynamic, dynamic> category = categories[index];
              return Container(
                padding: EdgeInsets.all(2.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        category['img'] as String,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: const [.2, .7],
                            colors: [
                              category['color1'] as Color,
                              category['color2'] as Color,
                            ],
                          ),
                        ),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.height,
                      ),
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.height,
                          padding: const EdgeInsets.all(1),
                          child: Center(
                            child: Text(
                              category['name'] as String,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
