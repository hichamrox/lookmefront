import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lookmefront/model/offres.dart';

class AuthService {
  Dio dio = new Dio();

  login(name, password) async {
    try {
      return await dio.post('https://flutterauth10.herokuapp.com/authenticate',
          data: {"name": name, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response?.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
    }
  }

  addUser(name, password) async {
    return await dio.post('https://flutterauth10.herokuapp.com/adduser',
        data: {"name": name, "password": password},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  getinfo(token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    return await dio.get('https://flutterauth10.herokuapp.com/getinfo');
  }

  Future<List<Offre>> getOffers() async {
    try {
      Response<String> response =
          await dio.get('https://flutterauth10.herokuapp.com/getOffers');
      print("response:" + response.toString());

      if (response.statusCode == 200) {
        var result = jsonDecode(response.toString()) as List;
        var listOffer = result.map(((e) => Offre.fromJson(e))).toList();

        return listOffer;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      return [];
    }
  }
}
//