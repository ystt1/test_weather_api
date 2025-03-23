import 'package:demo_golden_owl/common/constant/color.dart';
import 'package:demo_golden_owl/features/dash_board/data/models/weather_next_day_model.dart';
import 'package:demo_golden_owl/features/dash_board/domain/entities/weather_entity.dart';
import 'package:demo_golden_owl/features/dash_board/domain/entities/weather_next_day_entity.dart';
import 'package:flutter/material.dart';

class SmallWeatherCard extends StatelessWidget {
  final WeatherNextDayEntity weather;
  const SmallWeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(4)
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("(${weather.date})",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            SizedBox(height: 12,),
            Image(image: NetworkImage(weather.iconUrl)),
            SizedBox(height: 6,),
            Text("Temp: ${weather.temp}"),
            SizedBox(height: 12,),
            Text("Wind: ${weather.windSpeed}"),
            SizedBox(height: 12,),
            Text("Humidity: ${weather.humidity}"),
          ],
        ),
      ),
    );
  }
}
