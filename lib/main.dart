import 'package:easy_quote_maker/blocs/blocs.dart';
import 'package:easy_quote_maker/proxy/proxy_factory.dart';
import 'package:easy_quote_maker/views/login_screen.dart';
import 'package:easy_quote_maker/views/user_registration_screen.dart';
import 'package:easy_quote_maker/views/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState;
  final contextKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TokenBloc(tokenProxy: ProxyFactory.createTokenProxy()),
        child: MaterialApp(
          title: 'Easy Quote Maker',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          navigatorKey: _navigatorKey,
          key: contextKey,
          //home: LoginScreen(),
          initialRoute: 'login',
          routes: {
            'login': (context) => LoginScreen(),
            'userScreen': (context) => UserScreen(),
            'registerScreen': (context) => UserRegistrationScreen()
          },
          builder: (context, child) {
            return BlocListener<TokenBloc, TokenState>(
              child: child,
              listener: (context, state) {
                switch (state.status) {
                  case TokenStatus.fetched:
                    _navigator.pushNamed('userScreen');
                    break;
                  default:
                    break;
                }
              },
            );
          },
        ));
  }

  //for animated transition seeing this later
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          UserRegistrationScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
