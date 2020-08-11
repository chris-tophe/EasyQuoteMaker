import 'package:dio/dio.dart';
import 'package:dio/src/options.dart';
import 'package:easy_quote_maker/component/logger.dart';
import 'package:easy_quote_maker/interfaces/jsonable.dart';
import 'package:easy_quote_maker/proxy/base_proxy.dart';
import 'package:flutter/cupertino.dart';



class CrudProxy<T extends JSONable> extends BaseProxy{

  T newType;

  CrudProxy({@required String url, @required String token, @required T this.newType}):super() {
    assert(url.isNotEmpty);
    Map<String, String> headers;
    if (token != null)
    headers = {'authorization': "Bearer "+token};
    BaseOptions options =
    BaseOptions(
        baseUrl: url,
        responseType: ResponseType.json,
        headers:headers
    );
    setOptions(options) ;
  }

  void setType(T newType){
    this.newType = newType;
  }

  Future<T> get() async{
    Response response;
    try{
      response = await dio.get("");
      if (response.statusCode == 200){
        T t = newType.cloneFromJson(response.data);
        return t;
      }
    }
    catch (e){
      Logger.error("Get at ${dio.options.baseUrl} failed : ${e.toString()}");
    }
  }

  Future<T>post(T data) async{
    Response response;
    try{
      response = await dio.post("",data: data.toJson());
      if (response.statusCode == 201){
        T t = newType.cloneFromJson(response.data);
        return t;
      }
    }
    catch (e){
      Logger.error("Post at ${dio.options.baseUrl} failed :");
    }
  }


}