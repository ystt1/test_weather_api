import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:demo_golden_owl/core/constants/key.dart';
import 'package:demo_golden_owl/core/constants/url.dart';
import 'package:demo_golden_owl/features/dash_board/data/models/weather_forecast_model.dart';
import 'package:demo_golden_owl/features/dash_board/data/models/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherApiService {
  Future<Either> getWeather(String cityName);
}

class WeatherApiServiceImp extends WeatherApiService {
  @override
  Future<Either> getWeather(String cityName) async {
    try {
      String params = cityName;
      if (cityName == 'auto:ip') {
        Either eitherReturned =
            await getMyLocation(); //weather-api sometime get wrong location
        eitherReturned.fold((error) => print(error), (data) => params = data);
      }
      final uri = Uri.parse(
        '$baseUrl/forecast.json?q=$params&days=13&key=$apiKey',
      );
      final response = await http.get(uri);
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        WeatherForecastModel weatherList = WeatherForecastModel.fromJson(data);

        return Right(weatherList);
      }

      return Left(data['error']['message']);
    } catch (e) {
      print(e.toString());
      return Left(e.toString());
    }
  }

  Future<Either> getMyLocation() //weather-api sometime get wrong location
  async {
    try {
      final uri = Uri.parse('http://ip-api.com/json/');
      final response = await http.get(uri);
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        return Right(data['city']);
      }

      return Left(data['error']['message'] ?? 'Can\'t found your address');
    } catch (e) {
      return Left(e.toString());
    }
  }
}
