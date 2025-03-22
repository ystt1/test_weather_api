import 'package:dartz/dartz.dart';
import 'package:demo_golden_owl/features/dash_board/data/data_sources/weather_api_service.dart';
import 'package:demo_golden_owl/features/dash_board/data/models/weather_forecast_model.dart';
import 'package:demo_golden_owl/features/dash_board/data/models/weather_model.dart';
import 'package:demo_golden_owl/features/dash_board/domain/entities/weather_entity.dart';
import 'package:demo_golden_owl/features/dash_board/domain/entities/weather_forecast_entity.dart';
import 'package:demo_golden_owl/features/dash_board/domain/repositories/weather_repository.dart';
import 'package:demo_golden_owl/service_locator.dart';

class WeatherRepositoryImp extends WeatherRepository {
  @override
  Future<Either> getWeather(String cityName) async {
    try {
      final returnedData = await sl<WeatherApiService>().getWeather(cityName);
      return returnedData.fold((error) => Left(error), (data) {
       WeatherForecastEntity response=(data as WeatherForecastModel).toEntity();
        return Right(response);
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
