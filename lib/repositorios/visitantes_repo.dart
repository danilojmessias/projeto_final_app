import 'package:dio/dio.dart';
import 'package:tcc/models/lista_visitantes.dart';
import 'package:tcc/models/visitante.dart';

class VisitanteRepo {
  Future<ListaVisitantes> fetchData() async {
    Dio dio = Dio();

    var response = await dio
        .get('https://projetofinal.cyclic.app/visitantes/patrineg@gmail.com');

    Map<String, dynamic> map = response.data;
    return ListaVisitantes.fromJson(map['props']);
  }

  Future<void> insertVisitante(ListaVisitantes data) async {
    Dio dio = Dio();

    await dio.post(
        'https://projetofinal.cyclic.app/visitantes/patrineg@gmail.com',
        data: data.toJson());
  }

  Future<bool> deleteVisitante(Visitante data) async {
    Dio dio = Dio();

    var response = await dio.delete(
        'https://projetofinal.cyclic.app/visitantes/patrineg@gmail.com',
        data: data.toJson());

    return response.data;
  }
}
