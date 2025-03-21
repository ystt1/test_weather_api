import 'package:demo_golden_owl/common/constant/color.dart';
import 'package:flutter/material.dart';

class BigWeatherCard extends StatelessWidget {
  const BigWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),color: AppColors.primaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("London (2023-06-19)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              SizedBox(height: 24,),
              Text("Temperature: 18.71"),
              SizedBox(height: 16,),
              Text("Wind: 4.31M/S"),
              SizedBox(height: 16,),
              Text("Humidity: 76%"),

            ],
          ),
          Column(
            children: [
              Text("image"),
              Text('Moderate rain')
            ],
          )
        ],
      ),
    );
  }
}
