import 'package:demo_golden_owl/common/constant/color.dart';
import 'package:flutter/material.dart';

class SmallWeatherCard extends StatelessWidget {
  const SmallWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
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
            Text("(2023-06-19)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 20,),
            Text("Image"),
            SizedBox(height: 12,),
            Text("Temp: 18.71"),
            SizedBox(height: 12,),
            Text("Wind: 4.31M/S"),
            SizedBox(height: 12,),
            Text("Humidity: 76%"),
          ],
        ),
      ),
    );
  }
}
