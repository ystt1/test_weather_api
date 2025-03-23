import 'dart:async';

import 'package:demo_golden_owl/common/constant/color.dart';
import 'package:demo_golden_owl/features/dash_board/domain/use_cases/get_weather_usecase.dart';
import 'package:demo_golden_owl/features/dash_board/presentation/manager/search_weather_state_cubit.dart';
import 'package:demo_golden_owl/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../common/helper/app_helper.dart';
import '../../domain/entities/weather_forecast_entity.dart';
import '../../domain/entities/weather_today_entity.dart';

class BigWeatherCard extends StatefulWidget {
  final WeatherForecastEntity weather;

  const BigWeatherCard({super.key, required this.weather});

  @override
  State<BigWeatherCard> createState() => _BigWeatherCardState();
}

class _BigWeatherCardState extends State<BigWeatherCard> {
  late DateTime now;

  @override
  void initState() {
    super.initState();
    now = AppHelper.getCurrentTime(widget.weather);
    _startTimer();
  }

  void _startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          now = AppHelper.getCurrentTime(widget.weather);
          if (AppHelper.isNewDay(widget.weather)) {
            context.read<SearchWeatherStateCubit>().onGetWeather(
              useCase: GetWeatherUseCase(),
              params: widget.weather.location,
            );
          }
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    WeatherTodayEntity? today = AppHelper.findClosestWeather(widget.weather);
    if (today == null) return SizedBox();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.primaryColor,
      ),
      child:
          Responsive.isMobile(context)
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildWeatherInfo(today),
                      _buildWeatherIcon(today),
                    ],
                  ),
                ],
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(),
                      SizedBox(height: 24),
                      _buildWeatherInfo(today),
                    ],
                  ),
                  _buildWeatherIcon(today),
                ],
              ),
    );
  }

  Widget _buildHeader() {
    return Text(
      "${widget.weather.location} (${DateFormat('yyyy-MM-dd HH:mm:ss').format(now)})",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }

  Widget _buildWeatherInfo(WeatherTodayEntity today) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Temperature: ${today.temperature}"),
        SizedBox(height: 16),
        Text("Wind: ${today.windSpeed}"),
        SizedBox(height: 16),
        Text("Humidity: ${today.humidity}"),
      ],
    );
  }

  Widget _buildWeatherIcon(WeatherTodayEntity today) {
    return Column(
      children: [
        Image(image: NetworkImage(today.iconUrl)),
        Text(today.condition),
      ],
    );
  }
}
