import 'package:demo_golden_owl/features/dash_board/domain/entities/weather_entity.dart';
import 'package:demo_golden_owl/features/dash_board/presentation/manager/search_weather_state.dart';
import 'package:demo_golden_owl/features/dash_board/presentation/manager/search_weather_state_cubit.dart';
import 'package:demo_golden_owl/features/dash_board/presentation/widgets/big_weather_card.dart';
import 'package:demo_golden_owl/features/dash_board/presentation/widgets/small_weather_card.dart';
import 'package:demo_golden_owl/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SearchWeatherStateCubit, SearchWeatherState>(
      builder: (BuildContext context, SearchWeatherState state) {
        if (state is SearchWeatherLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is SearchWeatherFailureState) {
          return Center(child: Text(state.errorMsg));
        }
        if (state is SearchWeatherSuccessState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigWeatherCard( weather: state.weathers[0]),
              SizedBox(height: 16),
              _afterDayText(),
              SizedBox(height: 16),
              _listSmallWeatherCard(context,state.weathers),
            ],

          );
        }
        return Center(child: Text("you didn't search something"));
      },
    );

  }



  Widget _afterDayText() {
    return Text(
      '4-Day Forecast',
      style: TextStyle(color: Colors.black, fontSize: 20),
    );
  }

  Widget _listSmallWeatherCard(BuildContext context,List<WeatherEntity> weathers) {
    List<WeatherEntity> items=weathers;

    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isDesktop(context)
              ? 4
              : (Responsive.isTablet(context) ? 2 : 1),
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.8,
            mainAxisExtent: 215
        ),
        itemCount: 4,
        itemBuilder: (context, index) {

          return SmallWeatherCard(weather: items[index]);
        },

    );
  }


}
