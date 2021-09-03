import 'package:flutter/material.dart';
import 'package:news/helpers/responsive.dart';
import 'package:news/helpers/weather_requests.dart';
import 'package:news/models/conditions.dart';

class WeatherWidget extends StatefulWidget {
  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {

  Conditions c;

  void fetchWeather() async {
    var x = await Weather().getWeather();
    setState(() {
      c = x;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }
  @override
  Widget build(BuildContext context) {

    bool b=Responsive.b;
    return c == null
        ? SizedBox()
        : Container(
            margin: EdgeInsets.symmetric(horizontal: Responsive.w(8), vertical: Responsive.w(5)),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.15),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black12,
                  width: 1,
                )),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            child: Row(
              children: <Widget>[
                Text(
                  c.temp.round().toString() + "\u00b0  ",
                  style: TextStyle(
                    fontSize: b?41:30,
                    fontWeight: FontWeight.w200,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${c.wDescription[0].toUpperCase()}${c.wDescription.substring(1)}",
                        style: TextStyle(
                            fontSize: b?18:14.5, color: Colors.black.withOpacity(0.6)),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: b?13:10,
                            color: Colors.black45,
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: FittedBox(
                              child: Text(
                                " " + c.place + ", " + c.state,
                                style: TextStyle(
                                    fontSize: b?13:10, color: Colors.black45),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    'assets/' + c.wIcon + '.png',
                    height: Responsive.w(47),
                  ),
                )
              ],
            ),
          );
  }
}
