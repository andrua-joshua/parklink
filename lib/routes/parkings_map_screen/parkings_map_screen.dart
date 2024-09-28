import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parklink/module/parking.dart';
import 'package:parklink/repository/parking_respository.dart';

class ParkingsMapScreen extends StatefulWidget{
  const ParkingsMapScreen({super.key});


  @override
  ParkingsMapScreenState createState()=> ParkingsMapScreenState();

}

class ParkingsMapScreenState extends State<ParkingsMapScreen>{

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late final CameraPosition _kGooglePlex;

  late final CameraPosition _kLake;

  
  @override
  void initState() {
    super.initState();

    _kGooglePlex = const CameraPosition(
      target:  LatLng(0.3491314, 32.6621247),
      zoom: 1.4746,
    );
  }
      

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Parking>>(
        future: ParkingRespository().getAllParkings(), 
        builder: (context, snapshot) {
          
          if(snapshot.hasData){
            final data =  snapshot.data;

            return GoogleMap(
              mapType: MapType.hybrid,
              markers: Set<Marker>.from(parkingToMarker(data??[])),
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              
            );
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
      
      
      
    );
  }

  List<Marker> parkingToMarker(List<Parking> parkings)
    => parkings.map(
      (element)=> Marker(
        markerId: MarkerId("${element.id}"),
        infoWindow: InfoWindow(
          title: element.title,
          snippet: element.location
        ))
    ).toList();

}