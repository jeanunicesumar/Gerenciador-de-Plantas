import 'package:flutter/material.dart';
import 'package:gerenciador_planta/models/planta.dart';

class CardHome extends StatelessWidget {
  final Planta planta;

  const CardHome(this.planta, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(128, 39, 39, 39),
        ),
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: 140,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      planta.url,
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(3),
              child: Text(
                planta.nome,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(128, 43, 255, 0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3),
              child: Text(
                planta.descricao,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(200, 162, 247, 200),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildEmpty() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(128, 39, 39, 39),
        ),
        width: 150,
        child: Container(),
      ),
    );
  }
}
