import 'package:contact_app/features/home/data/models/contact_model.dart';
import 'package:contact_app/features/home/domain/usecases/get_contact_list.dart';
import 'package:contact_app/features/home/presentation/utils/enums.dart';
import 'package:contact_app/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  late final GetContactListUseCase _getContactListUseCase;
  late final Logger _logger;

  HomeCubit() : super(HomeLoading()) {
    _getContactListUseCase = GetContactListUseCase();
    _logger = Logger();
  }

  var _contactListStatus = ContactListStatus.loading;
  var _contactList = <ContactModel>[];

  Future<void> initialize() async {
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

  void _emitMain({
    HomeNavigationViewModel? navigation,
  }) {
    emit(
      HomeMain(
        viewModel: HomeViewModel(
          contactListStatus: _contactListStatus,
          contactList: _contactList,
          navigation: navigation,
        ),
      ),
    );
  }

  void onCreateContactTapped() {
    _logger.d('Navigating to create contact...');
    _emitMain(navigation: HomeAddContactNavigation());
  }

  void onContactTapped(String contactId) {
    _logger.d('Navigating to contact info...');

    _emitMain(
      navigation: HomeContactInfoNavigation(contactId: contactId),
    );
  }

  void onCall(String contactId) {
    final contact =
        _contactList.firstWhere((contact) => contact.contactId == contactId);
    _logger.d('Calling ${contact.firstName}');
  }

  void onMessage(String contactId) {
    final contact =
        _contactList.firstWhere((contact) => contact.contactId == contactId);
    _logger.d('Sending SMS to ${contact.firstName}');
  }
}
