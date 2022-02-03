import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:foodbyte/bloc/theme_event.dart';
import 'package:foodbyte/bloc/theme_state.dart';
import 'package:foodbyte/util/const.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(themeData: Constants().appThemeData[AppTheme.dark])) {
    on<ThemeChangedEvent>(_themeChangedEvent);
  }

  void _themeChangedEvent(ThemeChangedEvent event, Emitter<ThemeState> emit) {
    emit(ThemeState(themeData: Constants().appThemeData[event.theme]));
  }
}
