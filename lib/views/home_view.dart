import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_state/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_state/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

import '../widgets/no_weather_body.dart';
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text('Daily Weather',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      actions: [
        IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return SearchView();
          }));
        }, icon: Icon(Icons.search,))
      ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context,state){
          if (state is WeatherInitialState){
            return NoWeatherBody();
          }else if (state is WeatherLoadedState){return WeatherInfoBody(
          );
          }else {return Text('oops there was an error');}
        },
      ),
    );
  }
}