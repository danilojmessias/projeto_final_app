import 'package:flutter/material.dart';

class TelaAgendamentos extends StatefulWidget {
  const TelaAgendamentos({super.key});

  @override
  State<TelaAgendamentos> createState() => _TelaAgendamentosState();
}

class _TelaAgendamentosState extends State<TelaAgendamentos> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            child: const Column(
              children: [
                Center(
                  child: Text(
                    'Olá, Usuário!',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Próximos eventos',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Expanded(
            child: Image(
              width: 300,
              image: AssetImage('assets/images/buildings.png'),
            ),
          ),
        ],
      ),
    );
  }
}
