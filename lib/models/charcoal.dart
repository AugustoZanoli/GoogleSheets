class CharcoalFields {
  static final String id = 'id';
  static final String uper = 'uper';
  static final String bitola = 'bitola';
  static final String modeloForno = 'modeloForno';
  static final String numeroForno = 'numeroForno';
  static final String supervisor = 'supervisor';

  static List<String> getFields() =>
      [id, uper, bitola, modeloForno, numeroForno, supervisor];
}

class Charcoal {
  final int? id;
  final String uper;
  final String bitola;
  final String modeloForno;
  final String numeroForno;
  final String supervisor;

  const Charcoal({
    this.id,
    required this.uper,
    required this.bitola,
    required this.modeloForno,
    required this.numeroForno,
    required this.supervisor,
  });

  Charcoal copy({
    int? id,
    String? uper,
    String? bitola,
    String? modeloForno,
    String? numeroForno,
    String? supervisor,
    
  }) =>
      Charcoal(
        id: id ?? this.id,
        uper: uper ?? this.uper,
        bitola: bitola ?? this.bitola,
        modeloForno: modeloForno ?? this.modeloForno,
        numeroForno: numeroForno ?? this.numeroForno,
        supervisor: supervisor ?? this.supervisor,
      );

  Map<String, dynamic> toJson() => {
        CharcoalFields.id: id,
        CharcoalFields.uper: uper,
        CharcoalFields.bitola: bitola,
        CharcoalFields.modeloForno: modeloForno,
        CharcoalFields.numeroForno: numeroForno,
        CharcoalFields.supervisor: supervisor,
      };
}
