import 'package:flutter/material.dart';
import 'package:parklink/repository/parking_respository.dart';

class ParkingProvider with ChangeNotifier{

  ParkingProvider._(ParkingRespository parkingRepo): parkingRespository = parkingRepo;
  factory ParkingProvider(ParkingRespository parkingRepo) => ParkingProvider._(parkingRepo);

  final ParkingRespository parkingRespository;
}