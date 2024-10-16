import 'package:flutter/material.dart';

class countar with ChangeNotifier {
  int count = 0;
  int count2 = 1;
  int count3 = 1;
  int count4 = 1;

  void increment() {
    count++;
    notifyListeners();
  }

  void x2() {
    count2 = count2 * 2;
    notifyListeners();
  }

  void x3() {
    count3 = count3 * 3;
    notifyListeners();
  }

  void x4() {
    count4 = count4 * 4;
    notifyListeners();
  }

  void reset() {
    count = 0;
    count2 = 1;
    count3 = 1;
    count4 = 1;
    notifyListeners();
  }

  void decrement() {
    count--;
    count2--;
    count3--;
    count4--;
    notifyListeners();
  }
}
