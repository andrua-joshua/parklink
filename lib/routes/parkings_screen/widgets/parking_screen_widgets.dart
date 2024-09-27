import 'package:flutter/material.dart';
import 'package:parklink/module/parking.dart';
import 'package:parklink/route.dart';
import 'package:parklink/utils/app_colors.dart';
import 'package:parklink/utils/app_styles.dart';

class UnitUserParkingItem extends StatelessWidget{
  final Parking parking;
  const UnitUserParkingItem({super.key, required this.parking});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, RouteGenerator.parkingDetailsScreen, arguments: {
        "x1": true,
        "parking": parking
      }),
      child:Container(
      constraints: const BoxConstraints.expand(height: 100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 247, 246, 246)
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),

      child: Row(
        children: [
          Container(
            constraints: const BoxConstraints.expand(width: 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/map.jpg"))
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
                  parking.title, 
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.normalBoldPrimaryTextStyle,),
                const SizedBox(height: 5,),
                SizedBox(
                  child: Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 5,),
                      Text(parking.location, style: AppStyles.normalGreyTextStyle, maxLines: 1,)
                    ],
                  ),
                ),
                // Expanded(child: SizedBox()),
                // Text(
                //   "12th July, 2024",
                //   style: AppStyles.smallGreyTextStyle,
                // ),
                // const SizedBox(height: 10,)
              ],
            ) ),
            const SizedBox(width: 10,),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${parking.bookings.length}",
                    style: AppStyles.bigBoldPrimaryTextStyle,),
                  const SizedBox(height: 3,),
                  const Text(
                    "Bookings",
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