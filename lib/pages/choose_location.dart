import 'package:flutter/material.dart';

import '../services/weather_model.dart';
import '../services/world_time.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'America/Los_Angeles', location: 'Los_Angeles', flag: 'usa.png'),
    WorldTime(url: 'America/Mexico_City', location: 'Mexico_City', flag: 'mexico_city.png'),
    WorldTime(url: 'Africa/Accra', location: 'Accra', flag: 'accra.png'),
    WorldTime(url: 'America/El_Salvador', location: 'El_Salvador', flag: 'el_salvador.jpg'),
    WorldTime(url: 'America/Puerto_Rico', location: 'Puerto_Rico', flag: 'puerto_rico.png'),
    WorldTime(url: 'Asia/Beirut', location: 'Beirut', flag: 'beirut.png'),
    WorldTime(url: 'Asia/Damascus', location: 'Damascus', flag: 'damascus.png'),
    WorldTime(url: 'Asia/Hong_Kong', location: 'Hong_Kong', flag: 'hong_kong.png'),
    WorldTime(url: 'Asia/Jerusalem', location: 'Jerusalem', flag: 'jerusalem.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'tokyo.png'),
    WorldTime(url: 'Europe/Kiev', location: 'Kiev', flag: 'kiev.png'),
    WorldTime(url: 'Europe/Madrid', location: 'Madrid', flag: 'madrid.png'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow', flag: 'moscow.png'),
    WorldTime(url: 'Europe/Rome', location: 'Rome', flag: 'rome.png'),
    WorldTime(url: 'Pacific/Honolulu', location: 'Honolulu', flag: 'honolulu.png'),
    WorldTime(url: 'Pacific/Fiji', location: 'Fiji', flag: 'fiji.png'),
    WorldTime(url: 'Europe/Bucharest', location: 'Bucharest', flag: 'bucharest.png'),
  ];
  List<String> locationsTemp = [
    "London", "Athens", "Cairo", "Nairobi", "Chicago", "New York", "Seoul", "Jakarta", "Los_Angeles", "Mexico_City", "Accra", "El_Salvador", "Puerto_Rico", "Beirut", "Damascus", "Hong_Kong", "Jerusalem", "Tokyo", "Kiev", "Madrid", "Moscow", "Rome", "Honolulu",
    "Fiji",
    "Bucharest"
  ];
  void updateTimeandTemp(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    WeatherModel weatherModel = WeatherModel();
    late  int temperature;

    var weatherData = await weatherModel.getLocationWeather(locationsTemp[index]);
    print(weatherData);
    setState(() {
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
    });
    print('TEMPERATURAAAAA : $temperature');
    //navigate to home screen
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'temperature': temperature,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTimeandTemp(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),

              ),
            );
          },
      ),
    );
  }
}
