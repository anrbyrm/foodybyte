import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodbyte/util/const.dart';
import 'package:sizer/sizer.dart';

class TrendingItem extends HookWidget {
  const TrendingItem({
    Key? key,
    this.img,
    this.title,
    this.address,
    this.rating,
  }) : super(key: key);

  final String? img;
  final String? title;
  final String? address;
  final String? rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.asset(
                      img!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 2.h,
                  right: 2.w,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(.5.h),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.star_rounded,
                            color: Constants.ratingBG,
                            size: 7.sp,
                          ),
                          SizedBox(width: .5.w),
                          Padding(
                            padding: EdgeInsets.only(top: .2.h),
                            child: Text(
                              rating!,
                              style: TextStyle(
                                fontSize: 7.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: .5.w),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 2.h,
                  left: 2.w,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(.5.h) +
                          EdgeInsets.symmetric(
                            horizontal: 1.w,
                            vertical: .2.h,
                          ) +
                          EdgeInsets.only(top: .1.h),
                      child: Text(
                        'open'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 7.sp,
                          color: Colors.green,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.only(left: 3.w),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  title!,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(height: .5.h),
            Padding(
              padding: EdgeInsets.only(left: 3.w),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  address!,
                  style: TextStyle(
                    fontSize: 9.sp,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 3.5.h),
          ],
        ),
      ),
    );
  }
}
