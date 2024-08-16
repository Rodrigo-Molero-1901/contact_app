import 'package:contact_app/features/home/domain/usecases/get_contact_list.dart';
import 'package:contact_app/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetContactListUseCase _getContactListUseCase;

  HomeCubit({
    required GetContactListUseCase getContactListUseCase,
  })  : _getContactListUseCase = getContactListUseCase,
        super(HomeLoading());

  void _emitMain() {
    emit(
      HomeMain(
        viewModel: HomeViewModel(),
      ),
    );
  }
}
