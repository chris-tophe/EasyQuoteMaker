import 'dart:convert';

import 'package:easy_quote_maker/blocs/blocs.dart';
import 'package:easy_quote_maker/component/alert_factory.dart';
import 'package:easy_quote_maker/component/logger.dart';
import 'package:easy_quote_maker/component/validators.dart';
import 'package:easy_quote_maker/model/request_token_user.dart';
import 'package:easy_quote_maker/widgets/labeled_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EasyQuoteMaker"),
      ),
      body: _DisplayForm(),
    );
  }
}

class _DisplayForm extends StatefulWidget {
  @override
  _DisplayFormState createState() => _DisplayFormState();
}

class _DisplayFormState extends State<_DisplayForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getlastLoggedUser();
  }

  void _getlastLoggedUser() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.containsKey("user")) {
      String s = pref.getString('user');
      Map<String, dynamic> js = jsonDecode(s);
      RequestTokenUser lastLoggedUser = RequestTokenUser.fromJson(js);
      _usernameTextController.text = lastLoggedUser.username;
      _passwordTextController.text = lastLoggedUser.password;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TokenBloc, TokenState>(
      listenWhen: (previousState, state) {
        //Logger.info("listener triggered : ${state.status.toString()}");
        if (previousState.status == TokenStatus.fetching &&
            state.status == TokenStatus.fail) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        AlertFactory.alertWrong(context);
      },
      child: Container(
        child: BlocBuilder<TokenBloc, TokenState>(builder: (context, state) {
          //Logger.info("builder triggered : ${state.status.toString()}");
          if (state.status == TokenStatus.fetching) {
            return Center(
              child: Container(child: CircularProgressIndicator()),
            );
          }
          return Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  LabeledTextInput(
                    label: "Username",
                    controller: _usernameTextController,
                    validator: Validator.isNotEmpty,
                  ),
                  LabeledTextInput(
                    label: "Password",
                    controller: _passwordTextController,
                    validator: Validator.isValidPassword,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        RequestTokenUser user = RequestTokenUser(
                            _usernameTextController.text,
                            _passwordTextController.text);
                        context.bloc<TokenBloc>().add(TokenFetch(user: user));
                      }
                    },
                    child: Text('Login'),
                  ),
                  MaterialButton(
                    child: Text("Register"),
                    onPressed: () async {
                      await Navigator.pushNamed(context, "registerScreen");
                      setState(() {
                        _getlastLoggedUser();
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
