import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news/helpers/location_request.dart';
import 'package:news/models/conditions.dart';
import 'package:news/models/location.dart';
import 'constants.dart' as Constants;

class Weather {
  Future<Conditions> getWeather() async {
    print('in weather');
    Location l = await Loc().getLoc();
    if (l != null) {
      String url =
          "http://api.openweathermap.org/data/2.5/weather?q=${l.city}&units=metric&appid=${Constants.WEATHERAPI_ID}";

      var response = await http.get(url);

      var jsonData = jsonDecode(response.body);

      if (jsonData['cod'] == 200) {
        try {
          String appIcon=jsonData['weather'][0]['icon'].toString().trim().toLowerCase();
          if(appIcon=="09n"){
            appIcon="09d";
          }else if(appIcon=="11n"){
            appIcon="11d";
          }else if(appIcon=="13n"){
            appIcon="13d";
          }else if(appIcon=="50n"){
            appIcon="50d";
          }
          return Conditions(
              l.city,
              l.state,
              jsonData['main']['temp'] is double ? (jsonData['main']['temp'] as double).toInt() : jsonData['main']['temp'],
              jsonData['main']['feels_like'] is double ? (jsonData['main']['feels_like'] as double).toInt() : jsonData['main']['feels_like'],
              jsonData['main']['humidity'] is double ? (jsonData['main']['humidity'] as double).toInt() : jsonData['main']['humidity'],
              jsonData['weather'][0]['id'],
              jsonData['weather'][0]['main'],
              jsonData['weather'][0]['description'],
              appIcon,
              jsonData['wind']['speed'] is int ? (jsonData['wind']['speed'] as int).toDouble() : jsonData['wind']['speed']
              );
        } catch (e) {
          print('unparsable values received');
          return null;
        }
      } else{
        print('request failed');
        return null;
      }
    } else {
      print(('not able to fetch location'));
      return null;
    }
  }
}
