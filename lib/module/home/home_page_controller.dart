import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:wrg/common_comtrollers/base_controller.dart';
import 'package:wrg/models/list_res_model.dart';
import 'package:wrg/models/user_model.dart';
import 'package:wrg/module/user_detail_page/user_detail_page.dart';
import 'package:wrg/resources/api_provider_home.dart';
import 'package:wrg/utitlites/hive_Boxes.dart';

class HomePageController extends BaseController {

  var userList = List<ListRespModel>.empty().obs;
  var userFilterList = List<ListRespModel>.empty().obs;
  RxBool isLoadingList = true.obs;
  var status = ''.obs;
  RxBool isLoadingSuccess = true.obs;
  final _apiProvider = ApiProviderHome();
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    getUserList();
    super.onInit();
  }

  @override
  void dispose() {
    isLoadingList.close();
    status.close();
    isLoadingSuccess.close();
    super.dispose();
  }

  getUserList() async {
    try {
      isLoadingList.value = true;
      userList.clear();
      var hiveBox = await Hive.openBox(HiveBoxes.home);
      var response = await _apiProvider.getUserList();
     if(response.isNotEmpty) {
       await hiveBox.clear();
       response.forEach((element) {
         element.addressConcated="Address : " +element.address!.street!+" , "+element.address!.suite!+" , "+element.address!.city!;
         if(element.company != null) {
           element.companyConcated="Company name : "+element.company!.name! ;
         }

       });
       await hiveBox.addAll(response);
       userList.addAll(List<ListRespModel>.from(hiveBox
           .toMap()
           .values
           .toList()));
       userFilterList.value = userList;
     }
      isLoadingList.value = false;
      isLoadingSuccess.value = true;
    } catch (e) {
      status.value = e.toString();
      isLoadingSuccess.value = false;
    }
  }

  void gotoDetail(int index) {
    Get.to(() => UserDetailsPage(), arguments: userFilterList[index]);
  }

 void searchUser(String filter) async {
   var hiveBox = await Hive.openBox(HiveBoxes.home);
   userList.clear();
   userList.addAll(List<ListRespModel>.from(hiveBox.toMap().values.toList()));
    if(filter.isNotEmpty){
      userFilterList.value =  userList.where((element) => element.name.toString().toLowerCase().contains(filter)).toList();
    } else {
      userFilterList.value = userList;
    }
  }
}