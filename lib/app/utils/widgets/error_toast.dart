import 'dart:ffi';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ErrorToast extends StatelessWidget {
  String? message;
  bool isVisible;
  final EdgeInsetsGeometry margin, padding;
  ErrorToast({
    this.isVisible = false,
    @required this.message,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.margin = const EdgeInsets.only(top: 8),
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        margin: margin,
        width: MediaQuery.of(context).size.width,
        padding: padding,
        decoration: BoxDecoration(
          color: Colors.red[100],
          border: Border.all(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          '$message',
          style: TextStyle(color: Colors.red[900]),
        ),
      ),
    );
  }
}
