import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/services/visitante_provider.dart';
import 'package:tcc/widgets/visitante_card.dart';

class TelaGerenciarContatos extends StatelessWidget {
  const TelaGerenciarContatos({super.key});

  @override
  Widget build(BuildContext context) {
    VisitanteProvider provider = Provider.of<VisitanteProvider>(context);

    if (provider.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: provider.listavisitantes.visitantes.length,
        itemBuilder: (context, index) => VisitanteCard(
          visitante: provider.listavisitantes.visitantes[index],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addVisitante');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
