import 'package:flutter/material.dart';

class HeightSliderCard extends StatelessWidget {
  const HeightSliderCard({
    super.key,
    required this.height,
    required this.onHeightChanged,
  });

  final double height;
  final ValueChanged<double> onHeightChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff1d1e33),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'HEIGHT',
              style: TextStyle(color: Color(0xff6e6f81), fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  height.round().toString(),
                  style: const TextStyle(
                      fontSize: 48, fontWeight: FontWeight.w900, color: Colors.white),
                ),
                const Text('cm', style: TextStyle(color: Color(0xff6e6f81))),
              ],
            ),
            SliderTheme(
              data: SliderThemeData(
                thumbColor: const Color(0xffeb1555),
                inactiveTrackColor: const Color(0xff8e909d),
                activeTrackColor: Colors.white,
                overlayColor: const Color(0x29eb1555),
                trackHeight: 1,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
              ),
              child: Slider(
                min: 120,
                max: 220,
                value: height,
                onChanged: onHeightChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
