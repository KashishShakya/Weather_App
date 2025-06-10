import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/consts.dart';

class SecondScreen extends StatefulWidget {
    final  String city; 

   const SecondScreen({
   super.key,
    required this.city,
   });
  

  @override
 State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>{
  final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);

  Weather? _weather;
  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  void _fetchWeather() {
    _wf.currentWeatherByCityName(widget.city).then((w) {
      setState(() {
        _weather = w;
      });
    });
  }

    

 @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(
    title: Text('Weather Now',
    style: TextStyle(
        fontStyle: FontStyle.italic, 
      ),
    )
  ),
  body: _buildUI(),
  );

  Widget _buildUI() {
    if(_weather == null){
      return const Center(child: CircularProgressIndicator(),);
    }
    return SizedBox(width: MediaQuery.sizeOf(context).width,
    height: MediaQuery.sizeOf(context).height,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(widget.city,
        style: const TextStyle(
        color: Colors.black,
        fontSize: 40,
        fontWeight: FontWeight.w500,
        ),
        ),
        
        _weatherIcon(),
        
        _currentTemp(),
        
      ],
    ),
    );
  }

  Widget _weatherIcon(){
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height*0.20,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage("http://openweathermap.org/img/wn/${_weather?.weatherIcon}@4x.png"))),),
            Text("Weather Condition : ${ _weather?.weatherDescription }",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
            ),
      ],

    );
  }

  Widget _currentTemp(){
    return Text("Temperature : ${_weather?.temperature?.celsius?.toStringAsFixed(0)}° C",
    style: const TextStyle(
      color: Colors.black,
      fontSize: 40,
      fontWeight: FontWeight.w500,
    ),
    );

  }

   

}