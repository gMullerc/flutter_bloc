import 'package:aulachata/layers/domain/entities/documentos_entity.dart';
import 'package:aulachata/layers/domain/entities/pessoa_entity.dart';
import 'package:aulachata/layers/presentation/blocs/cadastro/cadastrar_pessoa_bloc.dart';
import 'package:aulachata/layers/presentation/blocs/cadastro/cadastrar_pessoa_evento.dart';
import 'package:aulachata/layers/presentation/blocs/cadastro/cadastrar_pessoa_estado.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/generic_text_form_field.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final nomeController = TextEditingController();
  final sobrenomeController = TextEditingController();
  final etniaController = TextEditingController();
  final generoController = TextEditingController();
  final rgController = TextEditingController();
  final cpfController = TextEditingController();
  final certidaoNascimentoController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late final CadastrarPessoaBloc blocProvider;
  @override
  void initState() {
    blocProvider = CadastrarPessoaBloc();
    super.initState();
  }

  void _cadastrarPessoa() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final pessoaEntity = PessoaEntity(
      nome: nomeController.text,
      sobrenome: sobrenomeController.text,
      etnia: etniaController.text,
      genero: generoController.text,
      documentos: DocumentosEntity(
          cpf: cpfController.text,
          rg: rgController.text,
          certidaoNascimento: certidaoNascimentoController.text),
    );
    blocProvider.add(EventoRegistrarPessoa(pessoa: pessoaEntity));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Pessoas'),
        centerTitle: true,
        backgroundColor: const ColorScheme.dark().primary,
      ),
      body: BlocConsumer<CadastrarPessoaBloc, CadastrarPessoaEstado>(
        bloc: blocProvider,
        listener: (context, state) {
          if (state is EstadoCarregadoCadastro) {
            return Navigator.pop(context);
          } else if (state is EstadoErroCadastro) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Ocorreu um erro ao criar um usuario"),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is EstadoCarregamentoCadastro) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              child: Container(
                color: Colors.white,
                margin:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.9,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text(
                            "Dados Pessoais",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          GenericTextFormField(
                            controller: nomeController,
                            function: (newValue) =>
                                nomeController.text = newValue,
                            title: 'Nome',
                          ),
                          GenericTextFormField(
                            controller: sobrenomeController,
                            function: (newValue) =>
                                sobrenomeController.text = newValue,
                            title: 'Sobrenome',
                          ),
                          GenericTextFormField(
                            controller: generoController,
                            function: (newValue) =>
                                generoController.text = newValue,
                            title: 'Gênero',
                          ),
                          GenericTextFormField(
                            controller: etniaController,
                            function: (newValue) =>
                                etniaController.text = newValue,
                            title: 'Etnia',
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text(
                            "Documentos",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          GenericTextFormField(
                            controller: rgController,
                            function: (newValue) =>
                                rgController.text = newValue,
                            title: 'Rg',
                          ),
                          GenericTextFormField(
                            controller: cpfController,
                            function: (newValue) =>
                                cpfController.text = newValue,
                            title: 'CPF',
                          ),
                          GenericTextFormField(
                            controller: certidaoNascimentoController,
                            function: (newValue) =>
                                certidaoNascimentoController.text = newValue,
                            title: 'Certidao de nascimento',
                          ),
                          ElevatedButton(
                            onPressed: _cadastrarPessoa,
                            child: const Text(
                              "Cadastrar Pessoa",
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
