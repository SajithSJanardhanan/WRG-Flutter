import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../configs/appconfigs.dart';
import 'app_expections.dart';

class ApiBaseHelper {
  final String _baseUrl = AppConfig.baseUrl;

  final _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    try {
      if (headers != null) {
        _headers.addAll(headers);
      }
      final response =
      await http.get(Uri.parse(_baseUrl + url), headers: _headers);
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> put(String url,
      {Map<String, dynamic>? body, Map<String, String>? headers}) async {
    try {
      if (headers != null) {
        _headers.addAll(headers);
      }
      final response = await http.put(Uri.parse(_baseUrl + url),
          body: json.encode(body), headers: _headers);
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> post(String url, Map params,
      {Map<String, String>? headers}) async {
    try {
      if (headers != null) {
        _headers.addAll(headers);
      }
      print(_headers);
      final response = await http.post(Uri.parse(_baseUrl + url),
          headers: _headers, body: jsonEncode(params));
      return _returnResponse(response);
    } catch(e){
      print(e);
    }
  }

  Future<dynamic> postWithBody(String url, String params,
      {Map<String, String>? headers}) async {
    try {
      if (headers != null) {
        _headers.addAll(headers);
      }
      final response = await http.post(Uri.parse(_baseUrl + url),
          headers: _headers, body: params);
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> patch(String url,
      {Map<String, dynamic>? body, Map<String, String>? headers}) async {
    try {
      if (headers != null) {
        _headers.addAll(headers);
      }
      final response = await http.patch(Uri.parse(_baseUrl + url),
          body: json.encode(body), headers: _headers);
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> delete(String url,
      {Map<String, dynamic>? body, Map<String, String>? headers}) async {
    try {
      if (headers != null) {
        headers.addAll(_headers);
      }
      final response = await http.delete(Uri.parse(_baseUrl + url),
          body: json.encode(body), headers: headers);
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 201:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw FetchDataException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
