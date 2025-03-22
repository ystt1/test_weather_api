import 'package:demo_golden_owl/features/dash_board/domain/entities/weather_next_day_entity.dart';

class WeatherNextDayModel {
  final String date;
  final double temp;
  final String condition;
  final String iconUrl;
  final double windSpeed;
  final int humidity;

  WeatherNextDayModel({
    required this.date,
    required this.temp,
    required this.condition,
    required this.iconUrl,
    required this.windSpeed,
    required this.humidity,
  });

  factory WeatherNextDayModel.fromJson(Map<String, dynamic> json) {
    return WeatherNextDayModel(
      date: json["date"],
      temp: json["day"]["avgtemp_c"].toDouble(),
      condition: json["day"]["condition"]["text"],
      iconUrl: json["day"]["condition"]["icon"],
      windSpeed: json["day"]["maxwind_kph"].toDouble(),
      humidity: json["day"]["avghumidity"],
    );
  }
}

extension WeatherNextDayModelToEntity on WeatherNextDayModel {
  WeatherNextDayEntity toEntity() {
    return WeatherNextDayEntity(
      date: date,
      temp: temp,
      condition: condition,
      iconUrl: iconUrl,
      windSpeed: windSpeed,
      humidity: humidity,
    );
  }
}
