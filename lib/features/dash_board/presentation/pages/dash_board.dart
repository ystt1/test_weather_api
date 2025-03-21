import 'package:demo_golden_owl/features/dash_board/presentation/manager/search_weather_state_cubit.dart';
import 'package:demo_golden_owl/features/dash_board/presentation/widgets/input_information.dart';
import 'package:demo_golden_owl/features/dash_board/presentation/widgets/weather_information.dart';
import 'package:demo_golden_owl/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Weather Dashboard",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: BlocProvider(
        create: (BuildContext context) => SearchWeatherStateCubit(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          child:
              Responsive.isDesktop(context)
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(flex: 1, child: InputInformation()),
                      SizedBox(width: 32),
                      Expanded(flex: 2, child: WeatherInformation()),
                    ],
                  )
                  : SingleChildScrollView(
                    child: Column(
                      children: [
                        InputInformation(),
                        const SizedBox(height: 16),
                        WeatherInformation(),
                      ],
                    ),
                  ),
        ),
      ),
    );
  }
}
