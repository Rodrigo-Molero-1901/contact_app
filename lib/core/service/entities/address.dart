import 'package:contact_app/core/service/entities/contact_info.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Address {
  @Id()
  int objectId;
  String streetAddress;
  String city;
  String state;
  String zipCode;

  final contact = ToOne<ContactInfo>();

  Address({
    this.objectId = 0,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.zipCode,
  });

  factory Address.fromJson(Map<String, dynamic>? json) {
    return Address(
      streetAddress: json?['streetAddress'] ?? '',
      city: json?['city'] ?? '',
      state: json?['state'] ?? '',
      zipCode: json?['zipCode'] ?? '',
    );
  }
}
