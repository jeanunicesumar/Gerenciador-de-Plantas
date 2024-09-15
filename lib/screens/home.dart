import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gerenciador_planta/models/planta.dart';
import 'package:gerenciador_planta/screens/form.dart';
import 'package:gerenciador_planta/screens/list_screen.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final plantas = Provider.of<PlantaProvider>(context).getPlantas;
    final plantasToScrool = plantas.take(4).toList();

    final tipoContagem = <String, int>{};
    final regicaoContagem = <String, int>{};

    for (var planta in plantas) {
      final tipo = planta.tipo;
      final regiao = planta.regiao;

      if (tipoContagem.containsKey(tipo)) {
        tipoContagem[tipo] = tipoContagem[tipo]! + 1;
      } else {
        tipoContagem[tipo] = 1;
      }

      if (regicaoContagem.containsKey(regiao)) {
        regicaoContagem[regiao] = regicaoContagem[regiao]! + 1;
      } else {
        regicaoContagem[regiao] = 1;
      }
    }

    return Scaffold(
      body: Container(
        color: const Color.fromARGB(240, 22, 22, 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Gerenciador de Plantas",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: plantasToScrool.map((planta) {
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
                  }).toList(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    overlayColor: Colors.transparent,
                    foregroundColor: const Color.fromARGB(200, 231, 193, 243),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ListScreen()),
                  ),
                  child: const Text("Ver tudo"),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromRGBO(48, 48, 48, 0.49),
                ),
                width: double.infinity,
                height: 200,
                child: Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          spacing: 5,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Regiões",
                                style: TextStyle(
                                  color: Color.fromARGB(200, 231, 193, 243),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Locais onde as plantas cadastradas no sistema estão localizadas.",
                                style: TextStyle(
                                  color: Color.fromARGB(200, 231, 193, 243),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: PieChart(
                        PieChartData(
                          sections: regicaoContagem.entries.map((entry) {
                            final regiao = entry.key;
                            final contagem = entry.value;

                            return PieChartSectionData(
                              value: contagem.toDouble(),
                              color: _getRandomGreenColor(),
                              title: regiao,
                              radius: 50,
                              titleStyle: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            );
                          }).toList(),
                          borderData: FlBorderData(show: false),
                          sectionsSpace: 3,
                          centerSpaceRadius: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromRGBO(48, 48, 48, 0.49),
                ),
                width: double.infinity,
                height: 200,
                child: Row(
                  children: [
                    Expanded(
                      child: PieChart(
                        PieChartData(
                          sections: tipoContagem.entries.map((entry) {
                            final tipo = entry.key;
                            final contagem = entry.value;

                            return PieChartSectionData(
                              value: contagem.toDouble(),
                              color: _getRandomGreenColor(),
                              title: tipo,
                              radius: 50,
                              titleStyle: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            );
                          }).toList(),
                          borderData: FlBorderData(show: false),
                          sectionsSpace: 3,
                          centerSpaceRadius: 40,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          spacing: 5,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Tipos de plantas",
                                style: TextStyle(
                                  color: Color.fromARGB(200, 231, 193, 243),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Tipos de plantas que estão cadastradas no sistema.",
                                style: TextStyle(
                                  color: Color.fromARGB(200, 231, 193, 243),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(121, 0, 255, 68),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FormPlanta()),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Color _getRandomGreenColor() {
    final random = Random();
    final green = 100 + random.nextInt(156);
    final red = random.nextInt(100); 
    final blue = random.nextInt(100);

    return Color.fromARGB(255, red, green, blue);
  }
}
