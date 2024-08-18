import 'package:contact_app/core/service/entities/contact_info.dart';

part 'contact_mapper.dart';

class ContactModel {
  int? objectId;
  String? contactId;
  String? firstName;
  String? lastName;

  ContactModel({
    this.objectId,
    this.contactId,
    this.firstName,
    this.lastName,
  });
}
