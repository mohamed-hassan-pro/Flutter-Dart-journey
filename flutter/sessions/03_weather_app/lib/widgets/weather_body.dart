import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            'update at:${weatherModel.formattedTime}',
            style: TextStyle(fontSize: 24),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(weatherModel.image, width: 100, height: 100),
              Text(
                "${weatherModel.temp}",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Text(
                    'maxTemp: ${weatherModel.maxTemp}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'minTemp: ${weatherModel.minTemp}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          Text(
            weatherModel.weatherCondition,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
