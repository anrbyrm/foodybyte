import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodbyte/util/const.dart';
import 'package:sizer/sizer.dart';

class SearchCard extends HookWidget {
  const SearchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _searchTextController = useTextEditingController();

    return Card(
      elevation: 6,
      child: Container(
        decoration: const BoxDecoration(
          color: Constants.white,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: TextField(
          style: const TextStyle(
            fontSize: 15,
            color: Constants.black,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Constants.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Constants.white),
              borderRadius: BorderRadius.circular(5),
            ),
            hintText: 'Search',
            prefixIcon: const Icon(
              FluentIcons.search_48_regular,
              color: Constants.black,
            ),
            suffixIcon: const Icon(
              FluentIcons.filter_28_regular,
              color: Constants.black,
            ),
            hintStyle: TextStyle(
              fontSize: 10.sp,
              color: Constants.black,
            ),
          ),
          controller: _searchTextController,
        ),
      ),
    );
  }
}
