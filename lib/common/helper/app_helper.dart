import 'package:demo_golden_owl/features/dash_board/domain/entities/weather_forecast_entity.dart';
import 'package:demo_golden_owl/features/dash_board/domain/entities/weather_today_entity.dart';
import 'package:intl/intl.dart';

class AppHelper {
  static DateTime getCurrentTime(WeatherForecastEntity forecast) {
    Duration gmtOffsetDuration = Duration(
      minutes: forecast.gmtOffset.inMinutes,
    );
    DateTime now = DateTime.now().toUtc().add(gmtOffsetDuration);
    return now;
  }

  static WeatherTodayEntity? findClosestWeather(
    WeatherForecastEntity forecast,
  ) {
    try {
      DateTime now = getCurrentTime(forecast);

      WeatherTodayEntity? closestWeather;
      Duration minDifference = Duration(days: 1);

      for (var weather in forecast.today) {
        DateTime weatherTime =
            DateFormat("yyyy-MM-dd HH:mm").parse(weather.time, true).toLocal();
        Duration difference = weatherTime.difference(now);

        if (difference.abs() < minDifference) {
          minDifference = difference.abs();
          closestWeather = weather;
        }
      }

      return closestWeather;
    } catch (e) {
      return null;
    }
  }
}
