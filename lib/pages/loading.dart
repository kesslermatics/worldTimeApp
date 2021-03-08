import 'package:flutter/material.dart';
import "package:flutter_spinkit/flutter_spinkit.dart";
import "package:project/services/world_time.dart";

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "loading";

  void setUpWorldTime() async {
    WorldTime worldtime = WorldTime(
      location: "Berlin",
      flag: "germany.png",
      url: "Europe/Berlin",
    );
    await worldtime.getTime();
    Navigator.pushReplacementNamed(
      context,
      "/home",
      arguments: {
        "location": worldtime.location,
        "flag": worldtime.flag,
        "time": worldtime.time,
        "isDay": worldtime.isDay,
      },
    );
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "World Time",
              style: TextStyle(
                fontSize: 40,
                fontFamily: "Lobster",
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SpinKitPouringHourglass(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
