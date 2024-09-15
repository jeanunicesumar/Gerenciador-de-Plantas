import 'package:flutter/material.dart';

class FormUtils {
  static Widget buildDefaultInput(
      String description,
      String hint,
      Color inputColor,
      Color iconColor,
      IconData icon,
      TextEditingController contoller) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return description;
          }
          return null;
        },
        controller: contoller,
        keyboardType: TextInputType.text,
        style: TextStyle(color: inputColor),
        decoration: InputDecoration(
          labelStyle: TextStyle(color: inputColor),
          icon: Icon(icon, color: iconColor),
          hintText: hint,
          hintStyle: TextStyle(color: inputColor),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: inputColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: inputColor),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: inputColor),
          ),
        ),
      ),
    );
  }

  static InputDecoration buildDecoration(
      String hint, Color inputColor, Color iconColor, IconData icon) {
    return InputDecoration(
      labelStyle: TextStyle(color: inputColor),
      icon: Icon(icon, color: iconColor),
      hintText: hint,
      hintStyle: TextStyle(color: inputColor),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: inputColor),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: inputColor),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: inputColor),
      ),
    );
  }

  static Widget buildTitleForm(String title, IconData iconTitle, Color color) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconTitle,
            color: color,
          ),
          Text(
            title,
            style: TextStyle(color: color, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
