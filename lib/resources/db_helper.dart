
import 'package:hive_flutter/hive_flutter.dart';

import '../models/list_res_model.dart';
import '../utitlites/hive_Boxes.dart';

class DbHelper {
  static Future initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ListRespModelAdapter());
   // await Hive.openBox<ListRespModel>(HiveBoxes.home);
    return;
  }

  static Box<ListRespModel> homeBox() {
    return Hive.box<ListRespModel>(HiveBoxes.home);
  }

  static close() {
    Hive.close();
  }
}