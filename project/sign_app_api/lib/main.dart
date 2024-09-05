import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_app_api/core/functions/initial_screen.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: initialScreen(),
    );
  }
}
