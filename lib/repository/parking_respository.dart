import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:parklink/module/parking.dart';


class ParkingRespository{

  Future<List<Parking>> getAllParkings()async{
    final uri = Uri.parse("http://154.72.206.212:5000/api/v1/parking/all");
    // final uri = Uri.parse("http://localhost:5000/api/v1/parking/all");

    try{
      final res = await http.get(uri);

      if(res.statusCode == 200){
        final data = jsonDecode(res.body);
        return (data as List<dynamic>).map(
          (eleement)=> Parking.fromJson(eleement)
        ).toList();
      }else{
        return [];
      }
    }catch(e){
      print("::::::>>>>>  Error fetching parkings....   $e");
      return [];
    }
  }


  Future<void> deleteParking({
    required int parkingId
  }) async{
    final uri = Uri.parse("http://154.72.206.212:5000/api/v1/parking/delete/$parkingId");
    // final uri = Uri.parse("http://localhost:5000/api/v1/parking/delete/$parkingId");
    try{
      final res = await http.delete(uri);

      if(res.statusCode == 200){
        Fluttertoast.showToast(msg: "Parking Removed succefuly");
      }else if(res.statusCode == 404){
        Fluttertoast.showToast(msg: "Parking not found");
      }else{
        Fluttertoast.showToast(msg: "Removing parking failed");
      }

    }catch(err){
      print("::::>>>>> Error deleting parking:  $err");

    }
  }



  Future<void> addParking ({
    required String title,
    required int carSlots,
    required int truckSlots,
    required int bikeSlots,
    required double carNightCost,
    required double truckNightCost,
    required double bikeNightCost,
    required String location,
    required int userId,
    required double lng,
    required double lat
  }) async{
    final uri = Uri.parse("http://154.72.206.212:5000/api/v1/parking/add");
    // final uri = Uri.parse("http://localhost:5000/api/v1/parking/add");

    final payload = {
      "title": title,
      "carSlots": carSlots,
      "truckSlots": truckSlots,
      "bikeSlots": bikeSlots,
      "bikeNightCost": bikeNightCost,
      "carNightCost": carNightCost,
      "truckNightCost": truckNightCost,
      "location": location,
      "userId": userId,
      "lng": lng,
      "lat": lat
    };


    try{
      final res = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(payload)
        );


        if(res.statusCode == 200){
          Fluttertoast.showToast(msg: "Parking added sucessfully");
        }else{
          Fluttertoast.showToast(msg: "Failed to add Parking");
        }

    }catch(err){
      print(":::::>>>> Error adding ");
      Fluttertoast.showToast(msg: "Error adding parking");
    }

  }


  
}