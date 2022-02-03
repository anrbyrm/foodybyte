import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  const ThemeState({this.themeData});

  final ThemeData? themeData;

  @override
  List<Object?> get props => [themeData];
}
