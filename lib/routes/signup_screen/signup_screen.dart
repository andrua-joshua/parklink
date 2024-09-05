import 'package:flutter/material.dart';
import 'package:parklink/route.dart';
import 'package:parklink/utils/app_colors.dart';
import 'package:parklink/utils/app_styles.dart';
import 'package:parklink/utils/app_text_input_fields.dart';
import 'package:parklink/utils/buttons.dart';

class SignupScreen extends StatefulWidget{

  const SignupScreen({super.key});


  @override
  SignupScreenState createState () => SignupScreenState();
}




class SignupScreenState extends State<SignupScreen>{



  late final TextEditingController emailController;
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;


  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();

  }



  @override
  void dispose() {
    super.dispose();


    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle:  true,
        title: const Text(
          "Create Account", style: AppStyles.titleBoldWhiteTextStyle,),
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
                const Text("Create your account with us.", style: AppStyles.bigBoldBlackTextStyle,),
                const Text("Please user your real information  to create an account with us.", style: AppStyles.normalGreyTextStyle,),
                const SizedBox(height: 50,),
                DSolidTextInputField(
                  hintText: "User name", 
                  hintTextStyle: AppStyles.normalGreyTextStyle, 
                  valueTextStyle: AppStyles.normalBlackTextStyle, 
                  bgColor: AppColors.softWhiteColor, 
                  borderRadius: 15, 
                  btnHeight: 45, 
                  controller: usernameController),
                const SizedBox(height: 20,),
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
                  btnHeight: 45, 
                  obscureText: true,
                  controller: passwordController),
                const SizedBox(height: 40,),
                DSolidButton(
                  label: "SignUp", 
                  btnHeight: 45, 
                  bgColor: AppColors.primaryColor, 
                  borderRadius: 15, 
                  textStyle: AppStyles.normalWhiteTextStyle, 
                  onClick: ()=> Navigator.pushNamed(context, RouteGenerator.homeScreen) ),

                const SizedBox(height: 20,),
                DOutlinedButton(
                  label: "Login", 
                  btnHeight: 45, 
                  borderColor: AppColors.primaryColor, 
                  borderRadius: 15, 
                  textStyle: AppStyles.normalBlackTextStyle, 
                  onClick: ()=> Navigator.pushNamed(context, RouteGenerator.loginScreen) )
              ],
            )),
          ),)),
    );
  }
}