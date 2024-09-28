import 'package:geolocator/geolocator.dart';
import 'package:parklink/module/location.dart';

class GeolocationServiceGeolocatorApi{
  
  final long = 32.6621247;
  final lat  = 0.3491314;
  


  Future<LocationModule> getCurrentLocation() async{
    bool permission =  await requestPermission();
    if(!permission){
      Future.error("Permission denied");
    }

    final position = await Geolocator.getCurrentPosition();
    
    return LocationModule(lat: position.latitude, long: position.longitude);
  }

  Future<bool> requestPermission() async{

    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately. 
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
    }

    return true;
    
  }


  

  
}