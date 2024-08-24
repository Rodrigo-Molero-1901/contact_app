import 'package:contact_app/core/service/entities/address.dart';
import 'package:contact_app/features/contact_info/data/models/address_model.dart';

AddressModel addressModelFromEntity(Address entity) {
  return AddressModel(
    objectId: entity.objectId,
    addressName: entity.addressName,
  );
}

Address addressModelToEntity(AddressModel model) {
  return Address(
    objectId: model.objectId ?? 0,
    addressName: model.addressName ?? '',
  );
}
