import 'package:contact_app/features/contact_info/data/models/address_model.dart';
import 'package:contact_app/features/contact_info/data/models/contact_info_model.dart';
import 'package:contact_app/features/contact_info/presentation/utils/enums.dart';
import 'package:contact_app/features/contact_info/presentation/viewmodels/address_view_model.dart';

class ContactInfoViewModel {
  final ContactInfoStatus contactInfoStatus;
  final ContactInfoPageType contactInfoPageType;
  final int objectId;
  final String contactId;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final List<AddressViewModel> addressesViewModels;

  ContactInfoViewModel({
    required this.contactInfoStatus,
    required this.contactInfoPageType,
    required ContactInfoModel contact,
    required List<AddressModel> addresses,
  })  : objectId = contact.objectId ?? 0,
        contactId = contact.contactId ?? '',
        firstName = contact.firstName ?? '',
        lastName = contact.lastName ?? '',
        phoneNumber = contact.phoneNumber ?? '',
        addressesViewModels =
            addresses.map(AddressViewModel.fromModel).toList();

  String get fullName => '$firstName $lastName';

  String get letterIdentifier => firstName[0];

  String get displayPhoneNumber =>
      phoneNumber.isEmpty ? '' : 'Phone number: $phoneNumber';
}
