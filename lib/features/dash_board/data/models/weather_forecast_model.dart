import 'package:demo_golden_owl/features/dash_board/data/models/weather_next_day_model.dart';
import 'package:demo_golden_owl/features/dash_board/data/models/weather_today_model.dart';
import 'package:demo_golden_owl/features/dash_board/domain/entities/weather_forecast_entity.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/standalone.dart' as tz;

class WeatherForecastModel {
  final String location;
  final Duration gmtOffset;
  final List<WeatherTodayModel> today;
  final List<WeatherNextDayModel> nextDays;

  WeatherForecastModel({
    required this.today,
    required this.nextDays,
    required this.location,
    required this.gmtOffset
  });

  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) {
    tz.initializeTimeZones();
    List<dynamic> forecastDays = json["forecast"]["forecastday"];
    String location = json['location']['name'];
    String tzId=json['location']['tz_id'];
    final now = tz.TZDateTime.now(tz.getLocation(tzId));
    Duration gmtOffset = now.timeZoneOffset;


    List<WeatherTodayModel> today =
        (forecastDays[0]["hour"] as List)
            .map((hour) => WeatherTodayModel.fromJson(hour))
            .toList();

    List<WeatherNextDayModel> nextDays =
        forecastDays.map((day) => WeatherNextDayModel.fromJson(day)).toList();

    return WeatherForecastModel(
      gmtOffset: gmtOffset,
      today: today,
      nextDays: nextDays,
      location: location,
    );
  }
}

extension WeatherForecastModelToEntity on WeatherForecastModel {
  WeatherForecastEntity toEntity() {
    return WeatherForecastEntity(
      today: today.map((e) => e.toEntity()).toList(),
      nextDays: nextDays.map((e) => e.toEntity()).toList(),
      location: location, gmtOffset: gmtOffset,
    );
  }
}
