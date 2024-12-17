import 'package:flutter/material.dart';
import 'package:testflightbook/view/ezy_travel_screen.dart';
import 'package:testflightbook/view/fligh_search_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Search',
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: const FlightSearchScreen()
      //const EzyTravelScreen(),
    );
  }
}
