import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lookmefront/model/adress.dart';
import 'package:lookmefront/model/chat.dart';
import 'package:lookmefront/model/favori.dart';
import 'package:lookmefront/model/offres.dart';
import 'package:lookmefront/model/order.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Dio dio = new Dio();

  login(email, password) async {
    try {
      return await dio.post('https://flutterauth10.herokuapp.com/authenticate',
          data: {"email": email, "password": password},
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

  addUser(email, name, password) async {
    return await dio.post('https://flutterauth10.herokuapp.com/adduser',
        data: {"email": email, "name": name, "password": password},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  updatePassword(id, password) async {
    dio.options.queryParameters['id'] = id;
    return await dio.patch('https://flutterauth10.herokuapp.com/updatePassword',
        data: {"password": password},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  updateEmail(id, email) async {
    dio.options.queryParameters['id'] = id;
    return await dio.patch('https://flutterauth10.herokuapp.com/updateEmail',
        data: {"email": email},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  updateName(id, name) async {
    dio.options.queryParameters['id'] = id;
    return await dio.patch('https://flutterauth10.herokuapp.com/updateName',
        data: {"name": name},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  updateImage(id, image) async {
    dio.options.queryParameters['id'] = id;
    return await dio.patch('https://flutterauth10.herokuapp.com/updateName',
        data: {"image": image},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  addOffer(id, title, description, cost, size, morphology, height, category,
      image) async {
    return await dio.post('https://flutterauth10.herokuapp.com/addOffer',
        data: {
          "id": id,
          "title": title,
          "description": description,
          "cost": cost,
          "size": size,
          "morphology": morphology,
          "height": height,
          "category": category,
          "image": image
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  addOrder(userId, cost, days, offerId) async {
    return await dio.post('https://flutterauth10.herokuapp.com/addOrder',
        data: {
          "userId": userId,
          "cost": cost,
          "days": days,
          "offerId": offerId
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  addComment(comment, evaluation, commentatorId, offerId) async {
    return await dio.post('https://flutterauth10.herokuapp.com/addComment',
        data: {
          "comment": comment,
          "evaluation": evaluation,
          "commentatorId": commentatorId,
          "offerId": offerId
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  addAdress(userId, adress, cp, city) async {
    return await dio.post('https://flutterauth10.herokuapp.com/addAdress',
        data: {"id": userId, "adress": adress, "cp": cp, "city": city},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  deleteAdress(id) async {
    return await dio.delete('https://flutterauth10.herokuapp.com/deleteAdress',
        data: {"id": id},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  addChat(sellerId, costumerId, orderId, image, title) async {
    return await dio.post('https://flutterauth10.herokuapp.com/addChat',
        data: {
          "sellerId": sellerId,
          "costumerId": costumerId,
          "orderId": orderId,
          "image": image,
          "title": title
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  getinfo(token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    return await dio.get('https://flutterauth10.herokuapp.com/getinfo');
  }

  getOfferById(id) async {
    dio.options.queryParameters['id'] = id;
    return await dio.get('https://flutterauth10.herokuapp.com/getOfferById');
  }

  deleteOffer(id) async {
    return await dio.delete('https://flutterauth10.herokuapp.com/deleteOffer',
        data: {"id": id},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  addFavori(userId, offerId, title, image) async {
    return await dio.post('https://flutterauth10.herokuapp.com/addFavori',
        data: {
          "userId": userId,
          "offerId": offerId,
          "title": title,
          "image": image
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  deleteFavori(id) async {
    return await dio.delete('https://flutterauth10.herokuapp.com/deleteFavori',
        data: {"id": id},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  Future<List<Offre>> getOffers(String token) async {
    print(token);
    try {
      dio.options.headers['Authorization'] = 'Bearer $token';
      Response<String> response =
          await dio.get('https://flutterauth10.herokuapp.com/getOffers');
      // print("response:" + response.toString());

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

  Future<List<Order>> getOrder(id) async {
    try {
      Response<String> response = await dio.get(
          'https://flutterauth10.herokuapp.com/getOrdersByUserId?id=' + id);
      // print("liste d'offres" + response.toString());
      if (response.statusCode == 200) {
        var result = jsonDecode(response.toString()) as List;
        var listOrder = result.map((e) => Order.fromJson(e)).toList();
        return listOrder;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<Adress>> getAdress(id) async {
    try {
      Response<String> response = await dio.get(
          'https://flutterauth10.herokuapp.com/getAdressByUserId?id=' + id);
      // print("liste d'adresse" + response.toString());
      if (response.statusCode == 200) {
        var result = jsonDecode(response.toString()) as List;
        var listAdress = result.map((e) => Adress.fromJson(e)).toList();
        return listAdress;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<Offre>> getOffreById(id) async {
    try {
      Response<String> response = await dio.get(
          'https://flutterauth10.herokuapp.com/getOffersByUserId?id=' + id);
      // print("liste de locations" + response.toString());
      if (response.statusCode == 200) {
        var result = jsonDecode(response.toString()) as List;
        var listLocation = result.map((e) => Offre.fromJson(e)).toList();
        return listLocation;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<Chat>> getChatsBycostumerId(id) async {
    try {
      Response<String> response = await dio.get(
          'https://flutterauth10.herokuapp.com/getChatsBycostumerId?id=' + id);
      // print("liste d'chat" + response.toString());
      if (response.statusCode == 200) {
        var result = jsonDecode(response.toString()) as List;
        var listChat = result.map((e) => Chat.fromJson(e)).toList();
        return listChat;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<Favori>> getFavorisByUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId').toString();
    try {
      Response<String> response = await dio.post(
          'https://flutterauth10.herokuapp.com/getFavorisByUserId?id=' +
              userId);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.toString()) as List;
        var listFavori = result.map((e) => Favori.fromJson(e)).toList();
        return listFavori;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<Chat>> getChatsBysellerId(id) async {
    try {
      Response<String> response = await dio.get(
          'https://flutterauth10.herokuapp.com/getChatsBysellerId?id=' + id);
      // print("liste d'chat" + response.toString());
      if (response.statusCode == 200) {
        var result = jsonDecode(response.toString()) as List;
        var listChat = result.map((e) => Chat.fromJson(e)).toList();
        return listChat;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      return [];
    }
  }
}
//