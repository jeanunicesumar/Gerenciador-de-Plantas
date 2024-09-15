
import 'package:flutter/material.dart';

class CustomPadding {

  static Widget build(double paddingValue, Widget widget) {
    return Padding(
      padding: EdgeInsets.all(paddingValue),
      child: widget,
    );
  }

}