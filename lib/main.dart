import 'package:flutter/material.dart';
import 'package:world_timer_app/pages/loading.dart';
import 'pages/home.dart';
import 'pages/choose_location.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const Loading(),
    '/home' : (context) => const Home(),
    '/location' : (context) => const Location(),
  },
));