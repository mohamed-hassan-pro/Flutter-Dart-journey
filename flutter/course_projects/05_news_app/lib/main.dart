import 'package:_05_news_app/services/news_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'views/home_view.dart';

void main() {
  NewsService(Dio()).getNews("general");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
