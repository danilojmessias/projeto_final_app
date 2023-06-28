import 'package:flutter/material.dart';
import 'package:tcc/models/visita.dart';

class VisitaCard extends StatelessWidget {
  const VisitaCard({super.key, required this.visita});

  final Visita visita;

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
                  visita.date,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  visita.visitante.nome,
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
