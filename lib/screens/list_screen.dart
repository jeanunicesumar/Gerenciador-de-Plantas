import 'package:flutter/material.dart';
import 'package:gerenciador_planta/components/card_list.dart';
import 'package:gerenciador_planta/models/planta.dart';
import 'package:gerenciador_planta/utils/header.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final plantas = Provider.of<PlantaProvider>(context).getPlantas;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Header.buildTextWithContext(context),
            ),
            Column(
              children: plantas.map((planta) {
                return CardList(planta);
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
