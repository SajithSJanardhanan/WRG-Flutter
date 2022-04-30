import 'package:get/get.dart';
import 'package:wrg/common_comtrollers/base_controller.dart';
import 'package:wrg/models/list_res_model.dart';

class UserDetailController extends BaseController {
  var userData = ListRespModel();
  RxBool isLoadingList = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    if(Get.arguments != null) {
      userData = Get.arguments;
      isLoadingList.value = false;
    }
  }

  @override
  void dispose() {
    isLoadingList.close();
    super.dispose();
  }
}