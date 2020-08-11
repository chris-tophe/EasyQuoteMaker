import 'package:easy_quote_maker/blocs/blocs.dart';
import 'package:easy_quote_maker/blocs/user_bloc/user_bloc.dart';
import 'package:easy_quote_maker/proxy/proxy_factory.dart';
import 'package:easy_quote_maker/widgets/registration_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserRegistrationScreen extends StatefulWidget {
  UserRegistrationScreen({Key key}) : super(key: key);

  @override
  _UserRegistrationScreenState createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User Registration"),
        ),
        body: BlocProvider<UserBloc>(
          create: (_) => UserBloc(userProxy: ProxyFactory.createUserProxy(context.bloc<TokenBloc>().state.token)),
          child: RegistrationForm(),
        ));
  }
}
