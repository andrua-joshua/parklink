import 'package:flutter/material.dart';
import 'package:parklink/route.dart';
import 'package:parklink/routes/all_parkings_screen/widget/Items_search_deleget.dart';
import 'package:parklink/routes/all_parkings_screen/widget/all_parkings_screen_widgets.dart';
import 'package:parklink/routes/parkings_screen/widgets/parking_screen_widgets.dart';
import 'package:parklink/utils/app_colors.dart';
import 'package:parklink/utils/app_styles.dart';
import 'package:parklink/utils/buttons.dart';

class ParkingScreen extends StatefulWidget{
  const ParkingScreen({super.key});



  @override
  ParkingScreenState createState() => ParkingScreenState();
}


class ParkingScreenState extends State<ParkingScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
        title: const Text(
          "My Parkings", style: AppStyles.titleBoldWhiteTextStyle,),
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
          padding: const EdgeInsets.symmetric(
            horizontal: 10
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: List.generate(
                    4, (x)=> const UnitUserParkingItem()),
                )),
              const SizedBox(height: 3,),
              DSolidButton(
                label: "Add Parking", 
                btnHeight: 45, 
                bgColor: AppColors.primaryColor, 
                borderRadius: 20, 
                textStyle: AppStyles.normalWhiteTextStyle, 
                onClick: ()=> Navigator.pushNamed(
                  context, RouteGenerator.addParkingScreen)),
              const SizedBox(height: 4,)
            ],
          ), )),
    );

  }
}