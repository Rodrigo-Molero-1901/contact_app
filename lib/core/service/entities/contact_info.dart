import 'package:objectbox/objectbox.dart';

@Entity()
class ContactInfo {
  @Id()
  int objectId;
  String contactId;
  String firstName;
  String lastName;
  String phoneNumber;
  String streetAddress1;
  String streetAddress2;
  String city;
  String state;
  String zipCode;

  ContactInfo({
    this.objectId = 0,
    required this.contactId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.streetAddress1,
    required this.streetAddress2,
    required this.city,
    required this.state,
    required this.zipCode,
  });

  factory ContactInfo.fromJson(Map<String, dynamic>? json) {
    return ContactInfo(
      contactId: json?['contactID'] ?? '',
      firstName: json?['firstName'] ?? '',
      lastName: json?['lastName'] ?? '',
      phoneNumber: json?['phoneNumber'] ?? '',
      streetAddress1: json?['streetAddress1'] ?? '',
      streetAddress2: json?['streetAddress2'] ?? '',
      city: json?['city'] ?? '',
      state: json?['state'] ?? '',
      zipCode: json?['zipCode'] ?? '',
    );
  }
}
