import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../views/pages/network/network_page.dart';
import '../../controllers/network/network_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Connectivity',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: NetworkBinding(),
      home: NetworkPage(),
    );
  }
}
