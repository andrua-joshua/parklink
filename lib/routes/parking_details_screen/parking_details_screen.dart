import 'package:flutter/material.dart';
import 'package:parklink/module/parking.dart';
import 'package:parklink/module/user.dart';
import 'package:parklink/providers/parking_provider.dart';
import 'package:parklink/providers/user_provider.dart';
import 'package:parklink/route.dart';
import 'package:parklink/routes/home_screen/widgets/home_screen_widgets.dart';
import 'package:parklink/routes/parking_details_screen/widgets/parking_details_widget.dart';
import 'package:parklink/utils/app_colors.dart';
import 'package:parklink/utils/app_styles.dart';
import 'package:parklink/utils/buttons.dart';
import 'package:provider/provider.dart';

class ParkingDetailsScreen extends StatefulWidget{
  bool isMyParking;
  final Parking parking;
  ParkingDetailsScreen({super.key, this.isMyParking = false, required this.parking});



  @override
  ParkingDetailsScreenState createState() => ParkingDetailsScreenState();

}


class ParkingDetailsScreenState extends State<ParkingDetailsScreen>{

 int currentSelected = 0;
 final List<String> types = [
    "Bike", "Cars", "Trucks"
  ]; 

  final List<String> imgs = [
    "assets/motorbike.png", 
    "assets/car.png", 
    "assets/box-truck.png"
  ]; 

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserProvider, ParkingProvider>(
      builder: (context, valueU, valueP, child)
         => Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          widget.parking.title, style: AppStyles.titleBoldWhiteTextStyle,),
      ),


      body: SafeArea(
        child: Padding(
          padding:  const EdgeInsets.symmetric(
            horizontal: 10
          ),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              const Text("Your Vehicle Type", style: AppStyles.normalGreyTextStyle,),
                  const SizedBox(height: 15,),
                  SizedBox(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          3, (x)=> Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: UnitCarType(
                              isSelected: x==currentSelected,
                              img: imgs[x],
                              onClick: (){setState(() {
                                currentSelected = x;
                              });}, label: types[x]),)),
                      ),
                    ),
                  ),

              const SizedBox(height: 10,),
              Expanded(child: Container(
                constraints:  const BoxConstraints.expand(),
                decoration: BoxDecoration(
                  color: AppColors.softWhiteColor,
                  borderRadius: BorderRadius.circular(15)
                ),
              )),
              const SizedBox(height: 10,),
              Text("${
                currentSelected ==0? widget.parking.bikeSlots
                :currentSelected == 1? widget.parking.carSlots: 
                widget.parking.truckSlots
              } Slots left", style: AppStyles.bigPrimaryTextStyle,),
              const SizedBox(height: 10,),
              !widget.isMyParking? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:DSolidButton(
                  label: "Book now", 
                  btnHeight: 45, 
                  bgColor: AppColors.primaryColor, 
                  borderRadius: 16, 
                  textStyle: AppStyles.normalWhiteTextStyle, 
                  onClick: ()=> showModalBottomSheet(
                    isScrollControlled: true,
                    context: context, 
                    builder: (context)=> MakeBookingBottomSheet(slotType: types[currentSelected])))):
              LayoutBuilder(
                builder: (context, constraints) {
                  double width = constraints.maxWidth*0.46;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width,
                        child: isLoading?
                        Center(
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: CircularProgressIndicator(),),
                        )
                        : DSolidButton(
                        label: "Remove", 
                        btnHeight: 45, 
                        bgColor: Colors.red, 
                        borderRadius: 20, 
                        textStyle: AppStyles.normalWhiteTextStyle, 
                        onClick: ()async{
                          setState(() {
                            isLoading= true;
                          });
                          await valueP.parkingRespository.deleteParking(parkingId: widget.parking.id);
                          final user = await valueU.authRepository.fetchUser(userId: valueU.user!.id);
                          if(user!=null){
                            valueU.user = user;
                            valueU.notifyAll();
                          }
                          
                          setState(() {
                            isLoading= true;
                          });
                          Navigator.pop(context);
                        })),

                      SizedBox(
                        width: width,
                        child:DSolidButton(
                        label: "Bookings", 
                        btnHeight: 45, 
                        bgColor: AppColors.primaryColor, 
                        borderRadius: 20, 
                        textStyle: AppStyles.normalWhiteTextStyle, 
                        onClick: ()=> Navigator.pushNamed(context, RouteGenerator.bookingsScreen, arguments: true)))
                    ],
                  );
                },),
                const SizedBox(height: 20,)
            ],
          ),)),
    ),);
  }
}