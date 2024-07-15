import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'App-Routes/approutes.dart';
import 'App_Pages/apppages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute:AppRoute.riskassessment,
      getPages: AppPages.appPages,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const (title: 'Flutter Demo Home Page'),
    );
  }
}
