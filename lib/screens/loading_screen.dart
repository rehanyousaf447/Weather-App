import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/utilities/constants.dart';
class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {

      var weatherData= await WeatherModel().getCurrentWeatherData();
/////////////////////////
    Navigator.push(context, MaterialPageRoute(
      builder: (context){
        return LocationScreen(
          weatherData:weatherData,
        );
      }
    ));



  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDualRing(
          size: 50.0,
          color: Colors.orange,
        ),
      ),
    );
  }
}
// var temp = decodedData['main']['temp'];
// print(temp);
// var condition = decodedData['weather'][0]['id'];
// print(condition);
// var name = decodedData['name'];
// print(name);
// @
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Center(
//       child: RaisedButton(
//         onPressed: () {
//           //Get the current location
//           getLocation();
//         },
//         child: Text('Get Location'),
//       ),
//     ),
//   );
// }

// @override
// void initState() {
//   super.initState();
//   getLocation();
// }
// void getLocation() async{
//   Location location=Location();
//   await location.getCurrentLocation();
// }

// var weatherModel=await WeatherModel().getCurrentWeatherData();
//
//
// Navigator.push(context, MaterialPageRoute(builder: (context){
//   return LocationScreen(
//     weatherData: weatherModel,
//   );
// }));

// Location location = Location();
// await location.getCurrentLocation();
//
// // NetworkHelper networkHelper = NetworkHelper(
// //     url: 'https://api.openweathermap.org/data/2.5/weather?'
// //         'lat=${location.latitude}&lon=${location.longitude}'
// //         '&appid=eeee47c02266b029e463324b44571b59&units=metric');
// //
// // var weatherData = await networkHelper.getData();
// //
// //
// // Navigator.push(context, MaterialPageRoute(
// //   builder: (context){
// //     return LocationScreen();
// //   }
// // ));
// //
//
//
//
