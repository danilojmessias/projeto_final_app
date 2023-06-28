import 'package:flutter/material.dart';

import '../models/visitante.dart';

class VisitanteCard extends StatelessWidget {
  const VisitanteCard({super.key, required this.visitante});

  final Visitante visitante;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
          margin: const EdgeInsets.all(12),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
            width: MediaQuery.of(context).size.width * 0.80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  visitante.nome,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  visitante.cpf,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
