import 'package:flutter/material.dart';
import "package:project/services/world_time.dart";

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: "Europe/Berlin", location: "Berlin", flag: "germany.png"),
    WorldTime(
        url: "America/Los_Angeles", location: "Los Angeles", flag: "usa.png"),
    WorldTime(url: "Asia/Tokyo", location: "Tokio", flag: "japan.png"),
    WorldTime(
        url: "Australia/Sydney", location: "Sydney", flag: "australia.png"),
  ];

  void updateTime(index) async {
    WorldTime worldTime = locations[index];
    await worldTime.getTime();
    Navigator.pop(context, {
      "location": worldTime.location,
      "flag": worldTime.flag,
      "time": worldTime.time,
      "isDay": worldTime.isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage:
                    AssetImage("assets/images/${locations[index].flag}"),
              ),
            ),
          );
        },
        itemCount: locations.length,
      ),
    );
  }
}
