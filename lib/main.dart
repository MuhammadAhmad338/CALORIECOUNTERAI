import 'package:calorie_counter_ai/Bindings/initialBindingsImplementation.dart';
import 'package:calorie_counter_ai/features/dashboard/View/dashboard.dart';
import 'package:calorie_counter_ai/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: Const.appname,
        debugShowCheckedModeBanner: false,
        initialBinding: InitialbindingsImplementation(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const DashboardScreen());
  }
}
