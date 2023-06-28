import 'package:flutter/material.dart';
import 'package:tcc/models/lista_visitas.dart';
import 'package:tcc/models/visita.dart';
import 'package:tcc/repositorios/visitas_repo.dart';

class VisitaProvider extends ChangeNotifier {
  late final VisitaRepo _repo;
  late ListaVisitas listavisitas;
  bool _isLoading = true;
  late Visita novaVisita;

  VisitaProvider() {
    _repo = VisitaRepo();
    _fetchData();
  }

  void addVisita(Visita visita) {
    listavisitas.addVisita(visita);
    _repo.insertVisita(listavisitas);
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> _fetchData() async {
    try {
      setIsLoading(true);
      listavisitas = await _repo.fetchData();
      setIsLoading(false);
    } catch (e) {
      debugPrint('--------------------------------Erro no fetchData: $e');
    }
  }
}
