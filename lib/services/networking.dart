import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'  as http ;
import 'dart:convert';

class NetworkHelper{

  NetworkHelper({@required this.url});
  String url;

  Future<dynamic> getData() async{

    http.Response response=await http.get(url);

    if(response.statusCode==200){
      String data=response.body;
      return jsonDecode(data);
    }
    else{
      print('ERROR:'+response.statusCode.toString());
    }
  }
}










//var temp=decodedData['main']['temp'];
// print(temp);
// var condition=decodedData['weather'][0]['id'];
// print(condition);
// var name=decodedData['name'];
// print(name);