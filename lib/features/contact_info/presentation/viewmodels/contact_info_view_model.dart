import 'package:contact_app/features/contact_info/data/models/address_model.dart';
import 'package:contact_app/features/contact_info/data/models/contact_info_model.dart';
import 'package:contact_app/features/contact_info/presentation/utils/enums.dart';

class ContactInfoViewModel {
  final ContactInfoStatus contactInfoStatus;
  final ContactInfoPageType contactInfoPageType;
  final int objectId;
  final String contactId;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String city;
  final String state;
  final String zipCode;
  final List<String> addresses;

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
        city = contact.city ?? '',
        state = contact.state ?? '',
        zipCode = contact.zipCode ?? '',
        addresses = addresses.map((model) => model.addressName ?? '').toList();

  String get fullName => '$firstName $lastName';

  String get letterIdentifier => firstName[0];

  String get displayPhoneNumber =>
      phoneNumber.isEmpty ? '' : 'Phone number: $phoneNumber';
}
