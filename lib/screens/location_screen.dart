import 'package:flutter/material.dart';
import "package:weather_app/utilities/constants.dart";
import 'package:weather_app/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  var weatherData;
  LocationScreen({this.weatherData});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temp;
  String weatherIcon;
  String message;
  String cityName;
  WeatherModel weatherModel = WeatherModel();

  void updateUI(var weatherData) {
    setState(() {

      var temper = weatherData['main']['temp'];

      if(temper.runtimeType==double) {
        double mytemp=weatherData['main']['temp'];
        temp = temper.toInt();
        }
      else if(temper.runtimeType==int){
        temp=weatherData['main']['temp'];
      }

      print(temper);
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);

      message = weatherModel.getMessage(temp);

      cityName = weatherData['name'];
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData =
                          await weatherModel.getCurrentWeatherData();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var name = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return CityScreen();
                        }),
                      );
                      if(name !=null){
                        var weatherData=await weatherModel.getLocationCityData(name);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$message in $cityName!',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// var weatherDate =
//     await weatherModel.getCurrentWeatherData();
// updateUI(weatherDate);
// var cityName = await  Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) {
//     return CityScreen();
//   }),
// );
// if(cityName !=null){
//   print(cityName);
//   var weatherData= await weatherModel.getLocationCityData(cityName.toString());
//   updateUI(weatherData);
// }

//void updateUI(dynamic weatherdata) {
//   setState(() {
//     if (weatherdata == null) {
//       temp = 0;
//       weatherIcon = 'error';
//       message = "Unable to get weather data";
//       name = '';
//       return;
//     }
//     print("hello");
//     var temperature = weatherdata['main']['temp'];
//     temp = temperature.toInt();
//     message = weatherModel.getMessage(temp);
//
//     int condition = weatherdata['weather'][0]['id'];
//     weatherIcon = weatherModel.getWeatherIcon(condition);
//
//     name = weatherdata['name'];
//   });
// }

// WeatherModel weatherModel = WeatherModel();
// int temp;
// String weatherIcon;
// String name;
// String message;

// int temp;
// String weatherIcon;
// String message;
// String cityName;
// WeatherModel weatherModel = WeatherModel();
//
// @override
// void initState() {
//   super.initState();
//   updateUI(widget.weatherData);
// }
//
// void updateUI(var myWeatherData) {
//   setState(() {
//     if (myWeatherData == null) {
//       temp = 0;
//       weatherIcon = 'error';
//       message = "Unable to get weather data";
//       cityName = '';
//       return;
//     }
//     double temper = myWeatherData['main']['temp'];
//     temp = temper.toInt();
//     var condition = myWeatherData['weather'][0]['id'];
//     weatherIcon = weatherModel.getWeatherIcon(condition);
//     message = weatherModel.getMessage(temp);
//     cityName = myWeatherData['name'];
//   });
// }
