import 'package:demo_golden_owl/features/dash_board/domain/entities/weather_entity.dart';
import 'package:demo_golden_owl/features/dash_board/domain/entities/weather_forecast_entity.dart';

abstract class SearchWeatherState{}

class SearchWeatherInitialState extends SearchWeatherState{}

class SearchWeatherLoadingState extends SearchWeatherState{}

class SearchWeatherSuccessState extends SearchWeatherState{
  final WeatherForecastEntity weathers;

  SearchWeatherSuccessState({required this.weathers});
}

class SearchWeatherFailureState extends SearchWeatherState{
  final String errorMsg;

  SearchWeatherFailureState({required this.errorMsg});
}