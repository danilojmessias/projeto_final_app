import 'package:tcc/models/visitante.dart';

class Visita {
  late final Visitante visitante;
  late final String date;

  Visita({
    required this.visitante,
    required this.date,
  });

  Visita.fromJson(Map<String, dynamic> json) {
    date = json['data'];
    visitante = Visitante.fromJson(json['visitante']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data'] = date;
    data['visitante'] = visitante.toJson();

    return data;
  }
}
