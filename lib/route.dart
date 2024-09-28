import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parklink/module/parking.dart';
import 'package:parklink/routes/add_parking_screen/add_parking_screen.dart';
import 'package:parklink/routes/all_parkings_screen/all_parkings_screen.dart';
import 'package:parklink/routes/bookings_screen/bookings_screen.dart';
import 'package:parklink/routes/home_screen/home_screen.dart';
import 'package:parklink/routes/login_screen/login_screen.dart';
import 'package:parklink/routes/navigator_screen/navigator_screen.dart';
import 'package:parklink/routes/parking_details_screen/parking_details_screen.dart';
import 'package:parklink/routes/parkings_map_screen/parkings_map_screen.dart';
import 'package:parklink/routes/signup_screen/signup_screen.dart';

class RouteGenerator{

  static const String loginScreen  = "/c";
  static const String signUpScreen = "/signUpScreen";
  static const String homeScreen = "/homeScreen";
  static const String allParkingsScreen = "/allParkingsScreen";
  static const String parkingDetailsScreen = "/parkingDetailsScreen";

  static const String bookingsScreen = "/bookingsScreen";
  static const String addParkingScreen = "/addParkingScreen";

  static const String parkingMapScreen = "/parkingMapScreen";




  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen());
      
      case signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen());

      case addParkingScreen:
        return MaterialPageRoute(
          builder: (_) => const AddParkingScreen());

      case parkingMapScreen:
        return MaterialPageRoute(
          builder: (_) => const ParkingsMapScreen());

      case bookingsScreen:
        bool? arg;
        if(settings.arguments!=Null)
          arg = settings.arguments as bool;
        return MaterialPageRoute(
          builder: (_) => BookingsScreen(isUserParking: arg??false));
      
      case parkingDetailsScreen:
        Map<String, dynamic>? arg;
        if(settings.arguments!=null)
          arg = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) =>  ParkingDetailsScreen(
            isMyParking: arg!['x1'] as bool, parking: arg['parking'] as Parking,));
      
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => const NavigatorScreen());
      
      case allParkingsScreen:
        return MaterialPageRoute(
          builder: (_) => const AllParkingsScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen());
    }
  }

}