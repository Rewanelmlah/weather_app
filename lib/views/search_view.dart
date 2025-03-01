

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_state/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      //  backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text('Search City',style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold ),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(


            onSubmitted: (value)async{
             var getWeatherCubit= BlocProvider.of<GetWeatherCubit>(context);
             getWeatherCubit.getWeather(cityName: value);
          Navigator.pop(context);
            },


            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 16),
              labelText: 'Search',
              hintText: 'Enter City Name',
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),

              ),
            ),
          ),
        ),
      ),
    );
  }
}

