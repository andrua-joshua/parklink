import 'package:parklink/module/booking.dart';
import 'package:parklink/module/parking.dart';

class User{

  final int id;
  final String username;
  final String email;
  final List<Booking> bookings;
  final List<Parking> parkings;


  const User({
    required this.email,
    required this.bookings,
    required this.id,
    required this.parkings,
    required this.username
  });



  factory User.fromJson(Map<String, dynamic> json)
    => User(
      email: json['email'], 
      bookings: ((json['bookings']??[]) as List<dynamic>).map(
        (element)=> Booking.fromJson(element)
      ).toList(), 
      id: json['id'], 
      parkings: ((json['parkings']??[]) as List<dynamic>).map(
        (element)=> Parking.fromJson(element)
      ).toList(), 
      username: json['username']);
}