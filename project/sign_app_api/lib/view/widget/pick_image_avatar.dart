import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sign_app_api/control/sign_up_control.dart';

class PickImageAvatar extends StatelessWidget {
  const PickImageAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControl control = Get.put(SignUpControl());
    double w = MediaQuery.of(context).size.width;
    return GetBuilder<SignUpControl>(
        init: SignUpControl(),
        builder: (c) {
          return SizedBox(
            height: w * .40,
            width: w * .40,
            child: control.profImage == null
                ? CircleAvatar(
                    // radius: 100,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage:
                        const AssetImage('assets/images/person.jpg'),

                    child: Stack(
                      children: [
                        Positioned(
                          bottom: w * .012,
                          right: w * .22,
                          child: InkWell(
                            onTap: () async {},
                            child: Container(
                              height: w * .11,
                              width: w * .11,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade400,
                                border: Border.all(
                                    color: Colors.white, width: w * .007),
                                borderRadius: BorderRadius.circular(w * .11),
                              ),
                              child: InkWell(
                                onTap: () {
                                  ImagePicker()
                                      .pickImage(source: ImageSource.gallery)
                                      .then(
                                          (v) => control.uploadProfileImage(v));
                                },
                                child: const Icon(
                                  Icons.camera_alt_sharp,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : CircleAvatar(
                    backgroundImage: FileImage(File(control.profImage!.path)),
                  ),
          );
        });
  }
}
