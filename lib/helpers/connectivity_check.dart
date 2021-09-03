import 'package:connectivity/connectivity.dart';
import 'dart:io';

class ConnectionCheck {
  Future<bool> getConnectionCheck() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        try {
          final result = await InternetAddress.lookup('examle.com');
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            print('connected');
            return true;
          } else {
            print('inactive connection');
            return false;
          }
        } on SocketException catch (_) {
          print('lookup failed');
          return false;
        }
      } else {
        print('no connectivity found');
        return false;
      }
    } catch (e) {
      print('platform exception');
      return false;
    }
  }
}
