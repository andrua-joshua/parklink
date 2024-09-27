import 'package:flutter/material.dart';
import 'package:parklink/module/parking.dart';
import 'package:parklink/providers/booking_provider.dart';
import 'package:parklink/providers/parking_provider.dart';
import 'package:parklink/providers/user_provider.dart';
import 'package:parklink/route.dart';
import 'package:parklink/utils/app_colors.dart';
import 'package:parklink/utils/app_styles.dart';
import 'package:parklink/utils/app_text_input_fields.dart';
import 'package:parklink/utils/buttons.dart';
import 'package:provider/provider.dart';

class MakeBookingBottomSheet extends StatelessWidget{
  final String slotType;
  // final Parking parking;
  const MakeBookingBottomSheet({super.key, required this.slotType});


  @override
  Widget build(BuildContext context) {
    return Consumer2<UserProvider, BookingProvider>(
      builder: (context, value, value2, child)
       => Container(
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

      child: value.user!=null? Column(
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
                          Text("Nakawa frontWard", style: AppStyles.normalGreyTextStyle, maxLines: 1,)
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
                unitInfo(label: "Slot Type", value: "$slotType"),
                unitInfo(label: "UnitCost Per Night", value: "5000 ugx"),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                    ),
                    // padding: const EdgeInsets.symmetric(10),

                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Slots Count",
                            style: AppStyles.normalBlackTextStyle,
                          )),
                        SizedBox(
                          width: 160,
                          child: DSolidTextInputField(
                            hintText: "Number of slots", 
                            hintTextStyle: AppStyles.normalGreyTextStyle, 
                            valueTextStyle: AppStyles.normalBlackTextStyle, 
                            bgColor: AppColors.softWhiteColor, 
                            keyboardType: TextInputType.number,
                            borderRadius: 20, 
                            btnHeight: 45, 
                            controller: TextEditingController()),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 10,),
                  SizedBox(
                    child: Row(
                      children: [
                        Text(
                            "Start Date",
                            style: AppStyles.normalBlackTextStyle,
                          ),
                          const SizedBox(width: 50,),
                          Expanded( child:TextFormField(
                              enabled: true,
                              readOnly: true,
                              onTap: ()=> showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2050)),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Select date",
                                hintStyle: AppStyles.normalGreyTextStyle
                            ),
                          ))
                      ],
                    ),
                  ),

                  unitInfo(label: "Total Cost", value: "0 ugx"),
              ],
            ),
          ),
          const SizedBox(height: 15,),
          
          DSolidButton(
            label: "Make Booking", 
            btnHeight: 45, 
            bgColor: AppColors.primaryColor, 
            borderRadius: 20, 
            textStyle: AppStyles.normalWhiteTextStyle, 
            onClick:(){
              Navigator.pop(context);
            }),
          const SizedBox(height: 10,),

        ],
      ): Center(
        child: DSolidButton(
          label: "Login", 
          btnHeight: 45, 
          bgColor: AppColors.primaryColor, 
          borderRadius: 20, 
          textStyle: AppStyles.normalWhiteTextStyle, 
          onClick: ()=> Navigator.pushNamed(context, RouteGenerator.loginScreen)),
      ),
    ),);
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
              style: AppStyles.normalGreyTextStyle,
              textAlign: TextAlign.end,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
          ))
        ],
      ),
    );
}