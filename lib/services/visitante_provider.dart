import 'package:flutter/material.dart';
import 'package:tcc/models/lista_visitantes.dart';
import 'package:tcc/models/visitante.dart';
import 'package:tcc/repositorios/visitantes_repo.dart';

class VisitanteProvider extends ChangeNotifier {
  late final VisitanteRepo _repo;
  late ListaVisitantes listavisitantes;
  bool _isLoading = true;
  late Visitante novoVisitante;

  VisitanteProvider() {
    _repo = VisitanteRepo();
    _fetchData();
  }

  void addVisitante(Visitante visitante) {
    listavisitantes.addVisitante(visitante);
    _repo.insertVisitante(listavisitantes);
  }

  bool get isLoading => _isLoading;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> _fetchData() async {
    try {
      setIsLoading(true);
      listavisitantes = await _repo.fetchData();
      setIsLoading(false);
    } catch (e) {
      debugPrint('--------------------------------Erro no fetchData: $e');
    }
  }
}
