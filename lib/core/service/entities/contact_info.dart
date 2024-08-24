import 'package:contact_app/core/service/entities/address.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ContactInfo {
  @Id()
  int objectId;
  String contactId;
  String firstName;
  String lastName;
  String phoneNumber;

  @Backlink()
  final addresses = ToMany<Address>();

  ContactInfo({
    this.objectId = 0,
    required this.contactId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  factory ContactInfo.fromJson(Map<String, dynamic>? json) {
    return ContactInfo(
      contactId: json?['contactID'] ?? '',
      firstName: json?['firstName'] ?? '',
      lastName: json?['lastName'] ?? '',
      phoneNumber: json?['phoneNumber'] ?? '',
    );
  }

  @override
  String toString() {
    return 'ContactInfo(firstName: $firstName, lastName: $lastName)';
  }
}
