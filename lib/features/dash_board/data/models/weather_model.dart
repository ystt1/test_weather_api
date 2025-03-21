import 'package:demo_golden_owl/features/dash_board/domain/entities/weather_entity.dart';

class WeatherModel {
  final String location;
  final String country;
  final double temperature;
  final String condition;
  final String iconUrl;
  final double windSpeed;
  final int humidity;
  final String date;

  WeatherModel({
    required this.location,
    required this.country,
    required this.temperature,
    required this.condition,
    required this.iconUrl,
    required this.windSpeed,
    required this.humidity,
    required this.date,
  });

  factory WeatherModel.fromJson(
    Map<String, dynamic> json,
    Map<String, dynamic> forecastDay,
  ) {
    return WeatherModel(
      location: json["location"]["name"],
      country: json["location"]["country"],
      temperature: forecastDay["day"]["avgtemp_c"].toDouble(),
      condition: forecastDay["day"]["condition"]["text"],
      iconUrl: "https:${forecastDay["day"]["condition"]["icon"]}",
      windSpeed: forecastDay["day"]["maxwind_kph"].toDouble(),
      humidity: forecastDay["day"]["avghumidity"],
      date: forecastDay["date"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "location": location,
      "country": country,
      "temperature": temperature,
      "condition": condition,
      "iconUrl": iconUrl,
      "windSpeed": windSpeed,
      "humidity": humidity,
      "date": date,
    };
  }

  static List<WeatherModel> fromJsonList(Map<String, dynamic> json) {
    List<dynamic> forecastDays = json["forecast"]["forecastday"];
    return forecastDays.map((day) => WeatherModel.fromJson(json, day)).toList();
  }
}

extension WeatherModelToEntity on WeatherModel {
  WeatherEntity toEntity() {
    return WeatherEntity(
      location: location,
      country: country,
      temperature: temperature,
      condition: condition,
      iconUrl: iconUrl,
      windSpeed: windSpeed,
      humidity: humidity,
      date: date,
    );
  }
}
