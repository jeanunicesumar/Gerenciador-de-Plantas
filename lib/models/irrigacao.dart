class Irrigacao {
  final String _id;
  final String _horario;
  final int _tempo;
  final int _vazao;

  Irrigacao({
    required String id,
    required String horario,
    required int tempo,
    required int vazao,
  })  : _id = id,
        _horario = horario,
        _tempo = tempo,
        _vazao = vazao;

  String get id => _id;
  String get horario => _horario;
  int get tempo => _tempo;
  int get vazao => _vazao;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'horario': horario,
      'tempo': tempo,
      'vazao': vazao,
    };
  }
}
