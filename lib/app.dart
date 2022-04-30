import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wrg/utitlites/appstyles.dart';

import 'module/splash/splash_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateTitle: (BuildContext context) => 'WRG',
      theme: ThemeData(
        backgroundColor: AppColors.whiteColor,
        scaffoldBackgroundColor: AppColors.whiteColor,
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(bodyText2: AppTextStyles.textStyleApp),
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: false,
          backgroundColor: AppColors.whiteColor,
          titleTextStyle: AppTextStyles.textStyleApp.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: const IconThemeData(color: AppColors.textColorMain),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: AppColors.textColorMain)),
      ),
      builder: EasyLoading.init(),
      // Generated AppLocalizations to App
      home: SplashPage(),
    );
  }
}