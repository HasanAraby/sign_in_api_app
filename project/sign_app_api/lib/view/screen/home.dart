import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_app_api/control/home_control.dart';
import 'package:sign_app_api/core/functions/valid_input.dart';
import 'package:sign_app_api/view/widget/custom_button_auth.dart';
import 'package:sign_app_api/view/widget/custom_loading.dart';
import 'package:sign_app_api/view/widget/custom_text_form_auth.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControl control = Get.put(HomeControl());
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () async {
                await control.logOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: GetBuilder<HomeControl>(
        init: HomeControl(),
        builder: (c) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: w * .15),
            child: control.loading
                ? const CustomLoading()
                : control.noData
                    ? Container()
                    : Form(
                        key: control.formstate,
                        child: ListView(
                          children: [
                            //image
                            CircleAvatar(
                              radius: w * .3,
                              backgroundImage: NetworkImage(control.imgLink!),
                            ),
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
                                hinttext: 'Your location',
                                labeltext: 'Location',
                                iconData: Icons.password,
                                mycontroller: control.location,
                                valid: (val) {
                                  return validInput(val!, 5, 100, 'password');
                                }),
                            SizedBox(height: h * .02),
                            CustomButtonAuth(
                                text: 'Save',
                                onPressed: () async {
                                  await control.edit();
                                }),
                            SizedBox(height: h * .02),
                            CustomButtonAuth(
                                text: 'Delete User',
                                onPressed: () async {
                                  await control.deleteUser();
                                }),
                          ],
                        ),
                      ),
          );
        },
      ),
    );
  }
}
