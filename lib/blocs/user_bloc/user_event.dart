part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class UserFetch extends UserEvent {
  UserFetch() : super();
}

class UserSave extends UserEvent {
  final User user;

  UserSave({this.user}) : super();

  @override
  // TODO: implement props
  List<Object> get props => [user];
}

class UserClear extends UserEvent {
  UserClear() : super();
}
