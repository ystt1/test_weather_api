import 'package:demo_golden_owl/common/constant/color.dart';
import 'package:flutter/material.dart';

class InputInformation extends StatelessWidget {
  const InputInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label1(),
        SizedBox(height: 12),
        _cityField(),
        SizedBox(height: 12),
        _searchButton(),
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
      decoration: InputDecoration(
        hintText: 'E.g., New York, London, Tokyo',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _searchButton() {
    return ElevatedButton(
      onPressed: () {},
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
