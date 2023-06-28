import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/services/visita_provider.dart';
import 'package:tcc/widgets/visita_card.dart';

class TelaServicos extends StatefulWidget {
  const TelaServicos({super.key});

  @override
  State<TelaServicos> createState() => _TelaVisitantesState();
}

class _TelaVisitantesState extends State<TelaServicos> {
  @override
  Widget build(BuildContext context) {
    VisitaProvider? provider = Provider.of<VisitaProvider>(context);

    if (provider.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 50, 0, 10),
                      child: Text(
                        'Olá, Usuário!',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        minimumSize: Size(
                          MediaQuery.of(context).size.width * 0.9,
                          90,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/visitaSocial');
                      },
                      child: const SizedBox(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Icon(
                                Icons.add,
                              ),
                            ),
                            Text(
                              'Liberar novo acesso',
                              style: TextStyle(fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        minimumSize: Size(
                          MediaQuery.of(context).size.width * 0.9,
                          90,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/gerenciarContatos');
                      },
                      child: const SizedBox(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Icon(
                                Icons.person_2_outlined,
                              ),
                            ),
                            Text(
                              'Gerenciar contatos',
                              style: TextStyle(fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          child: Column(
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 10, 0, 10),
                    child: Text(
                      'Acessos liberados',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 109, 156, 163),
                        width: 1),
                  ),
                  child: ListView.builder(
                    itemCount: provider.listavisitas.visitas.length,
                    itemBuilder: (context, index) => VisitaCard(
                      visita: provider.listavisitas.visitas[index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
