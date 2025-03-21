import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:demo_golden_owl/core/constants/url.dart';
import 'package:demo_golden_owl/features/dash_board/data/models/weather_model.dart';
import 'package:http/http.dart' as http;
abstract class WeatherApiService {
  Future<Either> getWeather(String cityName);
}

class WeatherApiServiceImp extends WeatherApiService {
  @override
  Future<Either> getWeather(String cityName) async {
    try {
      final uri = Uri.parse('$baseUrl/forecast.json?q=$cityName&days=5&tp=24&key=fb9abbeb84ed42a5b31104645252103');
      final response = await http.get(uri);
      final data=json.decode(response.body);
      if(response.statusCode==200)
      {
        List<WeatherModel> weatherList = WeatherModel.fromJsonList(data);
        return Right(weatherList);
      }
      print(data);
      return Left(data['error']['message']);
    } catch (e) {
      return Left(e.toString());
    }
  }

}