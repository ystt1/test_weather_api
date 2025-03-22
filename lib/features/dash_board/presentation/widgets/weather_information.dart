import 'package:demo_golden_owl/common/constant/color.dart';
import 'package:demo_golden_owl/features/dash_board/domain/entities/weather_entity.dart';
import 'package:demo_golden_owl/features/dash_board/domain/entities/weather_next_day_entity.dart';
import 'package:demo_golden_owl/features/dash_board/presentation/manager/history_cubit.dart';
import 'package:demo_golden_owl/features/dash_board/presentation/manager/search_weather_state.dart';
import 'package:demo_golden_owl/features/dash_board/presentation/manager/search_weather_state_cubit.dart';
import 'package:demo_golden_owl/features/dash_board/presentation/manager/see_more_cubit.dart';
import 'package:demo_golden_owl/features/dash_board/presentation/widgets/big_weather_card.dart';
import 'package:demo_golden_owl/features/dash_board/presentation/widgets/small_weather_card.dart';
import 'package:demo_golden_owl/features/dash_board/presentation/widgets/subscribe_email.dart';
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
          context.read<HistoryCubit>().addSearchResult(state.weathers);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigWeatherCard(weather: state.weathers),
              SizedBox(height: 16),
              _linkEmailText(),
              SubscribeEmail(),
              SizedBox(height: 16),
              _afterDayText(context),
              SizedBox(height: 16),
              _listSmallWeatherCard(context, state.weathers.nextDays),
            ],
          );
        }
        return Center(child: Text("you didn't search something"));
      },
    );
  }

  Widget _afterDayText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'NextDay Forecast',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        Row(
          children: [
            Visibility(
              visible: context.watch<SeeMoreCubit>().state>4,
              child: GestureDetector(
                onTap: ()=>context.read<SeeMoreCubit>().onCollapse(),
                child: Text(
                  "Collapse",
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 18),
                ),
              ),
            ),
            SizedBox(width: 20,),
            Visibility(
              visible: context.watch<SeeMoreCubit>().state<12,
              child: GestureDetector(
                onTap: ()=>context.read<SeeMoreCubit>().onExpand(),
                child: Text(
                  'See more',
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _linkEmailText() {
    return Text(
      'Get daily weather of this city via email',
      style: TextStyle(color: Colors.black, fontSize: 18),
    );
  }

  Widget _listSmallWeatherCard(
    BuildContext context,
    List<WeatherNextDayEntity> weathers,
  ) {
    List<WeatherNextDayEntity> items = weathers.sublist(1);
    return BlocBuilder<SeeMoreCubit,int>(
      builder: (BuildContext context, state) {

        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.8,
            mainAxisExtent: 220,
          ),
          itemCount: state,
          itemBuilder: (context, index) {
            return SmallWeatherCard(weather: items[index]);
          },
        );
      },
    );
  }
}
