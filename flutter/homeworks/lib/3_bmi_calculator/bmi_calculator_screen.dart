import 'package:flutter/material.dart';
import 'package:homeworks/3_bmi_calculator/Models/bmi_manager.dart';
import 'package:homeworks/3_bmi_calculator/result_screen.dart';
import 'package:homeworks/3_bmi_calculator/widgets/calculate_bmi_button.dart';
import 'package:homeworks/3_bmi_calculator/widgets/gender_section.dart';
import 'package:homeworks/3_bmi_calculator/widgets/heigh_slider_card.dart';
import 'package:homeworks/3_bmi_calculator/widgets/weight_age_section.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  // We hold the manager here so it stays alive as long as the screen is open
  final BmiManager bmiManager = BmiManager();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff03051a),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
          backgroundColor: const Color(0xff04061d),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Expanded(
                  child: ListenableBuilder(
                    listenable: bmiManager,
                    builder: (context, child) => GenderSection(
                      selectedGender: bmiManager.selectedGender,
                      onGenderChanged: bmiManager.updateGender,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: ListenableBuilder(
                    listenable: bmiManager,
                    builder: (context, child) => HeightSliderCard(
                      height: bmiManager.height,
                      onHeightChanged: bmiManager.updateHeight,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: ListenableBuilder(
                    listenable: bmiManager,
                    builder: (context, child) => WeightAgeSection(
                      weight: bmiManager.weight,
                      age: bmiManager.age,
                      onWeightChanged: bmiManager.updateWeight,
                      onAgeChanged: bmiManager.updateAge,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                CalculateBMIButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(bmiResult: bmiManager.calculateBMI()),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
