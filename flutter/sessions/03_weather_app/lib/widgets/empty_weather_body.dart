import 'package:flutter/material.dart';

class EmptyWeatherBody extends StatelessWidget {
  const EmptyWeatherBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'thear is no weather\nstart searching now',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}