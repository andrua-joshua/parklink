import 'package:flutter/material.dart';
import 'package:parklink/routes/bookings_screen/bookings_screen.dart';
import 'package:parklink/routes/home_screen/home_screen.dart';
import 'package:parklink/routes/parkings_screen/parking_screen.dart';

class NavigatorScreen extends StatefulWidget{
  const NavigatorScreen({super.key});


  @override
  NavigatorScreenState createState ()=> NavigatorScreenState();


}



class NavigatorScreenState extends State<NavigatorScreen>{


  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: index==0? const HomeScreen():
        index == 1? BookingsScreen()
        : const ParkingScreen(),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (x){
          setState(() {
            index = x;
          });
        },
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home)),
          BottomNavigationBarItem(
            label: "Bookings",
            icon: Icon(Icons.book_outlined)),
          BottomNavigationBarItem(
            label: "Parkings",
            icon: Icon(Icons.car_repair_outlined)),
        ]),
    );
  }
}