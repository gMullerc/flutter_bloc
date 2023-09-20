import 'package:aulachata/layers/presentation/screens/tela_cadastro.dart';
import 'package:aulachata/layers/presentation/screens/tela_listagem.dart';
import 'package:aulachata/layers/presentation/widgets/card_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _navegarParaCadastro() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TelaCadastro(),
      ),
    );
  }

  _navegarParaListagem() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TelaListagem(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorScheme.dark().primary,
        title: const Text(
          "Tela inicial",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CardMenu(
              icon: Icon(Icons.add, size: 42, color: Colors.white),
              titulo: "Cadastrar pessoas",
              navigateTo: _navegarParaCadastro,
            ),
            CardMenu(
              icon: Icon(Icons.people, size: 42, color: Colors.white),
              titulo: "Listar pessoas",
              navigateTo: _navegarParaListagem,
            )
          ],
        ),
      ),
    );
  }
}
