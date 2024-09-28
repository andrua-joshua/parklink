import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parklink/module/parking.dart';
import 'package:parklink/providers/booking_provider.dart';
import 'package:parklink/providers/parking_provider.dart';
import 'package:parklink/providers/user_provider.dart';
import 'package:parklink/route.dart';
import 'package:parklink/routes/home_screen/widgets/home_screen_widgets.dart';
import 'package:parklink/utils/app_colors.dart';
import 'package:parklink/utils/app_styles.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}


class HomeScreenState extends State<HomeScreen>{


  final List<String> types = [
    "Bike", "Cars", "Trucks"
  ]; 

  final List<String> imgs = [
    "assets/motorbike.png", 
    "assets/car.png", 
    "assets/box-truck.png"
  ]; 

  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer3<UserProvider, BookingProvider, ParkingProvider>(
      builder: (context, valueU, valueB, valueP, child)
       => Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.primaryColor
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  SizedBox(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Row(
                                  children: [
                                    const Text("Your current location", style: AppStyles.smallGreyTextStyle,),
                                    const SizedBox(width: 5,),
                                    GestureDetector(
                                      onTap: (){},
                                      child: const Icon(Icons.keyboard_arrow_down_sharp, color: Colors.white,))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5,),
                              const SizedBox(
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on, color: Colors.white,),
                                    SizedBox(width: 5,),
                                    Text("Junior Avenue, Nakawa", style: AppStyles.normalWhiteTextStyle,),
                                    
                                  ],
                                ),
                              ),
                            ],
                          )),
                          IconButton(
                            onPressed: (){}, 
                            icon: const Icon(Icons.notifications, size: 30, color: Colors.white,))
                      ],
                    ),
                  ),

                const SizedBox(height: 26,),
                const Text("Find best Parking \nspace", style: AppStyles.bigBoldWhiteTextStyle,),
                const SizedBox(height: 6,),
                const SearchWidget()
                  
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                              onClick: (){
                                setState(() {
                                currentSelected = x;
                              });}, label: types[x]),)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25,),
                  SizedBox(
                    child: Row(
                      children: [
                        const Expanded(child:Text("Nearby Parking", style: AppStyles.normalGreyTextStyle,)),
                        IconButton(
                          onPressed: ()=> Navigator.pushNamed(
                            context,RouteGenerator.allParkingsScreen), 
                          icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  SizedBox(
                    child: FutureBuilder<List<Parking>>(
                      future: valueP.parkingRespository.getAllParkings(), 
                      builder: (context, snapshot) {
                        
                        if(snapshot.hasData){
                          final data =  snapshot.data;

                          return data!.length>0? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  data!.length>3? 3: data.length , (x)=> Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: UnitRecentPlaces(
                                      parking: data[x],
                                      onClick: (){
                                        Navigator.pushNamed(context, RouteGenerator.parkingDetailsScreen, arguments: {
                                            "x1": false,
                                            "parking": data[x]
                                          });
                                        }),)),
                              ),
                            ): const SizedBox(height: 70, child: Center(child:Text("No Parking available")),);
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
                  ),

                  const SizedBox(height: 25,),
                  SizedBox(
                    child: Row(
                      children: [
                        const Expanded(child:Text("Recent Places", style: AppStyles.normalGreyTextStyle,)),
                        IconButton(
                          onPressed: ()=> Navigator.pushNamed(
                            context,RouteGenerator.allParkingsScreen), 
                          icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  SizedBox(
                    child: FutureBuilder<List<Parking>>(
                      future: valueP.parkingRespository.getAllParkings(), 
                      builder: (context, snapshot) {
                        
                        if(snapshot.hasData){
                          final data =  snapshot.data;

                          return data!.length>0? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  data!.length>3? 3: data.length , (x)=> Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: UnitRecentPlaces(
                                      parking: data[x],
                                      onClick: (){
                                        Navigator.pushNamed(context, RouteGenerator.parkingDetailsScreen, arguments: {
                                            "x1": false,
                                            "parking": data[x]
                                          });
                                        }),)),
                              ),
                            ):const SizedBox(height: 70, child: Center(child:Text("No Parking available")),);
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
                  ),
                ],
              ),)
          ],
        ))),
    ),);
  }
}