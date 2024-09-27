import 'package:flutter/material.dart';
import 'package:parklink/providers/booking_provider.dart';
import 'package:parklink/providers/parking_provider.dart';
import 'package:parklink/providers/user_provider.dart';
import 'package:parklink/repository/auth_repository.dart';
import 'package:parklink/repository/booking_repository.dart';
import 'package:parklink/repository/parking_respository.dart';
import 'package:parklink/route.dart';
import 'package:parklink/routes/add_parking_screen/add_parking_screen.dart';
import 'package:parklink/routes/bookings_screen/bookings_screen.dart';
import 'package:parklink/routes/home_screen/home_screen.dart';
import 'package:parklink/routes/login_screen/login_screen.dart';
import 'package:parklink/routes/all_parkings_screen/all_parkings_screen.dart';
import 'package:parklink/routes/navigator_screen/navigator_screen.dart';
import 'package:parklink/routes/parking_details_screen/parking_details_screen.dart';
import 'package:parklink/routes/parkings_screen/parking_screen.dart';
import 'package:parklink/routes/signup_screen/signup_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (context)=> UserProvider(AuthRepository())),

        ChangeNotifierProvider<ParkingProvider>(
          create: (context)=> ParkingProvider(ParkingRespository())),

        ChangeNotifierProvider<BookingProvider>(
          create: (context)=> BookingProvider(BookingRepository()))
      ],
      builder: (context, child) => const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ParkLink',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteGenerator.homeScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
      // home: const AddParkingScreen(),
    );
  }
}
