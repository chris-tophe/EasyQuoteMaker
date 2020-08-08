import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LabeledTextInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function validator;
  final bool obscure;

  const LabeledTextInput(
      {Key key,
      @required this.label,
      @required this.controller,
      this.validator,
      this.obscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: SizedBox(
        width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(label),
              ),
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                controller: controller,
                validator: validator,
                obscureText: obscure,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
