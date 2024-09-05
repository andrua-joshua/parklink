import 'package:flutter/material.dart';
import 'package:parklink/route.dart';
import 'package:parklink/routes/home_screen/widgets/home_screen_widgets.dart';
import 'package:parklink/utils/app_colors.dart';
import 'package:parklink/utils/app_styles.dart';
import 'package:parklink/utils/buttons.dart';

class ParkingDetailsScreen extends StatefulWidget{
  bool isMyParking;
  ParkingDetailsScreen({super.key, this.isMyParking = false});



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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "Venus Parking Vls", style: AppStyles.titleBoldWhiteTextStyle,),
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
              const Text("2 Slots left", style: AppStyles.bigPrimaryTextStyle,),
              const SizedBox(height: 10,),
              !widget.isMyParking? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:DSolidButton(
                  label: "Book now", 
                  btnHeight: 45, 
                  bgColor: AppColors.primaryColor, 
                  borderRadius: 16, 
                  textStyle: AppStyles.normalWhiteTextStyle, 
                  onClick: (){})):
              LayoutBuilder(
                builder: (context, constraints) {
                  double width = constraints.maxWidth*0.46;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width,
                        child:DSolidButton(
                        label: "Remove", 
                        btnHeight: 45, 
                        bgColor: Colors.red, 
                        borderRadius: 20, 
                        textStyle: AppStyles.normalWhiteTextStyle, 
                        onClick: (){})),

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
    );
  }
}