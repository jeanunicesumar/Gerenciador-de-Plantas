import 'package:flutter/material.dart';

class TituloGrafico extends StatelessWidget {
  final String titulo;
  final String legenda;

  const TituloGrafico(this.titulo, this.legenda, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              titulo,
              style: const TextStyle(
                color: Color.fromARGB(200, 231, 193, 243),
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              legenda,
              style: const TextStyle(
                color: Color.fromARGB(200, 231, 193, 243),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
