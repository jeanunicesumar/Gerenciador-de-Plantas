import 'package:flutter/material.dart';

class Header {
  static Widget buildText() {
    return const Text(
      "Gerenciador de Plantas",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.green,
        fontSize: 14,
      ),
    );
  }

  static Widget buildTextWithContext(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        const Expanded(
          child: Text(
            "Gerenciador de Plantas",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.green,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(width: 48),
      ],
    );
  }
}
