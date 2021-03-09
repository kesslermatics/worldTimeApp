import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgImage = data["isDay"] ? "day.jpg" : "night.jpg";
    Color bgColor = data["isDay"] ? Colors.blue[300] : Colors.indigo[700];
    Color textColor = data["isDay"] ? Colors.grey[900] : Colors.white;
    Color iconColor = data["isDay"] ? Colors.white : Colors.grey[900];
    Color iconBgColor = data["isDay"] ? Colors.grey[800] : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/$bgImage"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data["location"],
                      style: TextStyle(
                        fontSize: 28,
                        color: textColor,
                        letterSpacing: 2,
                        fontFamily: "Lobster",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 90,
                ),
                Text(
                  data["time"],
                  style: TextStyle(
                    fontSize: 66,
                    color: textColor,
                    fontFamily: "Lobster",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: iconBgColor,
        onPressed: () async {
          dynamic result = await Navigator.pushNamed(
            context,
            "/location",
          );
          setState(() {
            data = {
              "location": result["location"],
              "flag": result["flag"],
              "time": result["time"],
              "isDay": result["isDay"],
            };
          });
        },
        child: Icon(
          Icons.edit_location,
          color: iconColor,
        ),
      ),
    );
  }
}
