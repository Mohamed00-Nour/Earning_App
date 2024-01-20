import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

AwesomeDialog showAwesomeDialog({required BuildContext context ,required String title ,required String desc ,required DialogType dialogType , required AnimType animType}) {
  return AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType : animType,
    title: title,
    desc: desc,

    btnOkOnPress: () {},
  );
}