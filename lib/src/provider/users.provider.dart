import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nuna_app_front/src/models/response_api.dart';
import '../api/environment.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class UsersProvider{

  String _url = Environment.API_NUNA;
  String _api = '/api/users';

  BuildContext? context;

  Future init(BuildContext context) async {
    this.context = context;
  }

  Future<ResponseApi?> create(User user) async { 
    try{
      Uri url = Uri.http(_url, '$_api/create');
    String bodyParams = json.encode(user);
    Map<String, String> headers = {
      'content-type' : 'application/json'
    };
    final res = await http.post(url, headers: headers, body: bodyParams);
    final data = json.decode(res.body);
    ResponseApi responseApi = ResponseApi.fromJson(data);
    return responseApi;
    }
    catch(e){
      print('Error: $e');
      return null;
    }
  }

  Future<ResponseApi?> login(String email, String password) async {
    try{
      Uri url = Uri.http(_url, '$_api/login');
    String bodyParams = json.encode({
      'email' : email,
      'password' : password
    });
    Map<String, String> headers = {
      'content-type' : 'application/json'
    };
    final res = await http.post(url, headers: headers, body: bodyParams);
    final data = json.decode(res.body);
    ResponseApi responseApi = ResponseApi.fromJson(data);
    return responseApi;
    }
    catch(e){
      print('Error: $e');
      return null;
    }
  }
}