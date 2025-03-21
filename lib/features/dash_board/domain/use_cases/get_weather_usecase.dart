import 'package:dartz/dartz.dart';
import 'package:demo_golden_owl/core/usecase.dart';
import 'package:demo_golden_owl/features/dash_board/domain/repositories/weather_repository.dart';
import 'package:demo_golden_owl/service_locator.dart';

class GetWeatherUseCase implements UseCase<Either,String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<WeatherRepository>().getWeather(params!);
  }

}