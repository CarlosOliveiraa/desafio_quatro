import 'package:desafio_quatro/src/controller/weather_controller.dart';
import 'package:desafio_quatro/src/service/weather_service.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final controller = WeatherController(WeatherService());

  @override
  void initState() {
    controller.getWeather("Curitiba");
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: controller,
        builder: (_, child) {
          return SizedBox(
            width: 500,
            height: 500,
            child: ListView.builder(
              itemCount: controller.list.length,
              itemBuilder: (_, index) {
                final weather = controller.list[index];
                return Text(weather.day);
              },
            ),
          );
        },
      ),
    );
  }
}
