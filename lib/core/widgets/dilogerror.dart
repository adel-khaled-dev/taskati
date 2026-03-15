import 'package:flutter/material.dart';

void showError(BuildContext context,String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 2),
      content: Text(text),
      backgroundColor: Colors.redAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: 120, left: 10, right: 10),
    ),
  );
}
