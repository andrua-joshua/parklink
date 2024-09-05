import 'package:flutter/material.dart';
import 'package:parklink/utils/app_colors.dart';
import 'package:parklink/utils/app_styles.dart';
import 'package:parklink/utils/app_text_input_fields.dart';
import 'package:parklink/utils/buttons.dart';

class AddParkingScreen extends StatefulWidget{
  const AddParkingScreen({super.key});

  @override
  AddParkingScreenState createState() => AddParkingScreenState();

}


class AddParkingScreenState extends State<AddParkingScreen>{

  GlobalKey<FormState> key = GlobalKey<FormState>();


  late final TextEditingController titleController;
  late final TextEditingController carSlotsController;
  late final TextEditingController bikeSlotsController;
  late final TextEditingController truckSlotsController;
  late final TextEditingController carCostController;
  late final TextEditingController bikeCostController;
  late final TextEditingController truckCostController;
  late final TextEditingController longController;
  late final TextEditingController latController;



  @override
  void initState() {
    super.initState();

    titleController = TextEditingController();
    carSlotsController = TextEditingController();
    bikeSlotsController = TextEditingController();
    truckSlotsController = TextEditingController();
    carCostController = TextEditingController();
    bikeCostController = TextEditingController();
    truckCostController = TextEditingController();

    longController = TextEditingController();
    latController = TextEditingController();

  }


  @override
  void dispose() {
    super.dispose();

    titleController.dispose();
    carSlotsController.dispose();
    bikeSlotsController.dispose();
    truckSlotsController.dispose();
    carCostController.dispose();
    truckCostController.dispose();
    bikeCostController.dispose();
    longController.dispose();
    latController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "Add New Parking",
          style: AppStyles.titleBoldWhiteTextStyle,
        ),
      ),



      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40,),
                  const Text(
                    "Here you will be adding new parking slot.",
                    style: AppStyles.normalGreyTextStyle,),
                  const SizedBox(height: 30,),
                  const Text(
                    "Parking Title(name)",
                    style: AppStyles.normalBlackTextStyle,
                  ),
                  const SizedBox(height: 10,),
                  DSolidTextInputField(
                    hintText: "Parking title/name", 
                    hintTextStyle: AppStyles.normalGreyTextStyle, 
                    valueTextStyle: AppStyles.normalBlackTextStyle, 
                    bgColor: Colors.white, 
                    borderRadius: 20, 
                    btnHeight: 45, 
                    controller: titleController),
                  const SizedBox(height: 40,),
                  const Text(
                    "Slots",
                    style: AppStyles.normalBlackTextStyle,
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                    ),
                    padding: const EdgeInsets.all(10),

                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Car Slots",
                            style: AppStyles.normalBlackTextStyle,
                          )),
                        SizedBox(
                          width: 160,
                          child: DSolidTextInputField(
                            hintText: "Car Slots", 
                            hintTextStyle: AppStyles.normalGreyTextStyle, 
                            valueTextStyle: AppStyles.normalBlackTextStyle, 
                            bgColor: AppColors.softWhiteColor, 
                            keyboardType: TextInputType.number,
                            borderRadius: 20, 
                            btnHeight: 45, 
                            controller: carSlotsController),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                    ),
                    padding: const EdgeInsets.all(10),

                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Truck Slots",
                            style: AppStyles.normalBlackTextStyle,
                          )),
                        SizedBox(
                          width: 160,
                          child: DSolidTextInputField(
                            hintText: "Truck Slots", 
                            hintTextStyle: AppStyles.normalGreyTextStyle, 
                            valueTextStyle: AppStyles.normalBlackTextStyle, 
                            bgColor: AppColors.softWhiteColor, 
                            keyboardType: TextInputType.number,
                            borderRadius: 20, 
                            btnHeight: 45, 
                            controller: truckSlotsController),
                        )
                      ],
                    ),
                  ),


                  const SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                    ),
                    padding: const EdgeInsets.all(10),

                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Bike Slots",
                            style: AppStyles.normalBlackTextStyle,
                          )),
                        SizedBox(
                          width: 160,
                          child: DSolidTextInputField(
                            hintText: "Bike Slots", 
                            hintTextStyle: AppStyles.normalGreyTextStyle, 
                            valueTextStyle: AppStyles.normalBlackTextStyle, 
                            bgColor: AppColors.softWhiteColor, 
                            keyboardType: TextInputType.number,
                            borderRadius: 20, 
                            btnHeight: 45, 
                            controller: bikeSlotsController),
                        )
                      ],
                    ),
                  ),


                  const SizedBox(height: 40,),
                  const Text(
                    "Cost Per Night",
                    style: AppStyles.normalBlackTextStyle,
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                    ),
                    padding: const EdgeInsets.all(10),

                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Car Slots Cost",
                            style: AppStyles.normalBlackTextStyle,
                          )),
                        SizedBox(
                          width: 160,
                          child: DSolidTextInputField(
                            hintText: "Car Slots cost", 
                            hintTextStyle: AppStyles.normalGreyTextStyle, 
                            valueTextStyle: AppStyles.normalBlackTextStyle, 
                            bgColor: AppColors.softWhiteColor, 
                            keyboardType: TextInputType.number,
                            borderRadius: 20, 
                            btnHeight: 45, 
                            controller: carCostController),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                    ),
                    padding: const EdgeInsets.all(10),

                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Truck Slots Cost",
                            style: AppStyles.normalBlackTextStyle,
                          )),
                        SizedBox(
                          width: 160,
                          child: DSolidTextInputField(
                            hintText: "Truck Slots Cost", 
                            hintTextStyle: AppStyles.normalGreyTextStyle, 
                            valueTextStyle: AppStyles.normalBlackTextStyle, 
                            bgColor: AppColors.softWhiteColor, 
                            keyboardType: TextInputType.number,
                            borderRadius: 20, 
                            btnHeight: 45, 
                            controller: truckCostController),
                        )
                      ],
                    ),
                  ),


                  const SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                    ),
                    padding: const EdgeInsets.all(10),

                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Bike Slots Cost",
                            style: AppStyles.normalBlackTextStyle,
                          )),
                        SizedBox(
                          width: 160,
                          child: DSolidTextInputField(
                            hintText: "Bike Slots Cost", 
                            hintTextStyle: AppStyles.normalGreyTextStyle, 
                            valueTextStyle: AppStyles.normalBlackTextStyle, 
                            bgColor: AppColors.softWhiteColor, 
                            keyboardType: TextInputType.number,
                            borderRadius: 20, 
                            btnHeight: 45, 
                            controller: bikeCostController),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  DSolidButton(
                    label: "Select location", 
                    btnHeight: 45, 
                    bgColor: AppColors.primaryColor3, 
                    borderRadius: 20, 
                    textStyle: AppStyles.normalWhiteTextStyle, 
                    onClick: (){}),

                  const SizedBox(height: 20,),
                  DSolidButton(
                    label: "Add Parking", 
                    btnHeight: 45, 
                    bgColor: AppColors.primaryColor, 
                    borderRadius: 20, 
                    textStyle: AppStyles.normalWhiteTextStyle, 
                    onClick: (){}),

                  const SizedBox(height: 20,),

                ],
              )),
          ),)),

    );
  }
}