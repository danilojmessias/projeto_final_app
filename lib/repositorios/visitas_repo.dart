import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tcc/models/lista_visitas.dart';
import 'package:tcc/models/visita.dart';

class VisitaRepo {
  Future<ListaVisitas> fetchData() async {
    Dio dio = Dio();

    var response = await dio
        .get('https://projetofinal.cyclic.app/visitas/patrineg@gmail.com');

    Map<String, dynamic> map = response.data;
    debugPrint(map['props'].toString());
    return ListaVisitas.fromJson(map['props']);
  }

  Future<void> insertVisita(ListaVisitas data) async {
    Dio dio = Dio();

    await dio.post('https://projetofinal.cyclic.app/visitas/patrineg@gmail.com',
        data: data.toJson());
  }

  Future<bool> deleteVisita(Visita data) async {
    Dio dio = Dio();

    var response = await dio.delete(
        'https://projetofinal.cyclic.app/visitantes/patrineg@gmail.com',
        data: data.toJson());

    return response.data;
  }
}
