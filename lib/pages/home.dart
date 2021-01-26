import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
     Map data={};
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    }

  @override
  Widget build(BuildContext context) {
      data=data.isNotEmpty? data:ModalRoute.of(context).settings.arguments;
      print(data);
      String bgImage=data['isDayTime']? 'day.png':'night.png';
      Color textColor=data['isDayTime']?  Colors.black : Colors.white;
      Color bgColour=data['isDayTime']? Colors.blue :Colors.indigo[900];
      return Scaffold(
      backgroundColor: bgColour,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image:DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                SizedBox(height: 10),
                FlatButton.icon(
                    onPressed: () async{
                dynamic result=await Navigator.pushNamed(context, '/location');
                setState(() {
                  data={
                    'time':result['time'],
                    'location':result['location'],
                    'isDayTime':result['isDayTime'],
                    'flag':result['flag']
                  };
                });
                },

                icon: Icon(Icons.location_pin,
                color: textColor,
                ),
                label: Text('Edit Location',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor
                  ),
                )
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'],
                    style: TextStyle(
                      fontSize:22,
                      letterSpacing: 2.0,
                      color: textColor
                     ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Text(data['time'],
                style: TextStyle(
                  fontSize: 66,
                  color: textColor
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
