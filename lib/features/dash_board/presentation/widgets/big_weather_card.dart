import 'package:demo_golden_owl/common/constant/color.dart';
import 'package:demo_golden_owl/features/dash_board/domain/entities/weather_entity.dart';
import 'package:demo_golden_owl/features/dash_board/presentation/manager/search_weather_state.dart';
import 'package:demo_golden_owl/features/dash_board/presentation/manager/search_weather_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BigWeatherCard extends StatelessWidget {
  final WeatherEntity weather;
  const BigWeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${weather.location} (${weather.date})",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 24),
              Text("Temperature: ${weather.temperature}"),
              SizedBox(height: 16),
              Text("Wind: ${weather.windSpeed}"),
              SizedBox(height: 16),
              Text("Humidity: ${weather.humidity}"),
            ],
          ),
          Column(children: [Image(image: NetworkImage(weather.iconUrl)), Text(weather.condition)]),
        ],
      ),
    );
  }


}
