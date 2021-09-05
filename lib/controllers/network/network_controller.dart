import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:connectivity/connectivity.dart';

class NetworkController extends GetxController {
  var connectionStatus = 0.obs;

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _streamSubscription;
  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    ConnectivityResult? result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e);
    }
    return _updateConnectionStatus(result!);
  }

  _updateConnectionStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = 1;
        break;
      case ConnectivityResult.mobile:
        connectionStatus.value = 2;
        break;
      case ConnectivityResult.none:
        connectionStatus.value = 0;
        break;
      default:
        Get.snackbar("Network Error", "Something went wrong!!");
        break;
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }
}
