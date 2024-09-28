import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:parklink/module/booking.dart';

class BookingRepository{

  Future<List<Booking>> fetchUserBookings({
    required int userId
  })async{
    print("::::::::::::User booking::   ");
    final uri = Uri.parse("http://154.72.206.212:5000/api/v1/bookings/$userId");
    // final uri = Uri.parse("http://localhost:5000/api/v1/bookings/$userId");
    try{
      final res = await http.get(
        uri, 
      );

      if(res.statusCode == 200){
        final data = jsonDecode(res.body);
        return (data as List<dynamic>).map(
          (element) => Booking.fromJson(element)
        ).toList(); 
      }else{
        return [];
      }

    }catch(e){
      print("Error getting::   $e");
      return [];
    }
    
  }


  Future<List<Booking>> fetchParkingBookings({
    required int parkingId
  })async{

    print("::::::::::::Parking booking::   ");
    final uri = Uri.parse("http://154.72.206.212:5000/api/v1/bookings/parking/$parkingId");
    // final uri = Uri.parse("http://localhost:5000/api/v1/bookings/parking/$parkingId");
    try{
      final res = await http.get(
        uri, 
      );

      if(res.statusCode == 200){
        final data = jsonDecode(res.body);
        return (data as List<dynamic>).map(
          (element) => Booking.fromJson(element)
        ).toList(); 
      }else{
        return [];
      }

    }catch(e){
      print("Error getting::   $e");
      return [];
    }
    
  }


  Future<Booking?> makeBooking({
    required int userId,
    required int slotsCount,
    required String slotsType,
    required int duration,
    required double unitNightCost,
    required DateTime startDate,
    required int parkingId
  })async{
    final uri = Uri.parse("http://154.72.206.212:5000/api/v1/bookings/makeBooking");
    // final uri = Uri.parse("http://localhost:5000/api/v1/bookings/makeBooking");

    /**
     * 
     * {
  "slotType": "carSlot",
  "slotsCount": 2,
  "unitNightCost": 3000,
  "duration": 2,
  "startDate": "2024-09-09",
  "userId": 1,
  "parkingId": 5
}
     * 
     */


    final payload = {
      "userId": userId,
      "parkingId": parkingId,
      "slotsCount": slotsCount,
      "slotType": slotsType,
      "unitNightCost": unitNightCost,
      "duration": duration,
      "startDate": startDate.toIso8601String(),
    };

    try{
      final res = await http.post(
        uri, 
        headers: {
          "Content-Type": "application/json"
        },
        body: jsonEncode(payload)
      );

      if(res.statusCode == 200){
        final data = jsonDecode(res.body);
        return Booking.fromJson(data); 
      }else{
        return null;
      }

    }catch(e){
      print("Error getting::   $e");
      return null;
    }
    
  }







}