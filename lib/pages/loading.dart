import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:time_app/services/World_Time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
    void setUpWorldTime() async {
    World_Time instance=World_Time(location: 'pakistan',flag: 'pakistan.png',url: 'Asia/Karachi');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime':instance.isDayTime
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     setUpWorldTime();

   }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Center(
      child: SpinKitThreeBounce(
        color: Colors.white,
        size: 50.0,
      ),
      ),
      );
  }
}
