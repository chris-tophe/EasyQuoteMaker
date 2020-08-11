import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_quote_maker/component/logger.dart';
import 'package:easy_quote_maker/model/user.dart';
import 'package:easy_quote_maker/proxy/crud_proxy.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final CrudProxy<User> userProxy;

  UserBloc({@required this.userProxy}) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UserFetch) {
      yield UserFetchInProgress();
      Logger.info("${this.runtimeType.toString()} | ${event.toString()}  ${this.state.userStatus}");
      User u = await userProxy.get();
      yield (u == null) ? UserFetchFail() : UserFetchSuccess(user: u);
      Logger.info("${this.runtimeType.toString()} | ${event.toString()}  ${this.state.userStatus}");
    }
    if (event is UserSave) {
      yield UserSaveInProgress();
      User u = await userProxy.post(event.user);
      if (u != null )u.password = event.user.password;
      yield (u == null) ? UserSaveFail() : UserSaveSuccess(user: u);
      Logger.info("${this.runtimeType.toString()} | ${event.toString()}  ${this.state.userStatus}");
    }
    if (event is UserClear) {
      yield UserInitial();
      Logger.info("${this.runtimeType.toString()} | ${event.toString()}  ${this.state.userStatus}");
    }
  }
}
