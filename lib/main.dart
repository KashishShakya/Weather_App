import 'package:flutter/material.dart';
import 'package:weather_app/first.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
 
 @override
  Widget build(BuildContext context) {
  return MaterialApp(
    home: FirstScreen(),
  );

 }
} 