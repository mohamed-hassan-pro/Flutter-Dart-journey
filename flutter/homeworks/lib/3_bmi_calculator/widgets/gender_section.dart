import 'package:flutter/material.dart';

enum Gender { male, female, none }

class GenderSection extends StatelessWidget {
  const GenderSection({
    super.key,
    required this.selectedGender,
    required this.onGenderChanged,
  });

  final Gender selectedGender;
  final ValueChanged<Gender> onGenderChanged;

  final Color _selectedColor = const Color(0xff17172f);
  final Color _unSelectedColor = const Color(0xff090b24);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GenderSelectionCard(
            color: selectedGender == Gender.male ? _selectedColor : _unSelectedColor,
            icon: Icons.male,
            data: 'MALE',
            onTap: () => onGenderChanged(Gender.male),
          ),
        ),
        const SizedBox(width: 32),
        Expanded(
          child: GenderSelectionCard(
            color: selectedGender == Gender.female ? _selectedColor : _unSelectedColor,
            icon: Icons.female,
            data: 'FEMALE',
            onTap: () => onGenderChanged(Gender.female),
          ),
        ),
      ],
    );
  }
}

class GenderSelectionCard extends StatelessWidget {
  const GenderSelectionCard({
    super.key,
    required this.icon,
    required this.data,
    this.onTap,
    required this.color,
  });
  final IconData icon;
  final String data;
  final void Function()? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 80, color: Colors.white),
              Text(
                data,
                style: const TextStyle(color: Color(0xff6e6f81), fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
