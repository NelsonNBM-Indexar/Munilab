import 'package:flutter/material.dart';

enum AppState { welcome, login, register, pending, dashboard }

class AppStateProvider with ChangeNotifier {
  AppState _currentState = AppState.welcome;
  AppState get currentState => _currentState;

  void goTo(AppState state) {
    _currentState = state;
    notifyListeners();
  }
}
