import 'package:easy_quote_maker/component/validators.dart';
import 'package:easy_quote_maker/model/request_token_user.dart';
import 'package:easy_quote_maker/model/token_storage.dart';
import 'package:easy_quote_maker/proxy/token_proxy.dart';
import 'package:flutter/material.dart';

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

class _DisplayForm extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameTextController,
                validator: Validator.isNotEmpty,
              ),
              TextFormField(
                controller: _passwordTextController,
                validator: Validator.isValidPassword,
              ),
              RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {

                    TokenProxy tokenProxy = TokenProxy();
                    RequestTokenUser user = RequestTokenUser(_usernameTextController.text,_passwordTextController.text);
                    tokenProxy.requestTokenUser = user;
                    await tokenProxy.fetchToken();
                    if(TokenStorage.instance.token?.isNotEmpty){
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text(TokenStorage.instance.token)));
                      Navigator.pushNamed(context, 'userScreen');
                    }
                  }
                },
                child: Text('Login'),
              ),
              MaterialButton(
                child: Text("Register"),
                onPressed: (){
                  Navigator.pushNamed(context, "registerScreen");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
