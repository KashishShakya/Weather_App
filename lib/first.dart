import 'package:flutter/material.dart';
import 'package:weather_app/second.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

 @override
 State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>{
  final TextEditingController controller = TextEditingController();
  

@override
Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text('WeatherNow',
      style: TextStyle(
        fontStyle: FontStyle.italic, 
      ),
      )),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            Container(
              width: MediaQuery.sizeOf(context).width*0.9,
              child:  TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Enter your place',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(onPressed: (){
                  // clear what is currently in textfield
                  controller.clear();
                }, icon: const Icon(Icons.clear),),
              ),
             ),
            ),  
            
             
             MaterialButton(onPressed: (){ 
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => SecondScreen(
                    city: controller.text,
                ),
                
                ),
                );  
             },
             color: Colors.blue,
             child: const Text('Search weather', style: TextStyle(color: Colors.white)),
             ),
          ],
      ),
    );
  

 }


