import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';

void showToast({
  required String? text,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
        msg: text!,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: choseToasteColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastState { SUCCESS, ERORR, WORNING }

Color choseToasteColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = const Color(0xff4377ec);
      break;
    case ToastState.ERORR:
      color = Colors.red;
      break;
    case ToastState.WORNING:
      color = Colors.amber;
      break;
  }
  return color;
}