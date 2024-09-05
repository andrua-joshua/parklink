import 'package:flutter/material.dart';
import 'package:parklink/routes/all_parkings_screen/widget/Items_search_deleget.dart';
import 'package:parklink/routes/all_parkings_screen/widget/all_parkings_screen_widgets.dart';
import 'package:parklink/utils/app_colors.dart';
import 'package:parklink/utils/app_styles.dart';

class AllParkingsScreen extends StatefulWidget{
  const AllParkingsScreen({super.key});


  @override
  AllParkingsScreenState createState() => AllParkingsScreenState();

}


class AllParkingsScreenState extends State<AllParkingsScreen>{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "All Parkings", style: AppStyles.titleBoldWhiteTextStyle,),
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
                7, (x)=> const UnitParkingItem()),
            ),
          ))),
    );
  } 
}