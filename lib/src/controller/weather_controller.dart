import 'package:desafio_quatro/src/service/weather_service.dart';
import 'package:flutter/cupertino.dart';

import '../model/weather_model.dart';

class WeatherController extends ChangeNotifier {
  final WeatherService service;
  final weatherController = TextEditingController();

  WeatherController(this.service);

  List<WeatherModel> list = [];

  Future<void> getWeather(String city) async {
    final response = await service.getWeather(city);

    list = response;

    notifyListeners();
  }
}
