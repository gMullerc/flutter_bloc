import 'package:aulachata/layers/presentation/blocs/cadastro/cadastrar_pessoa_bloc.dart';
import 'package:aulachata/layers/presentation/blocs/listagem/listar_pessoa_bloc.dart';
import 'package:aulachata/layers/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CadastrarPessoaBloc(),
        ),
        BlocProvider(
          create: (context) => ListarPessoaBloc(),
        ),
      ],
      child: MaterialApp(
        title: '',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            primaryColor: Colors.deepPurple),
        home: const HomeScreen(),
      ),
    );
  }
}
