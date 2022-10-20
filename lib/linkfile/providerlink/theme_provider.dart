import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themeprovider extends ChangeNotifier {
  String _theme = "system";
  String get theme => _theme;
  int group = 3;

  bool togg = true;

  ThemeMode getTheme() {
    switch (_theme) {
      case "light":
        return ThemeMode.light;
      case "dark":
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Themeprovider() {
    _loadFromPrefs();
  }

  _loadFromPrefs() async {
    final _pref = await SharedPreferences.getInstance();
    togg = _pref.getBool('togg') ?? true;
    group = _pref.getInt('group') ?? 3;
    _theme = _pref.getString('theme') ?? 'system';
    notifyListeners();
  }

  _saveToPrefs() async {
    final _pref = await SharedPreferences.getInstance();
    _pref.setBool('togg', togg);
    _pref.setInt('group', group);
    _pref.setString('theme', _theme);
  }

  changetheme(value1) {
    group = value1;
    togg = false;
    if (group == 1) {
      _theme = 'light';
    } else if (group == 2) {
      _theme = 'dark';
    }
    _saveToPrefs();
    notifyListeners();
  }

  changetogg(togg1) {
    togg = togg1;
    checktogg();

    notifyListeners();
  }

  checktogg() {
    if (togg == true) {
      _theme = 'system';
      group = 3;
    }
    _saveToPrefs();
    notifyListeners();
  }
}

class myTheme {
  static final darktheme = ThemeData(
      scaffoldBackgroundColor: Color.fromARGB(255, 54, 54, 54),
      primaryColor: Color.fromARGB(255, 42, 101, 135),
      primarySwatch: Colors.blue,
      primaryColorLight: Colors.black,
      primaryColorDark: Colors.white,
      colorScheme: ColorScheme.dark(
        onBackground: Color.fromARGB(255, 229, 229, 229),
        onTertiary: Color.fromARGB(255, 199, 199, 199),
        onInverseSurface: Color.fromARGB(255, 199, 199, 199),
        primaryContainer: Color.fromARGB(255, 28, 28, 28),
      ));
  static final lighttheme = ThemeData(
      scaffoldBackgroundColor: Color.fromARGB(255, 224, 224, 224),
      primaryColor: Color.fromARGB(255, 42, 101, 135),
      primarySwatch: Colors.blue,
      primaryColorLight: Colors.white,
      primaryColorDark: Colors.black,
      colorScheme: ColorScheme.light(
        onBackground: Color.fromARGB(255, 114, 114, 114),
        onInverseSurface: Color.fromARGB(255, 224, 224, 224),
        onTertiary: Color.fromARGB(255, 42, 101, 135),
        primaryContainer: Colors.white,
      ));
}
