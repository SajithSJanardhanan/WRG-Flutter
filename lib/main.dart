import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wrg/app.dart';
import 'package:wrg/resources/db_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initialize();
  runApp(const App());
}


