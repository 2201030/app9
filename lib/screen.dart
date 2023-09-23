import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/model.dart';

class APIScreen extends StatefulWidget {
  const APIScreen({super.key});

  @override
  State<APIScreen> createState() => _APIScreenState();
}

class _APIScreenState extends State<APIScreen> {
  @override
  void initState() {
    super.initState();
getWeatherDAta();
  }
 late  WeatherModel weatherModel;

    Dio dio=Dio();
    String baseurl="http://api.weatherapi.com/v1";
        String keyy="d77728242aa347e6b94215653232209";
            String city="Alexanderia";


    bool isload=true;

Future<void> getWeatherDAta() async {

  Response r=await  dio.get("${baseurl}/forecast.json?key=${keyy}&q=${city}&days=1&aqi=no&alerts=no");
weatherModel=WeatherModel.origin(r.data);
print(weatherModel.image);
setState(() {
  isload=false;
});


}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(

appBar: AppBar(
  title: const Text("Weather App",style: TextStyle(fontSize: 40,color: Colors.black),),
  centerTitle: true,
  backgroundColor: const Color.fromARGB(255, 154, 60, 9),
),

backgroundColor:  Color.fromARGB(255, 246, 244, 243),
body:isload?   Center(child: CircularProgressIndicator(
color: Colors.brown,



)
):

 Container(
  height: double.infinity,
  width: double.infinity,
  child:   Column(
    mainAxisAlignment: MainAxisAlignment.center,
  
    children: [
  
  Text("${weatherModel.city_name}",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
  SizedBox(height: 20,),
  Text("updated at ${weatherModel.last_date}",style: TextStyle(fontSize: 30,),),
  
  Row(children: [
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Image.network("https:${weatherModel.image}",height: 80,),
),
SizedBox(width: 30,),
Text("${weatherModel.temp}°C",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
SizedBox(width: 30,),
Column(
  children: [
    Text("Maxtemp:${weatherModel.max_temp} °C",style: TextStyle(fontSize: 20,),),
        Text("Mintemp: ${weatherModel.min_temp}°C",style: TextStyle(fontSize: 20,),)

  ],
)

  ],),
  SizedBox(height: 40,),
  
  Text("${weatherModel.weather_condition}",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)
  
    ],
  
  ),
),
    ),
);






    
  }
}