import 'package:contact_app/core/service/entities/contact_info.dart';
import 'package:contact_app/features/contact_info/data/models/contact_info_model.dart';

ContactInfoModel contactInfoModelFromEntity(ContactInfo entity) {
  return ContactInfoModel(
    objectId: entity.objectId,
    contactId: entity.contactId,
    firstName: entity.firstName,
    lastName: entity.lastName,
    phoneNumber: entity.phoneNumber,
    streetAddress1: entity.streetAddress1,
    streetAddress2: entity.streetAddress2,
    city: entity.city,
    state: entity.state,
    zipCode: entity.zipCode,
  );
}

ContactInfo contactInfoModelToEntity(ContactInfoModel model) {
  return ContactInfo(
    objectId: model.objectId ?? 0,
    contactId: model.contactId ?? '',
    firstName: model.firstName ?? '',
    lastName: model.lastName ?? '',
    phoneNumber: model.phoneNumber ?? '',
    streetAddress1: model.streetAddress1 ?? '',
    streetAddress2: model.streetAddress2 ?? '',
    city: model.city ?? '',
    state: model.state ?? '',
    zipCode: model.zipCode ?? '',
  );
}
