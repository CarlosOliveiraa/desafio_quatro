import 'package:desafio_quatro/src/model/weather_model.dart';
import 'package:desafio_quatro/src/service/weather_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() async {
  final client = DioMock();
  final service = WeatherService();
  final weahter = await service.getWeather("Curitiba");
  print(weahter[0].day);
  print(weahter[0].temperature);
  print(weahter[0].wind);

  test('retorna algo', () async {
    when(() => client.get(any())).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: ""), statusCode: 200, data: json));
        final response = await service.getWeather("Curitiba");
        expect(response, isA<List<WeatherModel>>());
  });
}

var json =
    '''
{"temperature":"+22 °C","wind":"19 km/h","description":"Partly cloudy","forecast":[{"day":"1","temperature":"27 °C","wind":"8 km/h"},{"day":"2","temperature":"21 °C","wind":"13 km/h"},{"day":"3","temperature":"20 °C","wind":"6 km/h"}]}
''';
