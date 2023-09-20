import 'package:aulachata/layers/presentation/blocs/listagem/listar_pessoa_bloc.dart';
import 'package:aulachata/layers/presentation/blocs/listagem/listar_pessoa_estado.dart';
import 'package:aulachata/layers/presentation/blocs/listagem/listar_pessoa_evento.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TelaListagem extends StatefulWidget {
  const TelaListagem({super.key});

  @override
  State<TelaListagem> createState() => _TelaListagemState();
}

class _TelaListagemState extends State<TelaListagem> {
  late final ListarPessoaBloc blocProvider;
  @override
  void initState() {
    blocProvider = ListarPessoaBloc();
    blocProvider.add(EventoListarPessoas());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Listar pessoas',
          ),
          centerTitle: true,
          backgroundColor: const ColorScheme.dark().primary,
        ),
        body: BlocConsumer<ListarPessoaBloc, ListarPessoaEstado>(
          bloc: blocProvider,
          builder: (context, state) {
            if (state is EstadoCarregamentoListagem) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is EstadoCarregadoListagem) {
              return ListView.builder(
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                      title: Text(
                          "${state.pessoas[index].nome} ${state.pessoas[index].sobrenome}"),
                      subtitle: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Gênero: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: const ColorScheme.dark().primary)),
                            TextSpan(
                                text: "${state.pessoas[index].genero} ",
                                style: const TextStyle(color: Colors.black)),
                            TextSpan(
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: const ColorScheme.dark().primary),
                                text: "Etnia: "),
                            TextSpan(
                                text: "${state.pessoas[index].etnia} ",
                                style: const TextStyle(color: Colors.black)),
                          ],
                        ),
                      )),
                ),
                itemCount: state.pessoas.length,
              );
            } else {
              return const Center(
                child: Text('data'),
              );
            }
          },
          listener: (context, state) {},
        ));
  }
}
