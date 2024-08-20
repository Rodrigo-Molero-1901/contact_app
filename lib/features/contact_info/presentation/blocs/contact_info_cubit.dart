import 'package:contact_app/core/utils/app_utils.dart';
import 'package:contact_app/di/injection.dart';
import 'package:contact_app/features/contact_info/data/models/contact_info_mapper.dart';
import 'package:contact_app/features/contact_info/data/models/contact_info_model.dart';
import 'package:contact_app/features/contact_info/domain/usecases/create_contact.dart';
import 'package:contact_app/features/contact_info/domain/usecases/delete_contact.dart';
import 'package:contact_app/features/contact_info/domain/usecases/get_contact_info.dart';
import 'package:contact_app/features/contact_info/domain/usecases/update_contact.dart';
import 'package:contact_app/features/contact_info/presentation/utils/enums.dart';
import 'package:contact_app/features/contact_info/presentation/viewmodels/contact_info_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';

part 'contact_info_state.dart';

@injectable
class ContactInfoCubit extends Cubit<ContactInfoState> {
  final GetContactInfoUseCase _getContactInfoUseCase;
  final CreateContactUseCase _createContactUseCase;
  final UpdateContactUseCase _updateContactUseCase;
  final DeleteContactUseCase _deleteContactUseCase;
  late final Logger _logger;

  ContactInfoCubit({
    required GetContactInfoUseCase getContactInfoUseCase,
    required CreateContactUseCase createContactUseCase,
    required UpdateContactUseCase updateContactUseCase,
    required DeleteContactUseCase deleteContactUseCase,
  })  : _getContactInfoUseCase = getContactInfoUseCase,
        _createContactUseCase = createContactUseCase,
        _updateContactUseCase = updateContactUseCase,
        _deleteContactUseCase = deleteContactUseCase,
        _logger = injector<Logger>(),
        super(ContactInfoLoading());

  var _contactInfoStatus = ContactInfoStatus.loading;
  var _contactInfoPageType = ContactInfoPageType.withoutData;
  var _contactInfoEditingStatus = ContactInfoEditingStatus.inactive;
  var _contactInfo = ContactInfoModel();

  Future<void> initialize(String? contactId) async {
    if (contactId != null) {
      _contactInfoPageType = ContactInfoPageType.withData;
      await _getContact(contactId);
    } else {
      _contactInfoPageType = ContactInfoPageType.withoutData;
    }
    _emitMain();
  }

  Future<void> _getContact(String contactId) async {
    final result = await _getContactInfoUseCase.getContact(
      contactId: contactId,
    );
    result.fold(
      (error) {
        _contactInfoStatus = ContactInfoStatus.error;
      },
      (contactInfoModel) {
        _contactInfoStatus = ContactInfoStatus.success;
        _contactInfo = contactInfoModel;
      },
    );
  }

  void _emitMain() {
    emit(
      ContactInfoMain(
        viewModel: ContactInfoViewModel(
          contactInfoStatus: _contactInfoStatus,
          contactInfoPageType: _contactInfoPageType,
          contactInfoEditingStatus: _contactInfoEditingStatus,
          contact: _contactInfo,
        ),
      ),
    );
  }

  void setContact(ContactInfoModel model) {
    _contactInfo = model;
    if ((model.contactId ?? '').isEmpty) {
      _contactInfo.contactId = AppUtils.generateRandomContactID();
    }
  }

  void changeEditingStatus() {
    _contactInfoEditingStatus =
        _contactInfoEditingStatus == ContactInfoEditingStatus.active
            ? ContactInfoEditingStatus.inactive
            : ContactInfoEditingStatus.active;
    _emitMain();
  }

  Future<void> createContact() async {
    final result = await _createContactUseCase.createContact(
      contactInfo: contactInfoModelToEntity(_contactInfo),
    );
    result.fold(
      (error) {
        _logger.d('An error occurred creating the contact...');
      },
      (createdContactModel) {
        _contactInfo = createdContactModel;
      },
    );
  }

  Future<void> updateContact() async {
    final result = await _updateContactUseCase.updateContact(
      contactInfo: contactInfoModelToEntity(_contactInfo),
    );
    result.fold(
      (error) {
        _logger.d('An error occurred updating the contact...');
      },
      (updatedContactModel) {
        _contactInfo = updatedContactModel;
      },
    );
  }

  Future<void> deleteContact() async {
    final result = await _deleteContactUseCase.deleteContact(
      objectId: _contactInfo.objectId ?? 0,
    );
    result.fold(
      (error) {
        _logger.d('An error occurred deleting the contact...');
      },
      (contactWasDeleted) {
        _contactInfo = ContactInfoModel();
      },
    );
  }
}
