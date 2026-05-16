import 'package:http/http.dart' as http;
import '../models/weather_model.dart';
import 'dart:convert';

class WeatherService {
  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = "91e9aca15f4d45b5b6d154615260205";
  WeatherModel fetchWeather({required String cityName}) {
    WeatherModel model = WeatherModel(
      cityName: 'Cairo',
      date: DateTime.now(),
      image: 'https://cdn.weatherapi.com/weather/64x64/day/116.png',
      temp: 25,
      maxTemp: 30,
      minTemp: 20,
      weatherCondition: 'heavy cloud',
    );
    return model;
  }

  // تجهيز الرابط ➔ إرسال الطلب ➔ استلام الرد ➔ تحويل الـ JSON
  // Future<WeatherModel> fetchWeather({required String cityName}) async {
  //   String url = '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1';
  //   Uri uri = Uri.parse(url);
  //   http.Response response = await http.get(uri);
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> jsonData = jsonDecode(response.body);
  //     WeatherModel weather = WeatherModel.fromJson(jsonData);
  //     return weather;
  //   } else {
  //     throw Exception('فشل في جلب بيانات الطقس، تأكد من اسم المدينة');
  //   }
  // }
}
