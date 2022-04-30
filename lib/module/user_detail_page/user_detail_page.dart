import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wrg/module/user_detail_page/user_detail_controller.dart';

import '../../utitlites/image_view.dart';

class  UserDetailsPage extends StatelessWidget {
    UserDetailsPage({Key? key}) : super(key: key);
  final userDetailController = Get.put(UserDetailController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Details'),
        ),
        body: SizedBox(
          height: 500,
          width: double.infinity,
          child: Card(
            elevation: 10,
            color: Colors.blueGrey,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  userDetailController.userData.profileImage != null ?
                  Center(child:  ProfilePicWidget(
                    profileImage: userDetailController.userData.profileImage ?? "",
                    placeHolderImage:
                    'assets/images/avatar.png',
                    height: 80,
                    width: 80,
                  ),) : const SizedBox(),
                  const SizedBox(height: 20,),
                  userDetailController.userData.name != null ?
                  Text("Name : "+userDetailController.userData.name!,style: const TextStyle(color: Colors.white,fontSize: 20),) : const SizedBox(),
                  const SizedBox(height: 10),
                  userDetailController.userData.email != null ?
                  Text("Email : "+userDetailController.userData.email!,style: const TextStyle(color: Colors.white,fontSize: 15),): const SizedBox(),
                  const SizedBox(height: 10),
                  userDetailController.userData.addressConcated != null ?
                  Text(userDetailController.userData.addressConcated??"",style: const TextStyle(color: Colors.white,fontSize: 15),): const SizedBox(),
                  const SizedBox(height: 10),
                  userDetailController.userData.phone != null ?
                  Text("Phone : "+userDetailController.userData.phone!,style: const TextStyle(color: Colors.white,fontSize: 15),): const SizedBox(),
                  userDetailController.userData.phone != null ? const SizedBox(height: 10) : const SizedBox(),
                  userDetailController.userData.website != null ?
                  Text("Website : "+userDetailController.userData.website!,style: const TextStyle(color: Colors.white,fontSize: 15),): const SizedBox(),
                  const SizedBox(height: 10),
                  userDetailController.userData.companyConcated != null ?
                  Text(userDetailController.userData.companyConcated??"",style: const TextStyle(color: Colors.white,fontSize: 15),): const SizedBox(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
