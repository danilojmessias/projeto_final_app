import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:tcc/models/morador.dart';
import 'package:tcc/models/morador_dao.dart';
import 'package:tcc/services/auth_service.dart';
import 'package:validadores/Validador.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _telController = TextEditingController();
  final _blocoController = TextEditingController();
  final _apartController = TextEditingController();

  Future<void> _salvarMorador() async {
    AuthService auth = Provider.of<AuthService>(context, listen: false);
    var morador = Morador(
      nome: _nomeController.text,
      cpf: _cpfController.text,
      telefone: _telController.text,
      bloco: _blocoController.text,
      apartamento: _apartController.text,
      email: auth.usuario!.email.toString(),
    );
    int novoId = await MoradorDAO.inserir(morador);

    debugPrint('Morador inserido com id: $novoId');
    setState(() {
      Navigator.pushNamed(
        context,
        '/dashboard',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
                          'Faça seu cadastro',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.width * 0.22,
                      child: TextFormField(
                        controller: _nomeController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Informe seu Nome';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.abc),
                          label: const Text('Nome'),
                          hintText: 'Seu Nome',
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
                        controller: _cpfController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Informe seu CPF';
                          }
                          return Validador()
                              .add(Validar.CPF, msg: 'CPF invalido')
                              .valido(value, clearNoNumber: true);
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.perm_identity),
                          label: const Text('CPF'),
                          hintText: 'Seu CPF',
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
                        controller: _telController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Informe seu Telefone';
                          }
                          if (!validator.phone(value)) {
                            return 'Telefone inválido';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.phone),
                          label: const Text('Telefone'),
                          hintText: 'Seu Telefone',
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
                        controller: _blocoController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Informe seu Bloco';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.apartment),
                          label: const Text('Bloco'),
                          hintText: 'Seu Bloco',
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
                        controller: _apartController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Informe seu Apartamento';
                          }
                          if (!validator.phone(value)) {
                            return 'Telefone inválido';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.apartment),
                          label: const Text('Apartamento'),
                          hintText: 'Nº do seu AP',
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
                          _salvarMorador();
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
