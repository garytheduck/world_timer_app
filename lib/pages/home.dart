import 'package:flutter/material.dart';
import 'package:world_timer_app/services/weather_model.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  late int temperature;

  WeatherModel weatherModel = WeatherModel();
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);
    print(ModalRoute.of(context)?.settings.arguments as Map);
    //set background
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigoAccent;
    Color locationColor = data['isDayTime'] ? Colors.black : Colors.white;
    Color timeColor = data['isDayTime'] ? Colors.black : Colors.white;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(child: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDayTime': result['isDayTime'],
                      'flag': result['flag']
                    };
                  });
                },
                icon: const Icon(
                    Icons.edit_location,
                  color: Colors.grey,
                ),
                label: const Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 60.0,
                      letterSpacing: 6.0,
                      color: locationColor,
                      fontFamily: 'BebasNeue',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 70.0,
                  color: timeColor,
                  letterSpacing: 4.0,
                  fontFamily: 'BebasNeue',
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                  data['temperature'].toString(),
                style: TextStyle(
                  fontSize: 50.0,
                  letterSpacing: 6.0,
                  color: locationColor,
                  fontFamily: 'BebasNeue',
                ),
              ),
            ],
          ),
        ),
      ),),
    );
  }
}
