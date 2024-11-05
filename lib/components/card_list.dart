import 'package:flutter/material.dart';
import 'package:gerenciador_planta/models/planta.dart';

class CardList extends StatelessWidget {
  final Planta planta;

  const CardList(this.planta, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            height: 200,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(128, 34, 34, 34),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                ),
                SizedBox(
                    width: 140,
                    height: 140,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        planta.url,
                        fit: BoxFit.cover,
                      ),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Color.fromARGB(128, 34, 34, 34),
              ),
              height: 200,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      planta.nome,
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                      ),
                    ),
                    Text(planta.descricao),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Região: ${planta.regiao}"),
                        Text("Tipo: ${planta.tipo}"),
                      ],
                    ),
                    Text("Horário de irrigação: ${planta.irrigacao.horario}"),
                    Text("Minutos: ${planta.irrigacao.tempo}"),
                    Text("Vazão por minuto: ${planta.irrigacao.vazao}"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
