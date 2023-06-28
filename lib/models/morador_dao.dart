import 'dart:developer';

import 'package:tcc/database/db_helper.dart';
import 'package:tcc/models/morador.dart';

class MoradorDAO {
  static Future<int> inserir(Morador morador) async {
    var db = await DbHelper.getInstance();
    int novoid = await db.insert(
      'morador',
      morador.toMap(),
    );
    return novoid;
  }

  static Future<void> deletar(Morador morador) async {
    var db = await DbHelper.getInstance();
    await db.delete('morador', where: 'id=?', whereArgs: [morador.id]);
  }

  static Future<List<Morador>> carregarMoradores(email) async {
    var db = await DbHelper.getInstance();
    List<Map<String, Object?>> resultado = await db.query(
      'morador',
      where: 'email = ?',
      whereArgs: [email],
    );
    List<Morador> moradores = resultado.map((e) => Morador.fromMap(e)).toList();
    log(moradores.toString());
    return moradores;
  }

  static Future<List<Morador>> carregarMorador(id) async {
    var db = await DbHelper.getInstance();
    List<Map<String, Object?>> resultado = await db.query(
      'morador',
      where: 'id = ?',
      whereArgs: [id],
    );

    List<Morador> moradores = resultado.map((e) => Morador.fromMap(e)).toList();
    log(moradores.toString());
    return moradores;
  }

  static Future<void> atualizar(int id, Map<String, dynamic> rows) async {
    log(rows.toString());
    var db = await DbHelper.getInstance();
    await db.update('morador', rows, where: 'id=?', whereArgs: [id]);
  }
}
