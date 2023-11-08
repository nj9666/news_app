import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiServices {
  static final Dio dio = Dio();

  //common services

  static Future<dynamic> getApiCAlls(String url) async {
    try {
      final response = await dio.get(
        url,
      );
      log("URL :- $url");
      log(response.data.toString());
      if (response.statusCode == 200) {
        return response.data;
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            behavior: SnackBarBehavior.floating,
            content: Text("${response.statusMessage}", textAlign: TextAlign.center, style: const TextStyle(fontSize: 15, color: Colors.white)),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          content: Text("$e", textAlign: TextAlign.center, style: const TextStyle(fontSize: 15, color: Colors.white)),
        ),
      );
      print("Catch Error=> ${e}");
    }
  }
}
