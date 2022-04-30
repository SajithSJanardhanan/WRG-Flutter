import 'dart:convert';


import '../configs/api_constans.dart';
import '../models/list_res_model.dart';
import 'api_base_helper.dart';

class ApiProviderHome {
  Future<List<ListRespModel>> getUserList() async {
    final response = await ApiBaseHelper().get(ApiConstants.user);
    var respJson = jsonDecode(response) as List;
    List<ListRespModel> data = respJson.map((json) => ListRespModel.fromJson(json)).toList();
    return data;
  }
}