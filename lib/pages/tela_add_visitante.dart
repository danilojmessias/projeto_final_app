import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/models/visitante.dart';
import 'package:tcc/services/visitante_provider.dart';
import 'package:validadores/Validador.dart';

class TelaAddVisitante extends StatefulWidget {
  const TelaAddVisitante({super.key});

  @override
  State<TelaAddVisitante> createState() => _VisitaSocialState();
}

class _VisitaSocialState extends State<TelaAddVisitante> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController _nomeController;
  late final TextEditingController _cpfController;

  @override
  void initState() {
    _nomeController = TextEditingController();
    _cpfController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _nomeController.dispose();
    _cpfController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    VisitanteProvider provider = Provider.of<VisitanteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image(
            image: const AssetImage('assets/images/logo.png'),
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.13,
                      child: const Center(
                        child: Text(
                          'Cadastrar visitante',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.width * 0.22,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Informe o nome do visitante';
                          }
                          return null;
                        },
                        controller: _nomeController,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.abc),
                          label: const Text('Nome Completo'),
                          hintText: 'Nome do visitante',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(23),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.width * 0.22,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Informe o CPF do visitante';
                          }
                          return Validador()
                              .add(Validar.CPF, msg: 'CPF invalido')
                              .valido(value, clearNoNumber: true);
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.perm_identity),
                          label: const Text('CPF'),
                          hintText: 'CPF do visitante',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(23),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.6, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        shadowColor: const Color.fromRGBO(0, 0, 0, 25),
                        backgroundColor:
                            const Color.fromRGBO(146, 217, 227, 85),
                        elevation: 4,
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Visitante visitante = Visitante(
                              nome: _nomeController.text,
                              cpf: _cpfController.text);
                          provider.addVisitante(visitante);
                          Navigator.pushNamed(
                            context,
                            '/gerenciarContatos',
                          );
                        }
                      },
                      child: const Text('Salvar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
