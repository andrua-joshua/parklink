import 'package:flutter/material.dart';
import 'package:parklink/module/parking.dart';
import 'package:parklink/providers/parking_provider.dart';
import 'package:parklink/routes/all_parkings_screen/widget/Items_search_deleget.dart';
import 'package:parklink/routes/all_parkings_screen/widget/all_parkings_screen_widgets.dart';
import 'package:parklink/utils/app_colors.dart';
import 'package:parklink/utils/app_styles.dart';
import 'package:provider/provider.dart';

class AllParkingsScreen extends StatefulWidget{
  const AllParkingsScreen({super.key});


  @override
  AllParkingsScreenState createState() => AllParkingsScreenState();

}


class AllParkingsScreenState extends State<AllParkingsScreen>{



  @override
  Widget build(BuildContext context) {
    return Consumer<ParkingProvider>(
      builder: (context, valueP, child)
       => Scaffold(
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
          child:  FutureBuilder<List<Parking>>(
              future: valueP.parkingRespository.getAllParkings(), 
              builder: (context, snapshot) {
                
                if(snapshot.hasData){
                  final data =  snapshot.data;

                  return data!.length>0? SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                           data!.length , (x)=> Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: UnitParkingItem(
                              parking: data[x],
                              ),)),
                      ),
                    ): SizedBox(height: 70, child: Center(child:Text("No Parking available")),);
                }

                if(snapshot.hasError){
                  return const SizedBox(height: 70, child: Center(child:Text("Failed to fetch Parkings")),);
                }



                return const Center(
                  child: SizedBox(
                    height: 40, width: 40,
                    child: CircularProgressIndicator(),
                    ),
                );
              },)

          
          
          )),
    ),);
  } 
}