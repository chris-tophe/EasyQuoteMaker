import 'package:easy_quote_maker/configuration/server_address.dart';
import 'package:easy_quote_maker/model/role.dart';
import 'package:easy_quote_maker/model/user.dart';
import 'package:easy_quote_maker/proxy/crud_proxy.dart';
import 'package:easy_quote_maker/proxy/proxy_factory.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  UserScreen({Key key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  CrudProxy<User> userProxy;
  Future<User> user;

  @override
  void initState() {
    super.initState();
    userProxy = ProxyFactory.createUserProxy();
    user = userProxy.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EasyQuoteMaker")),
      body: Center(
        child: FutureBuilder<User>(
          future: user,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Row(
                    children: [Text("Login"), Text(snapshot.data.username)],
                  ),
                  Row(
                    children: [Text("Email"), Text(snapshot.data.email)],
                  ),
                  Row(
                    children: [Text("Prenom"), Text(snapshot.data.firstName)],
                  ),
                  Row(
                    children: [Text("Nom"), Text(snapshot.data.lastName)],
                  ),
                  Row(
                    children: [
                      Text("Manager"),
                      (snapshot.data.userManager !=null) ? Text(snapshot.data.userManager?.username) : Text("Pas de Manager")
                    ],
                  ),
                  Row(
                    children: [Text("Role"), _drawRoles(snapshot.data.roles)],
                  ),
                ],
              );
            }
            return Container(
              child: Text("No data"),
            );
          },
        ),
      ),
    );
  }

  Widget _drawRoles(List<Role> roles) {
    return Column(
        children: List<Widget>.generate(roles.length, (int index) {
      return Text(describeEnum(roles[index]));
    }));
  }
}
