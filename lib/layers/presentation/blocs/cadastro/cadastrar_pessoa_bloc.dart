import 'package:aulachata/core/datastorage/shared_preferences_imp.dart';
import 'package:aulachata/layers/data/datasource/pessoa_datasoruce_imp.dart';
import 'package:aulachata/layers/data/repostiories/pessoa_repository_imp.dart';
import 'package:aulachata/layers/domain/usecases/cadastrar_pessoas_usecase.dart';
import 'package:aulachata/layers/presentation/blocs/cadastro/cadastrar_pessoa_evento.dart';
import 'package:aulachata/layers/presentation/blocs/cadastro/cadastrar_pessoa_estado.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CadastrarPessoaBloc
    extends Bloc<CadastrarPessoaEvento, CadastrarPessoaEstado> {
  CadastrarPessoaBloc() : super(EstadoInicialCadastro()) {
    on(_mapEventToState);
  }
  void _mapEventToState(CadastrarPessoaEvento event, Emitter emit) async {
    var client = SharedPreferencesImp();
    var datasource = PessoaDatasourceImp(client: client);
    var repository = PessoaRepositoryImp(datasource: datasource);
    if (event is EventoRegistrarPessoa) {
      emit(EstadoCarregamentoCadastro());

      final usecase = CadastrarPessoaUsecase(repository: repository);

      var token = await usecase.call(event.pessoa);

      await Future.delayed(const Duration(seconds: 5));
      token.fold(
        (failure) {
          emit(EstadoErroCadastro());
        },
        (success) {
          emit(EstadoCarregadoCadastro());
        },
      );
    }
  }
}
