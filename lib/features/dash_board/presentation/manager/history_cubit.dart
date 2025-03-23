import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:demo_golden_owl/features/dash_board/domain/entities/weather_forecast_entity.dart';

class HistoryCubit extends Cubit<List<WeatherForecastEntity>?> {
  HistoryCubit() : super(null){
    loadHistory();
  }



  Future<void> loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final historyJson = prefs.getString('search_history') ?? '[]';
    final List<dynamic> historyList = jsonDecode(historyJson);
    List<WeatherForecastEntity> history =
        historyList
            .map((json) => WeatherForecastEntity.fromJson(json))
            .toList();
    emit(history);
  }

  Future<void> addSearchResult(WeatherForecastEntity weather) async {
    final prefs = await SharedPreferences.getInstance();
    List<WeatherForecastEntity> history = List.from(state!);
    history.removeWhere((item) => item.location == weather.location);
    history.insert(0, weather);
    if (history.length > 10) {
      history = history.sublist(0, 10);
    }
    await prefs.setString(
      'search_history',
      jsonEncode(history.map((e) => e.toJson()).toList()),
    );

    emit(history);
  }

  Future<void> removeSearchResult(WeatherForecastEntity weather) async {
    final prefs = await SharedPreferences.getInstance();
    List<WeatherForecastEntity> history = List.from(state!);

    history.removeWhere((item) => item.location == weather.location);

    await prefs.setString(
      'search_history',
      jsonEncode(history.map((e) => e.toJson()).toList()),
    );

    emit(history);
  }
}
