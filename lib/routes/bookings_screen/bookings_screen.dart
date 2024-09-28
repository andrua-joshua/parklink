import 'package:flutter/material.dart';
import 'package:parklink/module/booking.dart';
import 'package:parklink/module/parking.dart';
import 'package:parklink/providers/booking_provider.dart';
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
    return Consumer2<UserProvider, BookingProvider>(
      builder: (context, value, value2, child)
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
            child: FutureBuilder<List<Booking>>(
              future: widget.isUserParking? 
                value2.bookingRepository.fetchParkingBookings(parkingId: widget.parking?.id??5)
                :value2.bookingRepository.fetchUserBookings(userId: value.user!.id),
              builder: (context, snapshot) {
                
                if(snapshot.hasData){
                  final data = snapshot.data ;
                  print("::::DDDDDDDDD   $data :::: ${widget.parking}");
                  return Column(
                    children: List.generate(
                      data!.length , (x)=> UnitBookingItem(
                        booking: data[x],
                      )),
                  );

                }


                if(snapshot.hasError){
                  return const Center(child:Text("Failed to fetch data", style: AppStyles.normalGreyTextStyle,));
                }

                return const Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            )

            
            
            
            ,
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