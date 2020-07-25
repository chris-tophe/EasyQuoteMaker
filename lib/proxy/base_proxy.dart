import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class BaseProxy {

  @protected
  Dio dio = Dio();

  BaseProxy();

  @protected
  setOptions(BaseOptions options) {
    dio = Dio(options);
    //TODO remove in production accept all https certificate
    try  {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
    catch (e){
      print("self signed cert acceptation crashed");
    }
  }
}
