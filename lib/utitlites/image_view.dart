import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ProfilePicWidget extends StatelessWidget {

  final String profileImage;
  final placeHolderImage;
  bool imagePicker;
  String pickedImage;
  double? height;
  double? width;

  ProfilePicWidget({Key? key,
    required this.profileImage,
    required this.placeHolderImage,
    this.height = 100,
    this.width = 100,
    this.imagePicker = false,
    this.pickedImage = ""
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(width!),
          child: Container(
              decoration:  const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  backgroundBlendMode:
                  BlendMode.hardLight,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 6.0,
                      spreadRadius: 1.0,
                    )
                  ]),
              child: imagePicker ? Image.file(File(pickedImage),fit: BoxFit.cover,height:  height, width: width,) :
              CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: profileImage ,
                  errorWidget: (context, url, error) {
                    return  Image(image:AssetImage(placeHolderImage), fit: BoxFit.fill,);},
                  placeholder: (context, url) {
                    return Image(image:AssetImage(placeHolderImage), fit: BoxFit.fill,);
                  }))
      ),
    );
  }
}
