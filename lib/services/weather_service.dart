import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService{
 final Dio dio ;
final String baseUrl = 'http://api.weatherapi.com/v1';
final String apiKay='08e7d66f717549c1a78174421240607';
  WeatherService(this.dio);
 Future<WeatherModel> getCurrentWeather({required String cityName})async{
   try {
     Response response=await dio.get(
          '$baseUrl/forecast.json?key=$apiKay&q=$cityName&days=1');
     WeatherModel weatherModel=WeatherModel.fromJson(response.data);
     return weatherModel;
   } on DioException catch (e) {
     final String errorMessage = e.response?.data['error']['message'] ??'oops there was an error,try later';
     throw Exception(errorMessage);
   }catch(e){
     log(e.toString());
     throw Exception('oops there was an error,try later');
   }
 }
}