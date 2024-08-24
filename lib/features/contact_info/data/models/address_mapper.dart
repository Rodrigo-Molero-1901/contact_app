import 'package:contact_app/core/service/entities/address.dart';
import 'package:contact_app/features/contact_info/data/models/address_model.dart';

AddressModel addressModelFromEntity(Address entity) {
  return AddressModel(
    objectId: entity.objectId,
    streetAddress: entity.streetAddress,
    city: entity.city,
    state: entity.state,
    zipCode: entity.zipCode,
  );
}

Address addressModelToEntity(AddressModel model) {
  return Address(
    objectId: model.objectId ?? 0,
    streetAddress: model.streetAddress ?? '',
    city: model.city ?? '',
    state: model.state ?? '',
    zipCode: model.zipCode ?? '',
  );
}
