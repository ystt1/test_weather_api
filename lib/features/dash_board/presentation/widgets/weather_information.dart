import 'package:demo_golden_owl/features/dash_board/presentation/widgets/small_weather_card.dart';
import 'package:demo_golden_owl/features/dash_board/presentation/widgets/subscribe_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constant/color.dart';
import '../../../../responsive.dart';
import '../../domain/entities/weather_forecast_entity.dart';
import '../../domain/entities/weather_next_day_entity.dart';
import '../../domain/use_cases/get_weather_usecase.dart';
import '../manager/history_cubit.dart';
import '../manager/search_weather_state.dart';
import '../manager/search_weather_state_cubit.dart';
import '../manager/see_more_cubit.dart';
import 'big_weather_card.dart';

class WeatherInformation extends StatefulWidget {
  const WeatherInformation({super.key});

  @override
  State<WeatherInformation> createState() => _WeatherInformationState();
}

class _WeatherInformationState extends State<WeatherInformation> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchWeatherStateCubit, SearchWeatherState>(
      builder: (BuildContext context, SearchWeatherState state) {
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 200),
          child: _buildStateWidget(context, state),
        );
      },
    );
  }

  Widget _buildStateWidget(BuildContext context, SearchWeatherState state) {
    if (state is SearchWeatherLoadingState) {
      return Center(child: CircularProgressIndicator());
    }
    if (state is SearchWeatherFailureState) {
      return _errorMessage(state.errorMsg);
    }
    if (state is SearchWeatherSuccessState) {
      context.read<HistoryCubit>().addSearchResult(state.weathers);
      return _loadData(state.weathers, context);
    }
    if (state is SearchWeatherInitialState) {

      if(context.watch<HistoryCubit>().state == null)
        {

        }
      else if (context.watch<HistoryCubit>().state != null &&
          context.watch<HistoryCubit>().state!.isNotEmpty) {
        print("a");
        return _loadData(context.watch<HistoryCubit>().state![0], context);
      } else {
        print('b');
        context.read<SearchWeatherStateCubit>().onGetWeather(
          useCase: GetWeatherUseCase(),
          params: 'auto:ip',
        );
      }
    }
    return Center(child: Text("Something went wrong"));
  }

  Widget _errorMessage(String message) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      color: Colors.red,
      child: Center(
        child: Text(message, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _loadData(WeatherForecastEntity weather, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigWeatherCard(weather: weather),
        SizedBox(height: 16),
        _linkEmailText(),
        SubscribeEmail(location: weather.location),
        SizedBox(height: 16),
        _afterDayText(context),
        SizedBox(height: 16),
        _listSmallWeatherCard(context, weather.nextDays),
      ],
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
              visible: context.watch<SeeMoreCubit>().state > 4,
              child: TextButton(
                onPressed: () => context.read<SeeMoreCubit>().onCollapse(),
                child: Text(
                  "Collapse",
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 18),
                ),
              ),
            ),
            SizedBox(width: 20),
            Visibility(
              visible: context.watch<SeeMoreCubit>().state < 12,
              child: TextButton(
                onPressed: () => context.read<SeeMoreCubit>().onExpand(),
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
    return BlocBuilder<SeeMoreCubit, int>(
      builder: (BuildContext context, state) {
        return AnimatedSize(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: GridView.builder(
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
          ),
        );
      },
    );
  }
}
