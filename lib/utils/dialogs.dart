import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parklink/utils/app_colors.dart';
import 'package:parklink/utils/app_styles.dart';
import 'package:parklink/utils/buttons.dart';

class DDWillPopDialog extends StatelessWidget{
  final Function() exit;
  final Function() cancel;
  final String message;
  const DDWillPopDialog({
    required this.exit,
    required this.cancel,
    required this.message
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // decoration: BoxDecoration(
      //   color: AppColors.softWhiteColor
      // ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10,),


          Text(
            "Exit ParkLink Staff",
            style: AppStyles.bigBoldPrimaryTextStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4,),
          const Divider(thickness: 0.4, color: Colors.grey,),
          const SizedBox(height: 4,),
          Text(
            message,
            style: AppStyles.normalBlackTextStyle,
            textAlign: TextAlign.center,
          ),
          Expanded(child: SizedBox()),
          SizedBox(
            child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 120,
                      child:DSolidButton(
                      label: "Cancel", 
                      btnHeight: 45, 
                      bgColor: AppColors.secondaryColor, 
                      borderRadius: 17, 
                      textStyle: AppStyles.normalWhiteTextStyle, 
                      onClick: ()=> cancel())),
                    
                    SizedBox(
                      width: 120,
                      child: DOutlinedButton(
                      label: "Exit", 
                      btnHeight: 45, 
                      borderColor: AppColors.secondaryColor, 
                      borderRadius: 17, 
                      textStyle: AppStyles.normalBoldGreyTextStyle, 
                      onClick: ()=> exit()))
                  ],
                ),
          ),

          const SizedBox(height: 10,),

        ],
      ),
    );
  }
}