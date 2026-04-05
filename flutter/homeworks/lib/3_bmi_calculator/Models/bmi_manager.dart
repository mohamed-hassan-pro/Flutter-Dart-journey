import 'package:flutter/material.dart';
import 'package:homeworks/3_bmi_calculator/widgets/gender_section.dart';
import 'dart:math';

class BmiManager extends ChangeNotifier {
  Gender selectedGender = Gender.none;
  double height = 170;
  int weight = 60;
  int age = 20;

  void updateGender(Gender newGender) {
    if (selectedGender != newGender) {
      selectedGender = newGender;
      notifyListeners();
    }
  }

  void updateHeight(double newHeight) {
    if (height != newHeight) {
      height = newHeight;
      notifyListeners();
    }
  }

  void updateWeight(int newWeight) {
    weight = newWeight;
    notifyListeners();
  }

  void updateAge(int newAge) {
    age = newAge;
    notifyListeners();
  }

  double calculateBMI() {
    return weight / pow(height / 100, 2);
  }
}
