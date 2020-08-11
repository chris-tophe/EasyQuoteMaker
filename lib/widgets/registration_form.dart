
import 'package:easy_quote_maker/blocs/blocs.dart';
import 'package:easy_quote_maker/blocs/user_bloc/user_bloc.dart';
import 'package:easy_quote_maker/component/alert_factory.dart';
import 'package:easy_quote_maker/component/validators.dart';
import 'package:easy_quote_maker/model/user.dart';
import 'package:easy_quote_maker/widgets/labeled_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _validationFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _usernameController.text = "bobChar";
    _passwordController.text = "bobbob";
    _passwordConfirmController.text = "bobbob";
    _firstNameController.text = "Bob";
    _lastNameController.text = "Le Charpentier";
    _emailController.text = "bob@bob.com";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Form(
            key: _validationFormKey,
            child: Column(
              children: [
                LabeledTextInput(
                  label: "Username",
                  controller: _usernameController,
                  validator: Validator.isValidUsername,
                ),
                LabeledTextInput(
                  label: "Password",
                  controller: _passwordController,
                  validator: Validator.isValidPassword,
                  obscure: true,
                ),
                LabeledTextInput(
                  label: "Password\nConfirmation",
                  controller: _passwordConfirmController,
                  validator: (val) {
                    var s = Validator.isSame(val, _passwordController.text);
                    if (s != null) return s.toString();
                    return null;
                  },
                  obscure: true,
                ),
                LabeledTextInput(
                  label: "First Name",
                  controller: _firstNameController,
                  validator: Validator.isNotEmpty,
                ),
                LabeledTextInput(
                  label: "Last Name",
                  controller: _lastNameController,
                  validator: Validator.isNotEmpty,
                ),
                LabeledTextInput(
                  label: "Email",
                  controller: _emailController,
                  validator: Validator.isValidEmail,
                ),
                BlocConsumer<UserBloc, UserState>(
                  listenWhen: (previousState, state) {
                    if (previousState.userStatus == UserStatus.inProgress &&
                        (state.userStatus == UserStatus.fail ||
                            state.userStatus == UserStatus.success)) {
                      return true;
                    }
                    return false;
                  },
                  listener: (context, state) {
                    if (state.userStatus == UserStatus.fail) {
                      AlertFactory.alertWrong(context);
                      context.bloc<UserBloc>().add(UserClear());
                    }
                    if (state.userStatus == UserStatus.success) {
                      context.bloc<TokenBloc>().add(
                          TokenFetch(user: state.user.toRequestTokenUser()));
                      Navigator.pop(context);
                    }
                  },
                  builder: (context, state) {
                    return MaterialButton(
                      child: Text("Register"),
                      onPressed: () async {
                        if (_validationFormKey.currentState.validate()) {
                          final user = User(
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              username: _usernameController.text,
                              email: _emailController.text,
                              password: _passwordController.text);
                          context.bloc<UserBloc>().add(UserSave(user: user));
                        }
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
