import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class World_Time{
  String location;
  String url;
  String flag;
  String time;
  bool isDayTime;
  World_Time({this.location,this.flag,this.url});

  Future<void> getTime() async{

    try {
      Response response = await get(
          "http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);
      //print(data);
      String datetime = data['datetime'];
      print(datetime);
      String utc_offset = data['utc_offset'].substring(1, 3);
      print(utc_offset);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(utc_offset)));
      isDayTime= now.hour> 6 && now.hour < 20 ? true:false;
      print(isDayTime);
      time = DateFormat.jm().format(now);
    }
    catch(exception){
      time="Could not get time !";
    }
  }



}