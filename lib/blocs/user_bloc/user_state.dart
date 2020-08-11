part of 'user_bloc.dart';

enum UserStatus { empty , inProgress , success  ,fail }

abstract class UserState extends Equatable {
  final User user;
  final UserStatus userStatus;
  const UserState({this.user,this.userStatus});

  @override
  List<Object> get props => [user];
}

class UserInitial extends UserState {
  UserInitial():super(userStatus: UserStatus.empty);
}

//fetching
class UserFetchInProgress extends UserState {
UserFetchInProgress():super(userStatus: UserStatus.inProgress);
}

class UserFetchSuccess extends UserState {
  UserFetchSuccess({User user}):super(userStatus: UserStatus.success,user: user);
}

class UserFetchFail extends UserState {
  UserFetchFail({User user}):super(userStatus: UserStatus.fail);
}

//saving
class UserSaveInProgress extends UserState {
  UserSaveInProgress():super(userStatus: UserStatus.inProgress);
}

class UserSaveSuccess extends UserState {
  UserSaveSuccess({User user}):super(userStatus: UserStatus.success,user: user);
}

class UserSaveFail extends UserState {
  UserSaveFail({User user}):super(userStatus: UserStatus.fail);
}


