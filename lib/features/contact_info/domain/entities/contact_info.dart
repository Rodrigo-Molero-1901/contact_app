import 'package:objectbox/objectbox.dart';

@Entity()
class ContactInformationEntity {
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

  ContactInformationEntity({
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
}
