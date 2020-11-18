import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class Location{
  double longitude;
  double latitude;

  Future<void> getCurrentLocation() async{
    try {
      Position position = await getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
      print("POSITION:"+position.toString());
    }catch(e){
      print(e);
    }
  }

}