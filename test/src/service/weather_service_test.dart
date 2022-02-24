import 'package:desafio_quatro/src/service/weather_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final service = WeatherService();
  final weahter = await service.getWeather("Curitiba");
  print(weahter[0].day);
  print(weahter[0].temperature);
  print(weahter[0].wind);
}
