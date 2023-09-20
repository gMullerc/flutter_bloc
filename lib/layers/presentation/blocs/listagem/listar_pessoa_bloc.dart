import 'package:aulachata/core/datastorage/shared_preferences_imp.dart';
import 'package:aulachata/core/usecase/usecase.dart';
import 'package:aulachata/layers/data/datasource/pessoa_datasoruce_imp.dart';
import 'package:aulachata/layers/data/repostiories/pessoa_repository_imp.dart';
import 'package:aulachata/layers/domain/usecases/listar_pessoas_usecase.dart';
import 'package:aulachata/layers/presentation/blocs/cadastro/cadastrar_pessoa_evento.dart';
import 'package:aulachata/layers/presentation/blocs/listagem/listar_pessoa_estado.dart';
import 'package:aulachata/layers/presentation/blocs/listagem/listar_pessoa_evento.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListarPessoaBloc extends Bloc<ListarPessoaEvento, ListarPessoaEstado> {
  ListarPessoaBloc() : super(EstadoInicialListagem()) {
    on(_mapEventToState);
  }
  void _mapEventToState(ListarPessoaEvento event, Emitter emit) async {
    var client = SharedPreferencesImp();
    var datasource = PessoaDatasourceImp(client: client);
    var repository = PessoaRepositoryImp(datasource: datasource);
    if (event is EventoListarPessoas) {
      emit(EstadoCarregamentoListagem());

      final usecase = ListarPessoasUsecase(repository: repository);

      var result = await usecase.call(NoParams());

      await Future.delayed(const Duration(seconds: 5));
      result.fold(
        (failure) {
          emit(EstadoErroListagem());
        },
        (success) {
          emit(EstadoCarregadoListagem(pessoas: success));
        },
      );
    }
  }
}
