import 'dart:developer';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:easy_quote_maker/services/logger.dart';
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
      Logger.info("App support all certificate");
    }
    catch (e){
      Logger.info("App don't support all certificate");
    }
  }
}
