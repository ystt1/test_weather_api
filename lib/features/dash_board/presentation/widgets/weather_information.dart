import 'package:demo_golden_owl/features/dash_board/presentation/widgets/big_weather_card.dart';
import 'package:demo_golden_owl/features/dash_board/presentation/widgets/small_weather_card.dart';
import 'package:demo_golden_owl/responsive.dart';
import 'package:flutter/material.dart';

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigWeatherCard(),
          SizedBox(height: 16),
          _afterDayText(),
          SizedBox(height: 16),
          _listSmallWeatherCard(context),
        ],

    );
  }

  Widget _afterDayText() {
    return Text(
      '4-Day Forecast',
      style: TextStyle(color: Colors.black, fontSize: 20),
    );
  }

  Widget _listSmallWeatherCard(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 200,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isDesktop(context)
              ? 4
              : (Responsive.isTablet(context) ? 2 : 1),
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.8,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return SmallWeatherCard();
        },
      ),
    );
  }


}
