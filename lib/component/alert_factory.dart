import 'package:flutter/material.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

class AlertFactory {


  static void alertWrong(BuildContext context) {
    Alert(
      context: context,
      title: "Ouups !",
      desc: "Something wrent wrong",
      buttons: [
        DialogButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    ).show();
  }
}
