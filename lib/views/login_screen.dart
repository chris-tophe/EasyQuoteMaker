import 'package:easy_quote_maker/component/validators.dart';
import 'package:easy_quote_maker/model/request_token_user.dart';
import 'package:easy_quote_maker/model/token_storage.dart';
import 'package:easy_quote_maker/proxy/proxy_factory.dart';
import 'package:easy_quote_maker/proxy/token_proxy.dart';
import 'package:easy_quote_maker/widgets/labeled_text_input.dart';
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
              SizedBox(height: 10,),
              RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {

                    final tokenProxy = ProxyFactory.createTokenProxy() ;
                    RequestTokenUser user = RequestTokenUser(_usernameTextController.text,_passwordTextController.text);
                    tokenProxy.requestTokenUser = user;
                    await tokenProxy.fetchToken();
                    if(TokenStorage.instance.token != null && TokenStorage.instance.token.isNotEmpty){
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
