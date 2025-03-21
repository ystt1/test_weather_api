import 'package:demo_golden_owl/features/dash_board/data/data_sources/weather_api_service.dart';
import 'package:demo_golden_owl/features/dash_board/data/repositories/weather_repository_imp.dart';
import 'package:demo_golden_owl/features/dash_board/domain/repositories/weather_repository.dart';
import 'package:demo_golden_owl/features/dash_board/domain/use_cases/get_weather_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //service
  sl.registerSingleton<WeatherApiService>(WeatherApiServiceImp());

  //repository
  sl.registerSingleton<WeatherRepository>(WeatherRepositoryImp());
  
  //usecase
  sl.registerSingleton<GetWeatherUseCase>(GetWeatherUseCase());
}