import 'package:dartz/dartz.dart';
import 'package:demo_golden_owl/core/usecase.dart';
import 'package:demo_golden_owl/features/dash_board/domain/entities/weather_forecast_entity.dart';
import 'package:demo_golden_owl/features/dash_board/presentation/manager/search_weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchWeatherStateCubit extends Cubit<SearchWeatherState> {
  SearchWeatherStateCubit() : super(SearchWeatherInitialState());

  Future<void> onGetWeather({dynamic params, required UseCase useCase}) async {
    try {
      emit(SearchWeatherLoadingState());
      Either returnedData = await useCase.call(params: params);
      returnedData.fold((error) {
        emit(SearchWeatherFailureState(errorMsg: error));
      }, (data) => emit(SearchWeatherSuccessState(weathers: data)));
    } catch (e) {
      emit(SearchWeatherFailureState(errorMsg: e.toString()));
    }
  }

  Future<void> onGetFromHistory(WeatherForecastEntity weather) async {
    emit(SearchWeatherSuccessState(weathers: weather));
  }
}
