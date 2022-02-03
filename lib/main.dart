import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodbyte/bloc/theme_bloc.dart';
import 'package:foodbyte/bloc/theme_state.dart';

import 'package:foodbyte/screens/main_screen.dart';
import 'package:foodbyte/util/const.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  /// my app const constructor, default thing u will need
  /// to do in all your flutter apps
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => BlocProvider(
        create: (_) => ThemeBloc(),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Constants.appName,
            theme: state.themeData,
            // darkTheme: Constants.darkTheme,
            home: const MainScreen(),
          ),
        ),
      ),
    );
  }
}
