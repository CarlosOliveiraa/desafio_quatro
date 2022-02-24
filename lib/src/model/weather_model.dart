class WeatherModel {
  final String day;
  final String temperature;
  final String wind;

  WeatherModel(
      {required this.day, required this.temperature, required this.wind});

  static WeatherModel fromJson(Map map) {
    return WeatherModel(
      day: map['day'],
      temperature: map['temperature'],
      wind: map['wind'],
    );
  }

  static WeatherModel stub() =>
      WeatherModel(day: "day", temperature: "temperature", wind: "wind");
}
