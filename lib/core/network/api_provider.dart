import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dukalink_app/core/di/injector.dart';
import 'package:flutter/material.dart';

class ApiProvider {
  Dio dio;

  ApiProvider({required this.dio});

  Future<dynamic> post(Map payload, String url,
      {Map<String, dynamic>? queryparameters}) async {
    try {
      debugPrint("URL CALLED: $url");
      debugPrint("Payload: ${payload}");
      final response = await dio.post(url,
          data: jsonEncode(payload), queryParameters: queryparameters);
      debugPrint("Responseee: ${response.statusCode}");

      return response.data;
    } on DioError catch (e) {
      debugPrint("Responseee: ${e.response!.statusCode}");

      throw e.message;
    }
  }

  Future<dynamic> delete(Map payload, String url) async {
    try {
      final response = await dio.delete(url, data: jsonEncode(payload));
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<dynamic> put(Map payload, String url) async {
    try {
      final response = await dio.put(url, data: jsonEncode(payload));
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<dynamic> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      debugPrint("Request Url: $url");
      debugPrint("Request Parameters: $queryParameters");
      final response =
          await inject.get<Dio>().get(url, queryParameters: queryParameters);
      debugPrint("ALL RESPONSE: $response");
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<dynamic> patch(Map payload, String url) async {
    try {
      final response = await dio.patch(url, data: jsonEncode(payload));
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    }
  }
}
