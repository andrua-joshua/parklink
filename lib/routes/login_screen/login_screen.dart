import 'package:flutter/material.dart';
import 'package:parklink/route.dart';
import 'package:parklink/utils/app_colors.dart';
import 'package:parklink/utils/app_styles.dart';
import 'package:parklink/utils/app_text_input_fields.dart';
import 'package:parklink/utils/buttons.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});


  @override
  LoginScreenState createState() => LoginScreenState();

}


class LoginScreenState extends State<LoginScreen>{

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final GlobalKey<FormState> key = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }


  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle:  true,
        title: const Text(
          "Login", style: AppStyles.titleBoldWhiteTextStyle,),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Form(
              child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70,),
                const Text("Welcome back to Parklink.", style: AppStyles.bigBoldBlackTextStyle,),
                const Text("Please use the credentialds that you used to create your account with.", style: AppStyles.normalGreyTextStyle,),
                const SizedBox(height: 50,),
                DSolidTextInputField(
                  hintText: "Email", 
                  hintTextStyle: AppStyles.normalGreyTextStyle, 
                  valueTextStyle: AppStyles.normalBlackTextStyle, 
                  bgColor: AppColors.softWhiteColor, 
                  borderRadius: 15, 
                  btnHeight: 45, 
                  controller: emailController),
                const SizedBox(height: 20,),
                DSolidTextInputField(
                  hintText: "Password", 
                  hintTextStyle: AppStyles.normalGreyTextStyle, 
                  valueTextStyle: AppStyles.normalBlackTextStyle, 
                  bgColor: AppColors.softWhiteColor, 
                  borderRadius: 15, 
                  obscureText: true,
                  btnHeight: 45, 
                  controller: passwordController),
                const SizedBox(height: 40,),
                DSolidButton(
                  label: "Login", 
                  btnHeight: 45, 
                  bgColor: AppColors.primaryColor, 
                  borderRadius: 15, 
                  textStyle: AppStyles.normalWhiteTextStyle, 
                  onClick: ()=> Navigator.pushNamed(context, RouteGenerator.homeScreen) ),

                const SizedBox(height: 20,),
                DOutlinedButton(
                  label: "Signup", 
                  btnHeight: 45, 
                  borderColor: AppColors.primaryColor, 
                  borderRadius: 15, 
                  textStyle: AppStyles.normalBlackTextStyle, 
                  onClick: ()=> Navigator.pushNamed(context, RouteGenerator.signUpScreen) )
              ],
            )),
          ),)),
    );
  }

}