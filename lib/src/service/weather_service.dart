import 'package:dio/dio.dart';

import '../model/weather_model.dart';

class WeatherService {
  final dio = Dio();

  Future<List<WeatherModel>> getWeather(String city) async {
    final response =
        await dio.get("https://goweather.herokuapp.com/weather/$city");
    var list = response.data['forecast'];
    final weather = List<WeatherModel>.from(list.map(
      (e) => WeatherModel.fromJson(e),
    )).toList();
    return weather;
  }
}
