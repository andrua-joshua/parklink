import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parklink/providers/user_provider.dart';
import 'package:parklink/route.dart';
import 'package:parklink/utils/app_colors.dart';
import 'package:parklink/utils/app_styles.dart';
import 'package:parklink/utils/app_text_input_fields.dart';
import 'package:parklink/utils/buttons.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});


  @override
  LoginScreenState createState() => LoginScreenState();

}


class LoginScreenState extends State<LoginScreen>{

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  bool isLoading = false;


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
    return Consumer<UserProvider>(
      builder: (context, value, child)
       => Scaffold(
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
                isLoading?
                const Center(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(),
                  ),
                )
                : DSolidButton(
                  label: "Login", 
                  btnHeight: 45, 
                  bgColor: AppColors.primaryColor, 
                  borderRadius: 15, 
                  textStyle: AppStyles.normalWhiteTextStyle, 
                  onClick: ()async{
                    setState(() {
                      isLoading = true;
                    });

                    if(emailController.text.isNotEmpty
                     && passwordController.text.isNotEmpty){

                        if(validateEmail(emailController.text)){
                          final user = await value.authRepository.login(
                          email: emailController.text, 
                          password: passwordController.text);
                        
                        if(user!=null){
                          value.user = user;
                          value.notifyAll();
                          Navigator.pushNamed(context, RouteGenerator.homeScreen);
                        }
                        }else{
                          Fluttertoast.showToast(msg: "Enter a valid email please");
                        }
                    }else{
                      Fluttertoast.showToast(msg: "Fill in the fields");
                    }


                    setState(() {
                      isLoading = false;
                    });
                    
                  } ),

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
    ),);
  }



    bool validateEmail(String email) {
    String pattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }


}