import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  late String location; //location name for the UI
  late String time; //time in the location
  late String flag; //image from the url flag
  late String url; //the location url for API endpoint
  bool isDayTime = true; //true or false for day and night

  WorldTime({required this.location, required this.flag, required this.url});
  Future<void> getTime() async {
    try{
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //print(dateTime);
      //print(offset);

      //create dateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set time property
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);

    }catch(e){
      print('$e');
      time = 'cannot get time data';
    }

  }

}

