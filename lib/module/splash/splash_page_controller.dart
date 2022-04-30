import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wrg/common_comtrollers/base_controller.dart';
import 'package:wrg/module/home/home_page.dart';

class SplashPageController extends BaseController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    gotoHome();
  }

  void gotoHome() {
    Timer(const Duration(seconds: 2), () {
        gotHomePage();

    });
  }

  void gotHomePage() {
    Navigator.of(Get.context!).pushReplacement(MaterialPageRoute<void>(
        builder: (BuildContext context) => HomePage()));
  }
}