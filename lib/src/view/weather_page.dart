import 'package:desafio_quatro/src/components/custom_textformfield.dart';
import 'package:desafio_quatro/src/controller/weather_controller.dart';
import 'package:desafio_quatro/src/service/weather_service.dart';
import 'package:flutter/material.dart';

import '../components/weather_card.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final controller = WeatherController(WeatherService());

  @override
  void initState() {
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormField(
                controller: controller.weatherController,
                onTap: () async {
                  controller.getWeather(controller.weatherController.text);
                },
              ),
              AnimatedBuilder(
                animation: controller,
                builder: (_, child) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: controller.list.length,
                    itemBuilder: (_, index) {
                      final weather = controller.list[index];
                      return Container(
                        padding: const EdgeInsets.all(10),
                        child: WeatherCard(
                          day: weather.day,
                          temperature: weather.temperature,
                          wind: weather.wind,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // body: AnimatedBuilder(
      //   animation: controller,
      //   builder: (_, child) {
      //     return SizedBox(
      //       width: 500,
      //       height: 500,
      //       child: ListView.builder(
      //         itemCount: controller.list.length,
      //         itemBuilder: (_, index) {
      //           final weather = controller.list[index];
      //           return Text(weather.day);
      //         },
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
