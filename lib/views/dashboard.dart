import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tcc/models/morador.dart';
import 'package:tcc/models/morador_dao.dart';
import 'package:tcc/pages/tela_agendamentos.dart';
import 'package:tcc/pages/tela_inicio.dart';
import 'package:tcc/pages/tela_login.dart';
import 'package:tcc/pages/tela_servicos.dart';
import 'package:tcc/pages/tela_visitantes.dart';
import 'package:tcc/services/auth_service.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late String id;
  late List<String> user;
  late Future<List<Morador>> morador;
  int _selectedItem = 0;

  final _subTelas = [
    const TelaInicio(),
    const TelaVisitantes(),
    const TelaServicos(),
    const TelaAgendamentos(),
  ];
  void _alterarBottomNav(int idx) {
    setState(() {
      _selectedItem = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    String usuario = auth.usuario!.email.toString();
    if (auth.usuario == null) {
      return const TelaLogin();
    }
    return FutureBuilder(
      future: MoradorDAO.carregarMoradores(
        auth.usuario?.email.toString(),
      ),
      builder: ((context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Center(
                child: Text(snapshot.data.toString()),
              ),
            ),
          );
        }
        List<Morador> moradores = snapshot.data as List<Morador>;
        if (moradores.isEmpty) {
          return Scaffold(
            body: AlertDialog(
              content: const Text('Cadastro não finalizado'),
              icon: const Icon(Icons.error_outline),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    '/cadastro',
                  ),
                  child: const Text('Terminar Cadastro'),
                )
              ],
            ),
          );
        }
        log(moradores.toString());
        return Scaffold(
          //safearea
          appBar: AppBar(
            title: Center(
              child: Image(
                image: const AssetImage('assets/images/logo.png'),
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.9,
              ),
            ),
          ),
          drawer: Drawer(
            width: MediaQuery.of(context).size.width * 0.6,
            elevation: 5,
            child: ListView(
              padding: const EdgeInsets.only(top: 30),
              children: [
                Center(
                  child: InkWell(
                    onTap: () {},
                    child: SizedBox(
                      child: CircleAvatar(
                        backgroundImage:
                            const AssetImage('assets/images/profile.jpeg'),
                        minRadius: MediaQuery.of(context).size.width * 0.10,
                        maxRadius: MediaQuery.of(context).size.width * 0.12,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.04,
                ),
                Center(
                  child: Text(
                    usuario,
                    style: GoogleFonts.roboto(
                        fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.04,
                ),
                Center(
                  child: Text(
                    'Residencial Guardinhas',
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Bloco ${moradores[0].bloco}',
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Apartamento ${moradores[0].apartamento}',
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: IconButton(
                    onPressed: () => auth.logout(),
                    icon: const Icon(Icons.logout_rounded),
                  ),
                ),
              ],
            ),
          ),
          body: _subTelas[_selectedItem],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedItem,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                label: 'Inicio',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Visitantes',
                icon: Icon(Icons.group),
              ),
              BottomNavigationBarItem(
                label: 'Serviços',
                icon: Icon(Icons.handyman),
              ),
              BottomNavigationBarItem(
                label: 'Agendamentos',
                icon: Icon(Icons.event),
              ),
            ],
            onTap: _alterarBottomNav,
          ),
        );
      }),
    );
  }
}
