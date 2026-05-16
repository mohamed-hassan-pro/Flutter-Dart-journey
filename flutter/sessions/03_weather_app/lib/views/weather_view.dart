import 'package:flutter/material.dart';

import '../models/weather_model.dart';
import '../widgets/empty_weather_body.dart';
import '../widgets/weather_body.dart';
import 'search_view.dart';

class WeatherView extends StatefulWidget {
  WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SearchView(),
                  ),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: weatherModel == null
          ? EmptyWeatherBody()
          : WeatherBody(weatherModel: weatherModel!),
    );
  }
}
