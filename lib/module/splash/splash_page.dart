import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wrg/module/splash/splash_page_controller.dart';
import 'package:wrg/utitlites/appstyles.dart';

class SplashPage extends StatelessWidget {
   SplashPage({Key? key}) : super(key: key);
  final splashController = Get.put(SplashPageController());

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child: Text('WRG Test',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.textColorMain),),
      ),
    );
  }
}
