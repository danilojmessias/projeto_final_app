import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/firebase_options.dart';
import 'package:tcc/pages/tela_add_visitante.dart';
import 'package:tcc/pages/tela_cadastro.dart';
import 'package:tcc/pages/tela_exibeqr.dart';
import 'package:tcc/pages/tela_gerenciar_contatos.dart';
import 'package:tcc/pages/tela_login.dart';
import 'package:tcc/pages/tela_visita_social.dart';
import 'package:tcc/services/auth_service.dart';
import 'package:tcc/services/visita_provider.dart';
import 'package:tcc/services/visitante_provider.dart';
import 'package:tcc/views/dashboard.dart';
import 'package:tcc/widgets/auth_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    name: 'tcc',
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => VisitanteProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => AuthService(),
      ),
      ChangeNotifierProvider(
        create: (context) => VisitaProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TCC',
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 109, 156, 163),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthCheck(),
        '/login': (context) => const TelaLogin(),
        '/dashboard': (context) => const Dashboard(),
        '/cadastro': (context) => const TelaCadastro(),
        '/visitaSocial': (context) => const VisitaSocial(),
        '/exibeQR': (context) => const TelaExibeQR(),
        '/gerenciarContatos': (context) => const TelaGerenciarContatos(),
        '/addVisitante': (context) => const TelaAddVisitante(),
      },
    );
  }
}
