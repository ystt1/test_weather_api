import 'package:demo_golden_owl/features/dash_board/domain/entities/weather_today_entity.dart';

class WeatherTodayModel {
  final String time; // "2025-03-22 00:00"
  final double temperature;
  final String condition;
  final String iconUrl;
  final double windSpeed;
  final int humidity;

  WeatherTodayModel({
    required this.time,
    required this.temperature,
    required this.condition,
    required this.iconUrl,
    required this.windSpeed,
    required this.humidity,
  });

  factory WeatherTodayModel.fromJson(Map<String, dynamic> json) {
    return WeatherTodayModel(
      time: json["time"],
      temperature: json["temp_c"].toDouble(),
      condition: json["condition"]["text"],
      iconUrl: json["condition"]["icon"],
      windSpeed: json["wind_kph"].toDouble(),
      humidity: json["humidity"],
    );
  }
}

extension WeatherTodayModelToEntity on WeatherTodayModel {
  WeatherTodayEntity toEntity() {
    return WeatherTodayEntity(
      time: time,
      temperature: temperature,
      condition: condition,
      iconUrl: iconUrl,
      windSpeed: windSpeed,
      humidity: humidity,
    );
  }
}
