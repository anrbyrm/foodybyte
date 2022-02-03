import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodbyte/screens/screens.dart';
import 'package:foodbyte/util/const.dart';
import 'package:sizer/sizer.dart';

class MainScreen extends HookWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pageController = usePageController();
    final _page = useState<int>(0);

    final _icons = <IconData>[
      FluentIcons.home_48_filled,
      Icons.label_rounded,
      FluentIcons.add_28_filled,
      FluentIcons.alert_32_filled,
      FluentIcons.person_48_filled,
    ];

    final _pages = <Widget>[
      const Home(),
      const Label(),
      const Add(),
      const Notifications(),
      const Profile(),
    ];

    Widget? buildTabIcon(int? index) {
      return Container(
        margin: EdgeInsets.fromLTRB(
          index == 3 ? 6.w : 0,
          .3.h,
          index == 1 ? 30 : 0,
          .3.h,
        ),
        child: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          icon: Icon(
            _icons[index!],
          ),
          color: _page.value == index
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).textTheme.caption!.color,
          onPressed: () => _pageController.jumpToPage(index),
        ),
      );
    }

    void onPageChanged(int? pageIndex) {
      _page.value = pageIndex!;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: onPageChanged,
          children: List.generate(5, (index) => _pages[index]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildTabIcon(0)!,
            buildTabIcon(1)!,
            buildTabIcon(3)!,
            buildTabIcon(4)!,
          ],
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        onPressed: () => _pageController.jumpToPage(2),
        child: Icon(_icons[2], color: Constants.white, size: 16.sp),
      ),
    );
  }
}
