import 'package:http/http.dart' as http;
import 'package:news/models/stock.dart';
import 'dart:convert';
import 'constants.dart' as Constants;

class Market {
  List<Stock> res = [];
  Future<List<Stock>> getStock() async {

    String url = Constants.STOCK_URL;

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
        try {
              List<String> s=jsonData['data'][0]['last'].toString().split(',');
              double lastPrice=double.parse(s[0]+s[1]);
              List<String> s1=jsonData['data'][0]['previousClose'].toString().split(',');
              double previousClose=double.parse(s1[0]+s1[1]);
              // String perChangeS = jsonData['data'][0]['percChange'].toString();
              double perChangeS=double.parse(jsonData['data'][0]['percChange'].toString());
              // double perChange=lastPrice-double.parse(jsonData['data'][0]['previousClose'].toString());

          res.add(Stock(
              'Nifty 50',
              lastPrice,
              lastPrice-previousClose,
              perChangeS));
        } catch (e) {
          print('unable to parse nifty data');
          return res;
        }

        try {
              List<String> s=jsonData['data'][3]['last'].toString().split(',');
              double lastPrice=double.parse(s[0]+s[1]);
              List<String> s1=jsonData['data'][3]['previousClose'].toString().split(',');
              double previousClose=double.parse(s1[0]+s1[1]);
              // String perChangeS = jsonData['data'][0]['percChange'].toString();
              double perChangeS=double.parse(jsonData['data'][3]['percChange'].toString());
              // double perChange=lastPrice-double.parse(jsonData['data'][0]['previousClose'].toString());
            print(lastPrice);
            print(lastPrice-previousClose);
            print(perChangeS);
          res.add(Stock(
              'Bank Nifty',
              lastPrice,
              lastPrice-previousClose,
              perChangeS));
        } catch (e) {
          print('unable to parse nifty data');
          return res;
        }
      
    } else {
      print('Nifty response not recieved');
      return res;
    }

    return res;
  }
}
