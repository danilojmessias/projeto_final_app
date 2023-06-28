// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Morador {
  final int? id;
  final String nome;
  final String cpf;
  final String telefone;
  final String email;
  final String bloco;
  final String apartamento;
  Morador({
    this.id,
    required this.nome,
    required this.cpf,
    required this.telefone,
    required this.email,
    required this.bloco,
    required this.apartamento,
  });

  Morador copyWith({
    int? id,
    String? nome,
    String? cpf,
    String? telefone,
    String? email,
    String? bloco,
    String? apartamento,
  }) {
    return Morador(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      cpf: cpf ?? this.cpf,
      telefone: telefone ?? this.telefone,
      email: email ?? this.email,
      bloco: bloco ?? this.bloco,
      apartamento: apartamento ?? this.apartamento,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'cpf': cpf,
      'telefone': telefone,
      'email': email,
      'bloco': bloco,
      'apartamento': apartamento,
    };
  }

  factory Morador.fromMap(Map<String, dynamic> map) {
    return Morador(
      id: map['id'] != null ? map['id'] as int : null,
      nome: map['nome'] as String,
      cpf: map['cpf'] as String,
      telefone: map['telefone'] as String,
      email: map['email'] as String,
      bloco: map['bloco'] as String,
      apartamento: map['apartamento'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Morador.fromJson(String source) =>
      Morador.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Morador(id: $id, nome: $nome, cpf: $cpf, telefone: $telefone, email: $email, bloco: $bloco, apartamento: $apartamento)';
  }

  @override
  bool operator ==(covariant Morador other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nome == nome &&
        other.cpf == cpf &&
        other.telefone == telefone &&
        other.email == email &&
        other.bloco == bloco &&
        other.apartamento == apartamento;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nome.hashCode ^
        cpf.hashCode ^
        telefone.hashCode ^
        email.hashCode ^
        bloco.hashCode ^
        apartamento.hashCode;
  }
}
