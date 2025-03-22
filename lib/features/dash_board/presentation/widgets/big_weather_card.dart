import 'package:demo_golden_owl/common/constant/color.dart';
import 'package:demo_golden_owl/common/helper/app_helper.dart';
import 'package:demo_golden_owl/features/dash_board/domain/entities/weather_forecast_entity.dart';
import 'package:demo_golden_owl/features/dash_board/domain/entities/weather_today_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BigWeatherCard extends StatelessWidget {
  final WeatherForecastEntity weather;
  const BigWeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    WeatherTodayEntity? today=AppHelper.findClosestWeather(weather);
    DateTime now=AppHelper.getCurrentTime(weather);
    return today==null?SizedBox(): Container(
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
                "${weather.location} (${DateFormat('yyyy-MM-dd HH:mm').format(now)})",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 24),
              Text("Temperature: ${today.temperature}"),
              SizedBox(height: 16),
              Text("Wind: ${today.windSpeed}"),
              SizedBox(height: 16),
              Text("Humidity: ${today.humidity}"),
            ],
          ),
          Column(children: [Image(image: NetworkImage(today.iconUrl)), Text(today.condition)]),
        ],
      ),
    );
  }


}
