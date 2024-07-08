import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_state/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel=BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              getThemeColor(weatherModel.weatherCondition),
              getThemeColor(weatherModel.weatherCondition)[300]!,
              getThemeColor(weatherModel.weatherCondition)[50]!,
            ],
            begin: Alignment.topLeft,end: Alignment.bottomCenter),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              weatherModel.cityName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
             Text(
              'updated at ${stringToDateTime(weatherModel.date).hour}:${stringToDateTime(weatherModel.date).minute}',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  "https:${weatherModel.image}",

                ),
                Text(
                  weatherModel.temp.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                 Column(
                  children: [
                    Text(
                      'Maxtemp: ${weatherModel.maxTemp.round()}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mintemp: ${weatherModel.minTemp.round()}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
             Text(
              weatherModel.weatherCondition,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
DateTime stringToDateTime(String value){
  return DateTime.parse(value);
}
