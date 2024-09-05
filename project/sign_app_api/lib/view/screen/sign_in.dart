import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_app_api/control/sign_in_control.dart';
import 'package:sign_app_api/core/functions/valid_input.dart';
import 'package:sign_app_api/view/screen/sign_up.dart';
import 'package:sign_app_api/view/widget/custom_button_auth.dart';
import 'package:sign_app_api/view/widget/custom_loading.dart';
import 'package:sign_app_api/view/widget/custom_text.dart';
import 'package:sign_app_api/view/widget/custom_text_form_auth.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignInControl());
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: GetBuilder<SignInControl>(
        init: SignInControl(),
        builder: (control) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: w * .15),
            child: Form(
              key: control.formstate,
              child: ListView(
                children: [
                  SizedBox(height: h * .2),
                  CustomTextFormAuth(
                      hinttext: 'Enter your email',
                      labeltext: 'Email',
                      iconData: Icons.email_outlined,
                      mycontroller: control.email,
                      valid: (val) {
                        return validInput(val!, 5, 100, 'email');
                      }),
                  SizedBox(height: h * .02),
                  CustomTextFormAuth(
                      hinttext: 'Enter your password',
                      labeltext: 'Password',
                      iconData: Icons.password,
                      mycontroller: control.pass,
                      valid: (val) {
                        return validInput(val!, 5, 100, 'password');
                      }),
                  SizedBox(height: h * .002),
                  CustomText(
                    txt: 'Forget password?',
                    fntSz: w * .04,
                    fntWht: FontWeight.w400,
                    txtAlign: TextAlign.end,
                  ),
                  SizedBox(height: h * .04),
                  control.loading
                      ? CustomLoading()
                      : CustomButtonAuth(
                          text: 'Sign In',
                          onPressed: () async {
                            await control.signIn();
                          }),
                  SizedBox(height: h * .04),
                  InkWell(
                      onTap: () {
                        Get.offAll(() => const SignUp());
                      },
                      child: CustomText(
                        txt: "Don't have an account?",
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
