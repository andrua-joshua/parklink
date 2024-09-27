import 'package:flutter/material.dart';
import 'package:parklink/module/booking.dart';
import 'package:parklink/route.dart';
import 'package:parklink/routes/parking_details_screen/parking_details_screen.dart';
import 'package:parklink/utils/app_colors.dart';
import 'package:parklink/utils/app_styles.dart';
import 'package:parklink/utils/buttons.dart';

class UnitBookingItem extends StatelessWidget{
  final Booking booking;
  const UnitBookingItem({super.key, required this.booking});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          showBottomSheet(
            context: context, 
            builder: (context) => BookingDetailsBottomSheet(booking: booking,),);
        },
      child:Container(
      constraints: const BoxConstraints.expand(height: 100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.softWhiteColor
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),

      child: Row(
        children: [
          Container(
            constraints: const BoxConstraints.expand(width: 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white
            ),    
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 10,),
                Text(
                  booking.parkingTitle, 
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.normalBoldPrimaryTextStyle,),
                const SizedBox(height: 5,),
                SizedBox(
                  child: Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 5,),
                      Text(booking.location, style: AppStyles.normalGreyTextStyle, maxLines: 1,)
                    ],
                  ),
                ),
                Expanded(child: SizedBox()),
                Text(
                  booking.startDate,
                  style: AppStyles.smallGreyTextStyle,
                ),
                const SizedBox(height: 10,)
              ],
            ) ),
            const SizedBox(width: 10,),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${booking.slotsCount}",
                    style: AppStyles.bigBoldPrimaryTextStyle,),
                  const SizedBox(height: 3,),
                  Text(
                    booking.slotsType ,
                    style: AppStyles.smallGreyTextStyle,
                  )
                ],
              ),
            ),
            const SizedBox(width: 7,)
        ],
      ),
    ));
  }
}


class BookingDetailsBottomSheet extends StatelessWidget{
  final Booking booking;
  const BookingDetailsBottomSheet({super.key, required this.booking});




  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15)
        )
      ),

      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.softWhiteColor,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              const SizedBox(width: 20,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(height: 10,),
                    Text(
                      booking.parkingTitle, 
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.normalBoldPrimaryTextStyle,),
                    const SizedBox(height: 5,),
                    SizedBox(
                      child: Row(
                        children: [
                          Icon(Icons.location_on),
                          SizedBox(width: 5,),
                          Text(booking.location, style: AppStyles.normalGreyTextStyle, maxLines: 1,)
                        ],
                      ),
                    ),
                  ],
                ))
            ],
          ),
          const SizedBox(height: 10,),
          const Divider(thickness: 1, color: Colors.grey, height: 0.4,),
          const SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                unitInfo(label: "Client name", value: booking.username),
                unitInfo(label: "Client email", value: booking.email),
                unitInfo(label: "Slots Count", value: "${booking.slotsCount}"),
                unitInfo(label: "Slots Type", value: booking.slotsType),
                unitInfo(label: "Duration", value: "${booking.duration} days"),
                unitInfo(label: "Start Date", value: booking.startDate),
                unitInfo(label: "Total Cost", value: "${booking.unitNightCost*booking.duration}ugx"),
              ],
            ),
          ),
          const SizedBox(height: 15,),
          DSolidButton(
            label: "Done", 
            btnHeight: 45, 
            bgColor: AppColors.primaryColor, 
            borderRadius: 20, 
            textStyle: AppStyles.normalWhiteTextStyle, 
            onClick:()=> Navigator.pop(context)),
          const SizedBox(height: 10,),

        ],
      ),
    );
  }

  Widget unitInfo({
    required String label,
    required String value
  })
    => Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              label,
              style: AppStyles.normalBlackTextStyle,
          ),

          const SizedBox(width: 10,),
          Expanded(
            child: Text(
              value,
              style: AppStyles.normalBlackTextStyle,
              textAlign: TextAlign.end,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
          ))
        ],
      ),
    );
}