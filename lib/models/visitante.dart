class Visitante {
  Visitante({
    required this.nome,
    required this.cpf,
    this.tipo,
    this.descricao,
  });
  late final String nome;
  late final String cpf;
  late String? tipo;
  late String? descricao;

  Visitante.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    cpf = json['cpf'];
    tipo = json['tipo'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nome'] = nome;
    data['cpf'] = cpf;
    data['tipo'] = tipo;
    data['descricao'] = descricao;

    return data;
  }

/*
  static List<Visitante> gerarVisitantes() {
    return;
  }*/
}
