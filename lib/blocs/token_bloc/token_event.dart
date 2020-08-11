part of 'token_bloc.dart';

abstract class TokenEvent extends Equatable {
  const TokenEvent();

}

class TokenFetch extends TokenEvent{

  final RequestTokenUser user;

  const TokenFetch({@required this.user}):super();

  @override

  List<Object> get props => [user];
}
