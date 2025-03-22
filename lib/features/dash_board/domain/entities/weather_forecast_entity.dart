
import 'package:demo_golden_owl/features/dash_board/domain/entities/weather_next_day_entity.dart';
import 'package:demo_golden_owl/features/dash_board/domain/entities/weather_today_entity.dart';

class WeatherForecastEntity {
  final String location;
  final Duration gmtOffset;
  final List<WeatherTodayEntity> today;
  final List<WeatherNextDayEntity> nextDays;

  WeatherForecastEntity({required this.today, required this.nextDays,required this.location,required this.gmtOffset});


  Map<String, dynamic> toJson() {
    return {
      'location': location,
      'gmtOffset': gmtOffset.inSeconds, // Lưu offset theo giây
      'today': today.map((e) => e.toJson()).toList(),
      'nextDays': nextDays.map((e) => e.toJson()).toList(),
    };
  }


  factory WeatherForecastEntity.fromJson(Map<String, dynamic> json) {
    return WeatherForecastEntity(
      location: json['location'],
      gmtOffset: Duration(seconds: json['gmtOffset']),
      today: (json['today'] as List)
          .map((e) => WeatherTodayEntity.fromJson(e))
          .toList(),
      nextDays: (json['nextDays'] as List)
          .map((e) => WeatherNextDayEntity.fromJson(e))
          .toList(),
    );
  }
}