import 'package:tcc/models/visitante.dart';

class ListaVisitantes {
  ListaVisitantes({visitantes}) {
    visitantes = visitantes;
  }

  late List<Visitante> visitantes;

  void addVisitante(Visitante visitante) {
    visitantes.add(visitante);
  }

  ListaVisitantes.fromJson(Map<String, dynamic> json) {
    visitantes = List.from(json['registros']).map((e) {
      return Visitante.fromJson(e);
    }).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['registros'] = visitantes.map((e) => e.toJson()).toList();
    return data;
  }
}
