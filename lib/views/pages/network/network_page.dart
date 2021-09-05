import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/network/network_controller.dart';

// import 'package:get/get.dart';
class NetworkPage extends StatelessWidget {
  const NetworkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NetworkController _controller = Get.find<NetworkController>();

    return Scaffold(
      body: Obx(
        () => (_controller.connectionStatus.value == 1
            ? Center(child: Text("Wifi"))
            : (_controller.connectionStatus.value == 2)
                ? Center(child: Text("Mobile"))
                : Center(child: Text("NoDdata"))),
      ),
    );
  }
}
