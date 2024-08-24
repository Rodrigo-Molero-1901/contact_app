import 'package:contact_app/core/utils/utils.dart';
import 'package:contact_app/features/contact_info/data/models/address_mapper.dart';
import 'package:contact_app/features/contact_info/data/models/address_model.dart';
import 'package:contact_app/features/contact_info/data/models/contact_info_mapper.dart';
import 'package:contact_app/features/contact_info/data/models/contact_info_model.dart';
import 'package:contact_app/features/contact_info/domain/usecases/address/delete_addresses.dart';
import 'package:contact_app/features/contact_info/domain/usecases/address/insert_addresses.dart';
import 'package:contact_app/features/contact_info/domain/usecases/contact/create_contact.dart';
import 'package:contact_app/features/contact_info/domain/usecases/contact/delete_contact.dart';
import 'package:contact_app/features/contact_info/domain/usecases/contact/get_contact_info.dart';
import 'package:contact_app/features/contact_info/domain/usecases/contact/update_contact.dart';
import 'package:contact_app/features/contact_info/presentation/utils/enums.dart';
import 'package:contact_app/features/contact_info/presentation/viewmodels/contact_info_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';

part 'contact_info_state.dart';

class ContactInfoCubit extends Cubit<ContactInfoState> {
  late final GetContactInfoUseCase _getContactInfoUseCase;
  late final CreateContactUseCase _createContactUseCase;
  late final UpdateContactUseCase _updateContactUseCase;
  late final DeleteContactUseCase _deleteContactUseCase;
  late final InsertAddressesUseCase _insertAddressesUseCase;
  late final DeleteAddressesUseCase _deleteAddressesUseCase;
  late final Logger _logger;

  ContactInfoCubit() : super(ContactInfoLoading()) {
    _getContactInfoUseCase = GetContactInfoUseCase();
    _createContactUseCase = CreateContactUseCase();
    _updateContactUseCase = UpdateContactUseCase();
    _deleteContactUseCase = DeleteContactUseCase();
    _insertAddressesUseCase = InsertAddressesUseCase();
    _deleteAddressesUseCase = DeleteAddressesUseCase();
    _logger = Logger();
  }

  var _contactInfoStatus = ContactInfoStatus.loading;
  var _contactInfoPageType = ContactInfoPageType.withoutData;
  var _contactInfo = ContactInfoModel();
  var _addresses = <AddressModel>[];
  var _copyAddresses = <AddressModel>[];

  Future<void> initialize(String? contactId) async {
    if (contactId != null) {
      _contactInfoPageType = ContactInfoPageType.withData;
      await _getContact(contactId);
      _emitMain();
    } else {
      _contactInfoPageType = ContactInfoPageType.withoutData;
      _emitMain(showDetails: false);
    }
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
        _addresses = List.from(contactInfoModel.addresses ?? []);
        _copyAddresses = List.from(_addresses);
      },
    );
  }

  void _emitMain({bool showDetails = true}) {
    ContactInfoViewModel viewModel = ContactInfoViewModel(
      contactInfoStatus: _contactInfoStatus,
      contactInfoPageType: _contactInfoPageType,
      contact: _contactInfo,
      addresses: _addresses,
    );

    emit(
      showDetails
          ? ContactInfoMain(viewModel: viewModel)
          : ContactInfoEditing(viewModel: viewModel),
    );
  }

  void onEditButtonTapped() => _emitMain(showDetails: false);

  void goToContactInfoView() => _emitMain();

  void setContactAndAddresses(ContactInfoModel model) {
    _contactInfo = model;
    if ((model.contactId ?? '').isEmpty) {
      _contactInfo.contactId = AppUtils.generateRandomContactID();
    }

    if (model.addresses != null && model.addresses!.isNotEmpty) {
      _addresses = List.from(model.addresses!);
      _copyAddresses = List.from(_addresses);
    } else {
      _copyAddresses = [];
    }
  }

  Future<void> createContact() async {
    final result = await _createContactUseCase.createContact(
      contactInfo: contactInfoModelToEntity(_contactInfo),
    );
    result.fold(
      (error) {
        _logger.d('An error occurred creating the contact...');
      },
      (createdContactModel) async {
        _contactInfo = createdContactModel;
        if (_copyAddresses.isNotEmpty) {
          await _insertAddresses();
        }
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
      (updatedContactModel) async {
        _contactInfo = updatedContactModel;
        if (_copyAddresses.isNotEmpty) {
          await _insertAddresses();
        } else {
          await _deleteAddresses();
        }
      },
    );
  }

  Future<void> onDeleteButtonTapped() async {
    final result = await _deleteContactUseCase.deleteContact(
      objectId: _contactInfo.objectId ?? 0,
    );
    result.fold(
      (error) {
        _logger.d('An error occurred deleting the contact...');
      },
      (contactWasDeleted) {},
    );
  }

  Future<void> _insertAddresses() async {
    final addressEntitiesList = _addresses.map((addressModel) {
      final entity = addressModelToEntity(addressModel);
      entity.contact.targetId = _contactInfo.objectId;
      return entity;
    }).toList();
    final result = await _insertAddressesUseCase.insertAddresses(
      addresses: addressEntitiesList,
    );
    result.fold(
      (error) {
        _logger.d('An error occurred inserting the addresses...');
      },
      (insertedAddressesModels) {
        _addresses = insertedAddressesModels;
        _copyAddresses = List.from(_addresses);
      },
    );
  }

  Future<void> _deleteAddresses() async {
    final result = await _deleteAddressesUseCase.deleteAddresses(
      addressObjectIds:
          _addresses.map((address) => address.objectId ?? 0).toList(),
    );
    result.fold(
      (error) {
        _logger.d('An error occurred deleting the contact\'s addresses...');
      },
      (addressesWereDeleted) {
        _addresses = [];
        _copyAddresses = [];
      },
    );
  }
}
