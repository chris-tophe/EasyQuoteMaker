part of 'token_bloc.dart';

enum TokenStatus { fetched, notFetched, fetching, fail }

abstract class TokenState extends Equatable {
  final String token;
  final TokenStatus status;

  const TokenState({
    this.status = TokenStatus.notFetched,
    this.token,
  });

  @override
  // TODO: implement props
  List<Object> get props => [status, token];
}

class TokenFetched extends TokenState {
  TokenFetched(String token)
      : super(
          status: TokenStatus.fetched,
          token: token,
        );
}

class NoToken extends TokenState {
  NoToken() : super(status: TokenStatus.notFetched);
}

class FetchingToken extends TokenState{
  FetchingToken():super (status: TokenStatus.fetching);
}

class FailToken extends TokenState{
  AlertDisplayInfo _failMessage;

  AlertDisplayInfo get failMessage => _failMessage;

  FailToken(AlertDisplayInfo failMessage) : super (status: TokenStatus.fail) {
    _failMessage = failMessage;
  }
}