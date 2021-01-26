import 'package:flutter/material.dart';
import 'package:time_app/services/World_Time.dart';
class Choose_Location extends StatefulWidget {
  @override
  _Choose_LocationState createState() => _Choose_LocationState();
}

class _Choose_LocationState extends State<Choose_Location> {

  List<World_Time> locations = [
    World_Time(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    World_Time(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    World_Time(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    World_Time(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    World_Time(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    World_Time(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    World_Time(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    World_Time(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),

  ];

  void setUpTime(index)async {
    World_Time instance=locations[index];
    await instance.getTime();
    print(instance.isDayTime);
   Navigator.pop(context,{
     'location': instance.location,
     'time': instance.time,
     'isDayTime':instance.isDayTime,
     'flag':instance.flag
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
    body: ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
          child: Card(
            child: ListTile(
             onTap: (){
               setUpTime(index);
             },
             title: Text(locations[index].location),
             leading: CircleAvatar(
               backgroundImage:AssetImage('assets/${locations[index].flag}'),
             ),
            ),
          ),
        );
      },
    ),
    );
  }
}
