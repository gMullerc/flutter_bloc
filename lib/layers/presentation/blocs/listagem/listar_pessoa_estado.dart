import 'package:aulachata/layers/domain/entities/pessoa_entity.dart';

abstract class ListarPessoaEstado {}

class EstadoCarregamentoListagem extends ListarPessoaEstado {}

class EstadoErroListagem extends ListarPessoaEstado {}

class EstadoCarregadoListagem extends ListarPessoaEstado {
  final List<PessoaEntity> pessoas;
  EstadoCarregadoListagem({required this.pessoas});
}

class EstadoInicialListagem extends ListarPessoaEstado {}
