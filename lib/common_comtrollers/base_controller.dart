import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';

class BaseController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  final connected = false.obs;

  @override
  void onInit() async {
    super.onInit();
    ConnectivityResult result = await _connectivity.checkConnectivity();
    _checkResult(result);
    _connectivity.onConnectivityChanged.listen(_checkResult);
  }

  void _checkResult(ConnectivityResult result) {
    connected(result != ConnectivityResult.none);
  }
}