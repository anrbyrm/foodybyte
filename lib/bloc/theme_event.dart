import 'package:equatable/equatable.dart';
import 'package:foodbyte/util/const.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeChangedEvent extends ThemeEvent {
  const ThemeChangedEvent(this.theme);

  final AppTheme theme;

  @override
  List<Object?> get props => [theme];
}
