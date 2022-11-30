
import 'package:world_timer_app/services/world_celsius.dart';
import 'package:world_timer_app/services/network_data.dart';
import 'package:world_timer_app/application/theme/constants.dart';


const weatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  List<WorldCelsius> locations = [

  ];
  Future<dynamic> getLocationWeather(String adress) async {
    /// await for methods that return future
    WorldCelsius location = WorldCelsius();
    await location.getCurrentLocation(adress);

    /// Get location data
    ///&units=metric change the temperature metric
    NetworkData networkHelper = NetworkData(
        '$weatherApiUrl?lat=${location.lat}&lon=${location.lon}&appid=$API_KEY&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

}