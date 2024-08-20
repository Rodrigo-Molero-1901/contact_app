part of 'contact_model.dart';

ContactModel contactModelFromEntity(ContactInfo entity) {
  return ContactModel(
    objectId: entity.objectId,
    contactId: entity.contactId,
    firstName: entity.firstName,
    lastName: entity.lastName,
  );
}
