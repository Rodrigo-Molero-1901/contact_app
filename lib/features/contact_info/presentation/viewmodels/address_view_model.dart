import 'package:contact_app/features/contact_info/data/models/address_model.dart';

class AddressViewModel {
  final int objectId;
  final String streetAddress;
  final String city;
  final String state;
  final String zipCode;

  AddressViewModel({
    required this.objectId,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.zipCode,
  });

  factory AddressViewModel.fromModel(AddressModel model) {
    return AddressViewModel(
      objectId: model.objectId ?? 0,
      streetAddress: model.streetAddress ?? '',
      city: model.city ?? '',
      state: model.state ?? '',
      zipCode: model.zipCode ?? '',
    );
  }

  String get displayStreetAddress =>
      streetAddress.isEmpty ? 'Address' : streetAddress;

  String get displayCity => city.isEmpty ? 'City' : city;

  String get displayState => state.isEmpty ? 'State' : state;

  String get displayZipCode => zipCode.isEmpty ? 'Zip Code' : zipCode;
}
