import 'package:flutter/material.dart';

const Color _customColor = Color(0xff49149f);

const List<Color> _colorTheme = [
  _customColor,
  Colors.blue,
  Colors.yellow,
  Colors.red,
  Colors.pink,
  Colors.teal,
  Colors.black12,
  Colors.orange,
];

class AppTheme {
  final int selectdColor;

  AppTheme({this.selectdColor = 0})
      : assert(selectdColor >= 0 && selectdColor <= _colorTheme.length - 1,
            'Color entre 0 y ${_colorTheme.length}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorTheme[selectdColor]);
  }
}
