import 'package:flutter/material.dart';

import '../models/tune_model.dart';

class ExpandedTuneItem extends StatelessWidget {
  const ExpandedTuneItem({super.key, required this.tune});
  final TuneModel tune;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          tune.playSound();
        },
        child: ColoredBox(color: tune.color),
      ),
    );
  }
}
