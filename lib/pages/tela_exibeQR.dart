import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tcc/models/visita.dart';

class TelaExibeQR extends StatelessWidget {
  const TelaExibeQR({super.key});

  @override
  Widget build(BuildContext context) {
    var visita = ModalRoute.of(context)!.settings.arguments as Visita;
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
      body: Center(
        child: QrImageView(
          data:
              '${visita.visitante.nome}#${visita.visitante.cpf}#${visita.date}',
          version: QrVersions.auto,
          size: 400,
          gapless: false,
        ),
      ),
    );
  }
}
