import 'package:flutter/material.dart';

class WeightAgeSection extends StatelessWidget {
  const WeightAgeSection({
    super.key,
    required this.weight,
    required this.age,
    required this.onWeightChanged,
    required this.onAgeChanged,
  });

  final int weight;
  final int age;
  final ValueChanged<int> onWeightChanged;
  final ValueChanged<int> onAgeChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CounterCard(
          label: 'WEIGHT',
          value: weight,
          onChanged: onWeightChanged,
        ),
        const SizedBox(width: 32),
        CounterCard(
          label: 'AGE',
          value: age,
          onChanged: onAgeChanged,
        ),
      ],
    );
  }
}

class CounterCard extends StatelessWidget {
  const CounterCard({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff1d1e33),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: const TextStyle(color: Color(0xff6e6f81), fontSize: 16),
              ),
              Text(
                value.toString(),
                style: const TextStyle(
                    fontSize: 48, fontWeight: FontWeight.w900, color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundIconButton(
                    icon: Icons.remove,
                    onPressed: () => onChanged(value - 1),
                  ),
                  const SizedBox(width: 10),
                  RoundIconButton(
                    icon: Icons.add,
                    onPressed: () => onChanged(value + 1),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      onPressed: onPressed,
      constraints: const BoxConstraints.tightFor(width: 48, height: 48),
      shape: const CircleBorder(),
      fillColor: const Color(0xff4c4f5e),
      child: Icon(icon, color: Colors.white),
    );
  }
}
