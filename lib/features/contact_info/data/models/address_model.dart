class AddressModel {
  int? objectId;
  String? streetAddress;
  String? city;
  String? state;
  String? zipCode;

  AddressModel({
    this.objectId,
    this.streetAddress,
    this.city,
    this.state,
    this.zipCode,
  });

  bool get isEmpty {
    return (streetAddress ?? '').isEmpty &&
        (city ?? '').isEmpty &&
        (state ?? '').isEmpty &&
        (zipCode ?? '').isEmpty;
  }
}
