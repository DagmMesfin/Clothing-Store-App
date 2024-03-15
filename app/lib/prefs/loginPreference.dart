import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class defaultt with ChangeNotifier {
  defaultt() {
    _loadingPrefs();
  }
  bool islogin = false;
  bool isUser = false;
  SharedPreferences? _prefs;
  _initializePrefs() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
    notifyListeners();
  }

  _loadingPrefs() async {
    await _initializePrefs();
    islogin = await _prefs?.getBool('loggedIn') ?? false;
    isUser = await _prefs?.getBool('isUser') ?? false;
    notifyListeners();
  }

  _savingPrefs() async {
    await _initializePrefs();
    _prefs!.setBool('loggedIn', islogin);
    _prefs!.setBool('isUser', isUser);

    notifyListeners();
  }

  void toggle() async {
    islogin = !islogin;

    _savingPrefs();
    notifyListeners();
  }

  void isUserLogin() async {
    isUser = !isUser;
    _savingPrefs();
    notifyListeners();
  }
}
