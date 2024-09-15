import 'package:gerenciador_planta/models/planta.dart';

class ListUtils {
  static Map<String, int> getContagemRegiao(List<Planta> plantas) {
    final regicaoContagem = <String, int>{};

    for (Planta planta in plantas) {
      final regiao = planta.regiao;

      if (regicaoContagem.containsKey(regiao)) {
        regicaoContagem[regiao] = regicaoContagem[regiao]! + 1;
        continue;
      }
      regicaoContagem[regiao] = 1;
    }

    return regicaoContagem;
  }

  static Map<String, int> getContagemTipo(List<Planta> plantas) {
    final tipoContagem = <String, int>{};

    for (var planta in plantas) {
      final tipo = planta.tipo;

      if (tipoContagem.containsKey(tipo)) {
        tipoContagem[tipo] = tipoContagem[tipo]! + 1;
        continue;
      }
      tipoContagem[tipo] = 1;
    }

    return tipoContagem;
  }
}
