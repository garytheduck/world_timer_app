import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_timer_app/services/world_celsius.dart';
import 'dart:convert';
import 'package:world_timer_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/weather_model.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<void> setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    WeatherModel weatherModel = WeatherModel();
    late int temperature;
    var weatherData = await weatherModel.getLocationWeather("Berlin");
    print(weatherData);
    setState(() {
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      print(temperature);
    });
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
      'temperature' : temperature,
    });

    //WorldCelsius celsiusInstance = WorldCelsius(lat: lat, lon: lon)
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: SpinKitPouringHourGlass(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
