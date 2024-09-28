import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parklink/module/parking.dart';
import 'package:parklink/route.dart';
import 'package:parklink/utils/app_colors.dart';
import 'package:parklink/utils/app_styles.dart';

class SearchWidget extends StatelessWidget{
  const SearchWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child:Container(
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 6, vertical: 6),
            child: Row(
              children: [
                Icon(Icons.search),
                SizedBox(width: 5,),
                Text("Find parking Area", style: AppStyles.normalGreyTextStyle,)
              ],
            )
        )),
        const SizedBox(width: 20,),
        GestureDetector(
          onTap: ()=>Navigator.pushNamed(context, RouteGenerator.parkingMapScreen),
          child:Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
          ),
          padding: const EdgeInsets.all(10),
          child: const Icon(
            Icons.location_searching_outlined
          ),
        )),
      ],
    );
  }
}



class UnitCarType extends StatefulWidget{
  final Function() onClick;
  final String label;
  final String img;
  final bool isSelected;
  const UnitCarType({
    super.key, required this.onClick, required this.label, required this.isSelected, required this.img});


  @override
  UnitCarTypeState createState() => UnitCarTypeState();
}



class UnitCarTypeState extends State<UnitCarType>{

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> widget.onClick(),
      child:Container(
      height: 120,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(
          width: widget.isSelected? 1.4: 0.4,
          color: widget.isSelected? AppColors.primaryColor:  Colors.grey, ),
        borderRadius: BorderRadius.circular(15)
      ),
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Expanded(child: SizedBox(
            child: Image.asset(widget.img),
          )),
          Text(widget.label,style: AppStyles.normalGreyTextStyle,)
        ],
      ),
    ));
  }
}





class UnitRecentPlaces extends StatefulWidget{
  final Function() onClick;
  final Parking parking;
  const UnitRecentPlaces({
    super.key, required this.onClick, required this.parking});


  @override
  UnitRecentPlacesState createState() => UnitRecentPlacesState();
}



class UnitRecentPlacesState extends State<UnitRecentPlaces>{

  


  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late final CameraPosition _kGooglePlex;

  late final CameraPosition _kLake;

  
  @override
  void initState() {
    super.initState();

    _kGooglePlex = CameraPosition(
      target:  LatLng(widget.parking.lat, widget.parking.lng),
      zoom: 1.4746,
    );
  }


  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> widget.onClick(),
      child:Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(
          color:  Colors.grey, ),
        borderRadius: BorderRadius.circular(15)
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Row(
              children: [
                Expanded(
                  child:Text(
                  widget.parking.title, style: AppStyles.normalBoldPrimaryTextStyle,)),
                const SizedBox(width: 10,),
                const Icon(Icons.arrow_forward_ios_outlined)
              ],
            ),
          ),
          SizedBox(
            child: Row(
              children: [
                const Icon(Icons.location_on),
                const SizedBox(width: 10,),
                Expanded(child:Text(widget.parking.location, style: AppStyles.normalGreyTextStyle,))
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                // image: DecorationImage(
                //   fit: BoxFit.cover,
                //   image: AssetImage("assets/map.jpg"))
              ),

              child: GoogleMap(
                  mapType: MapType.hybrid,
                  markers: {
                    Marker(
                      markerId: MarkerId("${widget.parking.id}"),
                      infoWindow: InfoWindow(
                        title: widget.parking.title,
                        snippet: widget.parking.location
                      ))
                  },
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  
                ),
            ))
        ],
      ),
    ));
  }
}