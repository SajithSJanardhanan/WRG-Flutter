import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg/module/home/home_page_controller.dart';

import '../../utitlites/appstyles.dart';
import '../../utitlites/image_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final homeController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Home')),
      ),
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child:  Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: TextField(
                    controller: homeController.searchController,
                    onChanged: (searchText) {
                      if (searchText == "" || searchText.length > 1) {
                        homeController.searchUser(searchText);
                      }
                    },
                    decoration: const InputDecoration(
                        hintText: "Search",
                        enabledBorder:  UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.25,
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder:  UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.25,
                            color: Colors.transparent,
                          ),
                        ),
                        suffixIcon: Icon(Icons.search)),),
                ),
              )
          ),
          const SizedBox(height: 20,),
          Obx(() => homeController.isLoadingList.value ?  const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              )) : homeController.userFilterList.isNotEmpty ?Expanded(
              child: ListView.builder(
                itemBuilder: (context, position) {
                  return Material(
                    color: AppColors.whiteColor,
                    child: InkWell(
                      onTap: () {
                        homeController.gotoDetail(position);

                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.only(left: 15, bottom: 15, top: 5, right: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ProfilePicWidget(
                              profileImage: homeController.userFilterList[position].profileImage ?? "",
                              placeHolderImage:
                              'assets/images/avatar.png',
                              height: 60,
                              width: 60,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    homeController.userFilterList[position].name ?? "",
                                    style: const TextStyle(
                                      //fontFamily: FontFamily.poppinsRegular,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    homeController.userFilterList[position].companyConcated ?? "",
                                    style: const TextStyle(
                                      //fontFamily: FontFamily.poppinsRegular,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  );
                },
                shrinkWrap: true,
                itemCount: homeController.userFilterList.length,
                padding: const EdgeInsets.only(bottom: 25),
              )): const Expanded(
              child: Center(
                child: Text('No Data Found'),
              )) )
        ],
      ),
    );
  }
}
