import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_state/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_state/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>GetWeatherCubit(),
      child: Builder(
        builder:(context)=> BlocBuilder<GetWeatherCubit,WeatherState>(
          builder: (context,state) {
            return MaterialApp(
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  backgroundColor: getThemeColor(BlocProvider
                      .of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,),
                  elevation: 5.0,
                  shadowColor: Colors.black87,
                ),
                colorScheme: ColorScheme.light().copyWith(
                    primary: getThemeColor(BlocProvider
                        .of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition,)),
              ),
              debugShowCheckedModeBanner: false,
              home: HomeView(),
            );}
        ),
      ),
    );
  }
}


ColorSwatch<int> getThemeColor(String? condition) {
  if (condition==null){
    return Colors.teal;
  }
  switch (condition.toLowerCase()) {
    case 'sunny':
      return Colors.orange;
    case 'clear':
      return Colors.deepPurple;
    case 'partly cloudy':
      return Colors.blueGrey;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
      return Colors.blueGrey;
    case 'mist':
      return Colors.lightBlue;
    case 'patchy rain possible':
      return Colors.lightBlueAccent;
    case 'patchy snow possible':
      return Colors.cyan;
    case 'patchy sleet possible':
      return Colors.cyanAccent;
    case 'patchy freezing drizzle possible':
      return Colors.lightBlue;
    case 'thundery outbreaks possible':
      return Colors.deepOrange;
    case 'blowing snow':
      return Colors.blueAccent;
    case 'blizzard':
      return Colors.lightBlue;
    case 'fog':
      return Colors.grey;
    case 'freezing fog':
      return Colors.blueGrey;
    case 'patchy light drizzle':
      return Colors.lightBlueAccent;
    case 'light drizzle':
      return Colors.lightBlue;
    case 'freezing drizzle':
      return Colors.lightBlueAccent;
    case 'heavy freezing drizzle':
      return Colors.cyan;
    case 'patchy light rain':
      return Colors.lightBlue;
    case 'light rain':
      return Colors.blue;
    case 'moderate rain at times':
      return Colors.blueAccent;
    case 'moderate rain':
      return Colors.blue;
    case 'heavy rain at times':
      return Colors.indigo;
    case 'heavy rain':
      return Colors.indigoAccent;
    case 'light freezing rain':
      return Colors.cyan;
    case 'moderate or heavy freezing rain':
      return Colors.lightBlue;
    case 'light sleet':
      return Colors.cyanAccent;
    case 'moderate or heavy sleet':
      return Colors.cyan;
    case 'patchy light snow':
      return Colors.cyan;
    case 'light snow':
      return Colors.cyanAccent;
    case 'patchy moderate snow':
      return Colors.cyan;
    case 'moderate snow':
      return Colors.cyan;
    case 'patchy heavy snow':
      return Colors.lightBlueAccent;
    case 'heavy snow':
      return Colors.lightBlue;
    case 'ice pellets':
      return Colors.lightBlueAccent;
    case 'light rain shower':
      return Colors.blueAccent;
    case 'moderate or heavy rain shower':
      return Colors.indigo;
    case 'torrential rain shower':
      return Colors.indigoAccent;
    case 'light sleet showers':
      return Colors.cyanAccent;
    case 'moderate or heavy sleet showers':
      return Colors.cyan;
    case 'light snow showers':
      return Colors.cyanAccent;
    case 'moderate or heavy snow showers':
      return Colors.cyan;
    case 'light showers of ice pellets':
      return Colors.cyanAccent;
    case 'moderate or heavy showers of ice pellets':
      return Colors.cyan;
    case 'patchy light rain with thunder':
      return Colors.deepOrangeAccent;
    case 'moderate or heavy rain with thunder':
      return Colors.deepOrange;
    case 'patchy light snow with thunder':
      return Colors.cyanAccent;
    case 'moderate or heavy snow with thunder':
      return Colors.cyan;
    default:
      return Colors.teal; // Default color if condition doesn't match
  }}
