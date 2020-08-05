import 'package:dio/dio.dart';
import 'package:dio/src/options.dart';
import 'package:easy_quote_maker/component/logger.dart';
import 'package:easy_quote_maker/interfaces/jsonable.dart';
import 'package:easy_quote_maker/model/token_storage.dart';
import 'package:easy_quote_maker/proxy/base_proxy.dart';


class CrudProxy<T extends JSONable> extends BaseProxy{

  T newType;

  CrudProxy(String url,this.newType):super() {
    TokenStorage tokenStorage = TokenStorage.instance;
    Map<String, String> headers;
    if (tokenStorage.token?.isNotEmpty) {
      headers = {'authorization': "Bearer "+tokenStorage.token};
    }
    BaseOptions options =
    BaseOptions(
        baseUrl: url,
        responseType: ResponseType.json,
        headers:headers
    );
    setOptions(options) ;
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
      Logger.error("Get at ${dio.options.baseUrl} failed :");
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