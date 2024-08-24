import 'package:contact_app/features/contact_info/data/models/address_model.dart';

class ContactInfoModel {
  int? objectId;
  String? contactId;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? city;
  String? state;
  String? zipCode;
  List<AddressModel>? addresses;

  ContactInfoModel({
    this.objectId,
    this.contactId,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.city,
    this.state,
    this.zipCode,
    this.addresses,
  });
}
