import 'package:demo_golden_owl/common/constant/color.dart';
import 'package:demo_golden_owl/features/dash_board/domain/use_cases/get_weather_usecase.dart';
import 'package:demo_golden_owl/features/dash_board/presentation/manager/search_weather_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputInformation extends StatefulWidget {
  const InputInformation({super.key});

  @override
  State<InputInformation> createState() => _InputInformationState();
}

class _InputInformationState extends State<InputInformation> {
  final TextEditingController _nameController = TextEditingController();

  _onSearchWeather(BuildContext context) {
    context.read<SearchWeatherStateCubit>().onGetWeather(
      useCase: GetWeatherUseCase(),
      params: _nameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label1(),
        SizedBox(height: 12),
        _cityField(),
        SizedBox(height: 12),
        _searchButton(context),
        SizedBox(height: 12),
        _orDivider(),
        SizedBox(height: 12),
        _useCurrentLocationButton(),
      ],
    );
  }

  Widget _label1() {
    return Text(
      'Enter a City Name',
      style: TextStyle(color: Colors.black, fontSize: 16),
    );
  }

  Widget _cityField() {
    return TextField(
      controller: _nameController,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: 'E.g., New York, London, Tokyo',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _searchButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _onSearchWeather(context),
      child: Text('Search', style: TextStyle(color: Colors.white)),
    );
  }

  Widget _orDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.secondaryColor, thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "or",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.secondaryColor,
            ),
          ),
        ),
        Expanded(child: Divider(color: AppColors.secondaryColor, thickness: 1)),
      ],
    );
  }

  Widget _useCurrentLocationButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondaryColor,
      ),
      onPressed: () {},
      child: Text(
        'Use Current Location',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
