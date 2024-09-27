import 'package:flutter/material.dart';
import 'package:parklink/repository/booking_repository.dart';

class BookingProvider with ChangeNotifier{

  BookingProvider._(BookingRepository bookingRepo): bookingRepository = bookingRepo;
  factory BookingProvider(BookingRepository bookingRepo) => BookingProvider._(bookingRepo);

  final BookingRepository bookingRepository;
}