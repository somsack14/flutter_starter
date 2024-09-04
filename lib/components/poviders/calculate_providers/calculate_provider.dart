import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculateProvider with ChangeNotifier {
  int a = 1;

  int get getA => a;

  void calculate() {
    a += a;
    notifyListeners();
  }
}

final stateCalculateProvider = ChangeNotifierProvider<CalculateProvider>((ref) {
  return CalculateProvider();
});
