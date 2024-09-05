import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_app_api/control/sign_up_control.dart';
import 'package:sign_app_api/core/functions/valid_input.dart';
import 'package:sign_app_api/view/screen/sign_in.dart';
import 'package:sign_app_api/view/widget/custom_button_auth.dart';
import 'package:sign_app_api/view/widget/custom_loading.dart';
import 'package:sign_app_api/view/widget/custom_text.dart';
import 'package:sign_app_api/view/widget/custom_text_form_auth.dart';
import 'package:sign_app_api/view/widget/pick_image_avatar.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpControl());

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: GetBuilder<SignUpControl>(
        init: SignUpControl(),
        builder: (control) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: w * .15),
            child: Form(
              key: control.formstate,
              child: ListView(
                children: [
                  //image
                  const PickImageAvatar(),
                  SizedBox(height: h * .02),
                  CustomTextFormAuth(
                      hinttext: 'Your user name',
                      labeltext: 'User name',
                      iconData: Icons.person,
                      mycontroller: control.userName,
                      valid: (val) {
                        return validInput(val!, 5, 100, 'username');
                      }),
                  SizedBox(height: h * .02),
                  CustomTextFormAuth(
                      hinttext: 'Your email',
                      labeltext: 'Email',
                      iconData: Icons.email_outlined,
                      mycontroller: control.email,
                      valid: (val) {
                        return validInput(val!, 5, 100, 'email');
                      }),
                  SizedBox(height: h * .02),

                  CustomTextFormAuth(
                      hinttext: 'Your phone number',
                      labeltext: 'Phone',
                      iconData: Icons.phone,
                      mycontroller: control.phoneNumber,
                      valid: (val) {
                        return validInput(val!, 5, 100, 'phone');
                      }),
                  SizedBox(height: h * .02),
                  CustomTextFormAuth(
                      hinttext: 'Your password',
                      labeltext: 'Password',
                      iconData: Icons.password,
                      mycontroller: control.pass,
                      valid: (val) {
                        return validInput(val!, 5, 100, 'password');
                      }),
                  SizedBox(height: h * .02),
                  CustomTextFormAuth(
                      hinttext: 'Confirm your password',
                      labeltext: 'Confirm Password',
                      iconData: Icons.password,
                      mycontroller: control.confirmPass,
                      valid: (val) {
                        return validInput(val!, 5, 100, 'password');
                      }),
                  // SizedBox(height: h * .02),

                  SizedBox(height: h * .04),
                  control.loading
                      ? const CustomLoading()
                      : CustomButtonAuth(
                          text: 'Sign Up',
                          onPressed: () async {
                            await control.signUp();
                          }),
                  SizedBox(height: h * .04),
                  InkWell(
                      onTap: () {
                        Get.offAll(() => const SignIn());
                      },
                      child: CustomText(
                        txt: "Already have an account?",
                        fntSz: w * .05,
                        fntWht: FontWeight.w600,
                        txtAlign: TextAlign.center,
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
