import 'package:parklink/module/booking.dart';

class Parking{

  final int id;
  final String title;
  final int carSlots;
  final int truckSlots;
  final int bikeSlots;
  final double carNightCost;
  final double bikeNightCost;
  final double truckNightCost;
  final String location;
  final List<Booking> bookings;


  const Parking({
    required this.id,
    required this.title,
    required this.carSlots,
    required this.bikeSlots,
    required this.truckSlots,
    required this.carNightCost,
    required this.bikeNightCost,
    required this.truckNightCost,
    required this.location,
    required this.bookings,
  });


  factory Parking.fromJson(Map<String,dynamic> json)
    => Parking(
      id: json['id'],
      title: json['title'], 
      carSlots: json['carSlots'], 
      bikeSlots: json['bikeSlots'], 
      truckSlots: json['truckSlots'], 
      carNightCost: json['carNightCost'], 
      bikeNightCost: json['bikeNightCost'], 
      truckNightCost: json['truckNightCost'], 
      bookings: ((json['bookings']??[]) as List<dynamic>).map(
        (element)=> Booking.fromJson(element)
      ).toList(), 
      location: json['location']);

}