import 'package:demo_golden_owl/features/dash_board/data/data_sources/subscribe_nodejs_service.dart';
import 'package:demo_golden_owl/features/dash_board/data/data_sources/weather_api_service.dart';
import 'package:demo_golden_owl/features/dash_board/data/repositories/subscribe_repository_imp.dart';
import 'package:demo_golden_owl/features/dash_board/data/repositories/weather_repository_imp.dart';
import 'package:demo_golden_owl/features/dash_board/domain/repositories/subscribe_repository.dart';
import 'package:demo_golden_owl/features/dash_board/domain/repositories/weather_repository.dart';
import 'package:demo_golden_owl/features/dash_board/domain/use_cases/get_weather_usecase.dart';
import 'package:demo_golden_owl/features/dash_board/domain/use_cases/sent_code_usecase.dart';
import 'package:demo_golden_owl/features/dash_board/domain/use_cases/subscribe_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //service
  sl.registerSingleton<WeatherApiService>(WeatherApiServiceImp());
  sl.registerSingleton<SubscribeNodejsService>(SubscribeNodejsServiceImp());
  //repository
  sl.registerSingleton<WeatherRepository>(WeatherRepositoryImp());
  sl.registerSingleton<SubscribeRepository>(SubscribeRepositoryImp());
  //usecase
  sl.registerSingleton<GetWeatherUseCase>(GetWeatherUseCase());
  sl.registerSingleton<SentCodeUseCase>(SentCodeUseCase());
  sl.registerSingleton<SubscribeUseCase>(SubscribeUseCase());
}