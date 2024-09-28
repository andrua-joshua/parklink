import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

class MakeBookingBottomSheet extends StatefulWidget{
  final String slotType;
  final Parking parking;
  const MakeBookingBottomSheet({super.key, required this.slotType, required this.parking});


  @override
  MakeBookingBottomSheetState createState ()=> MakeBookingBottomSheetState();
}


class MakeBookingBottomSheetState extends State<MakeBookingBottomSheet>{


  late final TextEditingController slotsCountController;
  late final TextEditingController durationController;


  DateTime? startDate;
  late double  totalCost;


  @override
  void initState() {
    super.initState();

    totalCost = 1.0*(widget.slotType.toLowerCase()== "bike"? 
       widget.parking.bikeNightCost:
       widget.slotType.toLowerCase()== "cars"? 
       widget.parking.bikeNightCost: widget.parking.truckNightCost);
    slotsCountController = TextEditingController(text: "1");
    durationController = TextEditingController(text: "1");
    
    slotsCountController.addListener(
      (){
        setState(() {
          totalCost = 1.0*(widget.slotType.toLowerCase()== "bike"? 
       widget.parking.bikeNightCost* int.parse(slotsCountController.text)* int.parse(durationController.text):
       widget.slotType.toLowerCase()== "cars"? 
       widget.parking.bikeNightCost* int.parse(slotsCountController.text)* int.parse(durationController.text): widget.parking.truckNightCost* int.parse(slotsCountController.text)* int.parse(durationController.text));
        });
      }
    );

    durationController.addListener(
      (){
        setState(() {
          totalCost = 1.0*(widget.slotType.toLowerCase()== "bike"? 
       widget.parking.bikeNightCost* int.parse(slotsCountController.text)* int.parse(durationController.text):
       widget.slotType.toLowerCase()== "cars"? 
       widget.parking.bikeNightCost* int.parse(slotsCountController.text)* int.parse(durationController.text): widget.parking.truckNightCost* int.parse(slotsCountController.text)* int.parse(durationController.text));
        });
      }
    );
  

  }



  @override
  void dispose() {
    slotsCountController.dispose();
    durationController.dispose();
    super.dispose();
  }


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
                unitInfo(label: "Slot Type", value: widget.slotType),
                unitInfo(label: "UnitCost Per Night", value: "5000 ugx"),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                    ),
                    // padding: const EdgeInsets.symmetric(10),

                    child: Row(
                      children: [
                        const Expanded(
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
                            controller: slotsCountController),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 10,),
                  SizedBox(
                    child: Row(
                      children: [
                        const Text(
                            "Start Date",
                            style: AppStyles.normalBlackTextStyle,
                          ),
                          const SizedBox(width: 50,),
                          Expanded( child:TextFormField(
                              enabled: true,
                              readOnly: true,
                              onTap: ()=> showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2050)),
                              decoration:const  InputDecoration(
                                border: InputBorder.none,
                                hintText: "Select date",
                                hintStyle: AppStyles.normalGreyTextStyle
                            ),
                          ))
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                    ),
                    // padding: const EdgeInsets.symmetric(10),

                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Duration (days)",
                            style: AppStyles.normalBlackTextStyle,
                          )),
                        SizedBox(
                          width: 160,
                          child: DSolidTextInputField(
                            hintText: "Number of days", 
                            hintTextStyle: AppStyles.normalGreyTextStyle, 
                            valueTextStyle: AppStyles.normalBlackTextStyle, 
                            bgColor: AppColors.softWhiteColor, 
                            keyboardType: TextInputType.number,
                            borderRadius: 20, 
                            btnHeight: 45, 
                            controller: durationController),
                        )
                      ],
                    ),
                  ),

                  unitInfo(label: "Total Cost", value: "$totalCost ugx"),
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
              makeBooking(context, value, value2);
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


  Future<void> makeBooking(
    BuildContext context,
    UserProvider userProvider, 
    BookingProvider bookingProvider
    ) async{

      if(slotsCountController.text.isEmpty || durationController.text.isEmpty){
        Fluttertoast.showToast(msg: "Fill in valid values please");
        return;
      }else if(int.parse(slotsCountController.text)<1 || int.parse(durationController.text)<1){
        Fluttertoast.showToast(msg: "Fill in values greater than 0");
      }else{

        final res = await bookingProvider.bookingRepository.makeBooking(
          userId: userProvider.user!.id, 
          slotsCount: int.parse(slotsCountController.text), 
          slotsType: widget.slotType, 
          duration: int.parse(durationController.text), 
          unitNightCost: totalCost/int.parse(durationController.text), 
          startDate: startDate?? DateTime.now(), 
          parkingId: widget.parking.id);


        if(res!=null){
          await showDialog(
            context: context, 
            builder: (context)
             => AlertDialog(
              title: const Text("Booking", style: AppStyles.normalBoldBlackTextStyle,),
              content: const Text("the booking fee shall be deducted from your mobile money.", style: AppStyles.smallBlackTextStyle,),
              actions: [
                DSolidButton(
                  label: "Confirm", 
                  btnHeight: 45, 
                  bgColor: AppColors.primaryColor, 
                  borderRadius: 15, 
                  textStyle: AppStyles.normalWhiteTextStyle, 
                  onClick: ()=> Navigator.pop(context))
              ],
             ),);
          Fluttertoast.showToast(msg: "Booking made succesfully");
          Navigator.pop(context);
          // Navigator.pushNamed(context, RouteGenerator.bookingsScreen);
        }else{
          Fluttertoast.showToast(msg: "Booking failed");
        }
      }
        
      

    }
}