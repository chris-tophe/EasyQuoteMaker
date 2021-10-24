import 'package:easy_quote_maker/model/alert_display_info.dart';
import 'package:flutter/material.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

class AlertFactory {


  static void alertWrong(BuildContext context) {
    Alert(
      context: context,
      title: "Ouuups !",
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

  static void alertText(BuildContext context,AlertDisplayInfo display) {
    Alert(
      context: context,
      title: display.title,
      desc: display.text,
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
