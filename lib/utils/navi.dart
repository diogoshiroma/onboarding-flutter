import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page) {
  return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}

Future pop(BuildContext context, String tela) {
  Navigator.pop(context, tela);
}