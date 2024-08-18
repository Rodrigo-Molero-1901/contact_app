import 'package:contact_app/features/home/data/models/contact_model.dart';
import 'package:contact_app/features/home/domain/usecases/get_contact_list.dart';
import 'package:contact_app/features/home/presentation/utils/enums.dart';
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

  var _contactListStatus = ContactListStatus.loading;
  var _contactList = <ContactModel>[];

  Future<void> initialize() async {
    _emitMain();
    await _getContactList();
    _emitMain();
  }

  Future<void> _getContactList() async {
    final result = await _getContactListUseCase.getContactList();
    result.fold(
      (error) {
        _contactListStatus = ContactListStatus.error;
      },
      (contactModelList) {
        _contactListStatus = ContactListStatus.success;
        _contactList = contactModelList;
      },
    );
  }

  void _emitMain() {
    emit(
      HomeMain(
        viewModel: HomeViewModel(
          contactListStatus: _contactListStatus,
          contactList: _contactList,
        ),
      ),
    );
  }
}
