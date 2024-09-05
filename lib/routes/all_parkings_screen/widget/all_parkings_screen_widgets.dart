import 'package:flutter/material.dart';
import 'package:parklink/route.dart';
import 'package:parklink/utils/app_colors.dart';
import 'package:parklink/utils/app_styles.dart';

class UnitParkingItem extends StatelessWidget{
  const UnitParkingItem({super.key});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, RouteGenerator.parkingDetailsScreen),
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
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 10,),
                Text(
                  "Nutz parking Av", 
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.normalBoldPrimaryTextStyle,),
                const SizedBox(height: 5,),
                SizedBox(
                  child: Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 5,),
                      Text("Nakawa frontWard", style: AppStyles.normalGreyTextStyle,)
                    ],
                  ),
                )
              ],
            ) )
        ],
      ),
    ));
  }
}