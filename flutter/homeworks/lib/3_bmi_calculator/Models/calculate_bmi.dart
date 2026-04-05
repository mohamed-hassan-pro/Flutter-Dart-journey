import 'dart:math';

class Calculator {
  Calculator({required this.height, required this.weight});
  final double height;
  final double weight;
  double calcBMI() => weight / pow(height / 100, 2);
}
