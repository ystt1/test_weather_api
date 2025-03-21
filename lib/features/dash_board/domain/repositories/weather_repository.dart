  import 'package:dartz/dartz.dart';

  abstract class WeatherRepository {
    Future<Either> getWeather(String cityName);
  }