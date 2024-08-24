import 'package:contact_app/core/service/api/api.dart';
import 'package:contact_app/core/service/entities/address.dart';
import 'package:fpdart/fpdart.dart';

class AddressApiManager {
  final Api _api;

  AddressApiManager(this._api);

  Future<Either<void, List<Address>>> insertAddresses(
      {required List<Address> addresses}) async {
    try {
      final insertedAddresses = await _api.addressApi.insertAddresses(
        addresses: addresses,
      );
      return Right(insertedAddresses);
    } catch (_) {
      return const Left(null);
    }
  }

  Future<Either<void, bool>> deleteAddresses(
      {required List<int> addressObjectIds}) async {
    try {
      final addressesWereDeleted = await _api.addressApi.deleteAddresses(
        addressObjectIds: addressObjectIds,
      );
      return Right(addressesWereDeleted);
    } catch (_) {
      return const Left(null);
    }
  }
}
