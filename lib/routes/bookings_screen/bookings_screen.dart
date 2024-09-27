import 'package:flutter/material.dart';
import 'package:parklink/module/parking.dart';
import 'package:parklink/providers/user_provider.dart';
import 'package:parklink/route.dart';
import 'package:parklink/routes/all_parkings_screen/widget/Items_search_deleget.dart';
import 'package:parklink/routes/all_parkings_screen/widget/all_parkings_screen_widgets.dart';
import 'package:parklink/routes/bookings_screen/widgets/booking_screen_widgets.dart';
import 'package:parklink/utils/app_colors.dart';
import 'package:parklink/utils/app_styles.dart';
import 'package:parklink/utils/buttons.dart';
import 'package:provider/provider.dart';

class BookingsScreen extends StatefulWidget{
  bool isUserParking;
  Parking? parking;
  BookingsScreen({super.key, this.isUserParking = false, parking});


  @override
  BookingsScreenState createState() => BookingsScreenState();

}


class BookingsScreenState extends State<BookingsScreen>{

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, value, child)
       => Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: widget.isUserParking,
        title: Text(
          widget.isUserParking?"${widget.parking!.title} Bookings": "My Bookings", style: AppStyles.titleBoldWhiteTextStyle,),
        actions: [
          IconButton(
            onPressed: (){
              showSearch(context: context, delegate: ItemsSearchDeleget());
            }, 
            icon: const Icon(Icons.search, color: Colors.white,))
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: value.user!=null? SingleChildScrollView(
            child: Column(
              children: List.generate(
                widget.isUserParking?
                widget.parking!.bookings.length
                : value.user!.bookings.length , (x)=> UnitBookingItem(
                  booking: widget.isUserParking?
                widget.parking!.bookings[x]
                : value.user!.bookings[x],
                )),
            ),
          ):Center(
            child: DSolidButton(
              label: "Login", 
              btnHeight: 45, 
              bgColor: AppColors.primaryColor, 
              borderRadius: 20, 
              textStyle: AppStyles.normalWhiteTextStyle, 
              onClick: ()=> Navigator.pushNamed(context, RouteGenerator.loginScreen)),
          )) ),
    ),);
  }
}