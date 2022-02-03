import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodbyte/bloc/theme_bloc.dart';
import 'package:foodbyte/bloc/theme_event.dart';
import 'package:foodbyte/util/const.dart';

class Profile extends HookWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => context.read<ThemeBloc>().add(
                  const ThemeChangedEvent(AppTheme.dark),
                ),
            child: const Text('Change to Dark'),
          ),
          ElevatedButton(
            onPressed: () => context.read<ThemeBloc>().add(
                  const ThemeChangedEvent(AppTheme.light),
                ),
            child: const Text('Change to Light'),
          ),
        ],
      ),
    );
  }
}
