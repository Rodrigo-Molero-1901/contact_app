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
  final String streetAddress1;
  final String streetAddress2;
  final String city;
  final String state;
  final String zipCode;

  ContactInfoViewModel({
    required this.contactInfoStatus,
    required this.contactInfoPageType,
    required ContactInfoModel contact,
  })  : objectId = contact.objectId ?? 0,
        contactId = contact.contactId ?? '',
        firstName = contact.firstName ?? '',
        lastName = contact.lastName ?? '',
        phoneNumber = contact.phoneNumber ?? '',
        streetAddress1 = contact.streetAddress1 ?? '',
        streetAddress2 = contact.streetAddress2 ?? '',
        city = contact.city ?? '',
        state = contact.state ?? '',
        zipCode = contact.zipCode ?? '';

  String get fullName => '$firstName $lastName';

  String get letterIdentifier => firstName[0];

  String get displayPhoneNumber => 'Phone number: $phoneNumber';
}
