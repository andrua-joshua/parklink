import 'package:flutter/material.dart';
import 'package:parklink/routes/all_parkings_screen/widget/Items_search_deleget.dart';
import 'package:parklink/routes/all_parkings_screen/widget/all_parkings_screen_widgets.dart';
import 'package:parklink/routes/bookings_screen/widgets/booking_screen_widgets.dart';
import 'package:parklink/utils/app_colors.dart';
import 'package:parklink/utils/app_styles.dart';

class BookingsScreen extends StatefulWidget{
  bool isUserParking;
  BookingsScreen({super.key, this.isUserParking = false});


  @override
  BookingsScreenState createState() => BookingsScreenState();

}


class BookingsScreenState extends State<BookingsScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: widget.isUserParking,
        title: Text(
          widget.isUserParking?"Parking Booking": "My Bookings", style: AppStyles.titleBoldWhiteTextStyle,),
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
          child:SingleChildScrollView(
            child: Column(
              children: List.generate(
                7, (x)=> const UnitBookingItem()),
            ),
          ))),
    );
  }
}