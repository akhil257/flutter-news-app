import 'package:geolocator/geolocator.dart';
import 'package:news/models/location.dart';

class Loc {
  Future<Location> getLoc() async {
    try {
      
      Position position = await Geolocator().getLastKnownPosition();
      Position newPosition = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
      if (newPosition != null) {
        List<Placemark> p = await Geolocator()
            .placemarkFromCoordinates(newPosition.latitude, newPosition.longitude);
        return Location(p[0].country, p[0].administrativeArea,
            p[0].subAdministrativeArea, p[0].postalCode);
      }else if(position!=null){
        List<Placemark> p = await Geolocator()
            .placemarkFromCoordinates(position.latitude, position.longitude);
        return Location(p[0].country, p[0].administrativeArea,
            p[0].subAdministrativeArea, p[0].postalCode);
      }else return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
