import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:easy_quote_maker/component/logger.dart';
import 'package:easy_quote_maker/model/request_token_user.dart';
import 'package:easy_quote_maker/proxy/token_proxy.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'token_event.dart';
part 'token_state.dart';

class TokenBloc extends Bloc<TokenEvent, TokenState> {
  TokenProxy tokenProxy;

  TokenBloc({
    @required this.tokenProxy,
  }) : super(NoToken());

  @override
  Stream<TokenState> mapEventToState(
    TokenEvent event,
  ) async* {
    if (event is TokenFetch) {
      tokenProxy.requestTokenUser = event.user;
      yield FetchingToken();
      Logger.info("${this.runtimeType.toString()} | ${event.toString()}  ${this.state.status}");
      String token = await tokenProxy.fetchToken();
      yield (token == null) ? FailToken() : TokenFetched(token);
      Logger.info("${this.runtimeType.toString()} | ${event.toString()}  ${this.state.status}");
      if (token != null){
        Logger.info("Saving user to sharedPrefs");
        final pref = await SharedPreferences.getInstance();
        Map<String, dynamic> js = event.user.toJson();
        pref.setString("user", jsonEncode(js));
      }
    }
  }
}
