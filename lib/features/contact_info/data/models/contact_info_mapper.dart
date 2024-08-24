import 'package:contact_app/core/service/entities/contact_info.dart';
import 'package:contact_app/features/contact_info/data/models/address_mapper.dart';
import 'package:contact_app/features/contact_info/data/models/contact_info_model.dart';

ContactInfoModel contactInfoModelFromEntity(ContactInfo entity) {
  return ContactInfoModel(
    objectId: entity.objectId,
    contactId: entity.contactId,
    firstName: entity.firstName,
    lastName: entity.lastName,
    phoneNumber: entity.phoneNumber,
    addresses: entity.addresses.map((e) => addressModelFromEntity(e)).toList(),
  );
}

ContactInfo contactInfoModelToEntity(ContactInfoModel model) {
  return ContactInfo(
    objectId: model.objectId ?? 0,
    contactId: model.contactId ?? '',
    firstName: model.firstName ?? '',
    lastName: model.lastName ?? '',
    phoneNumber: model.phoneNumber ?? '',
  );
}
