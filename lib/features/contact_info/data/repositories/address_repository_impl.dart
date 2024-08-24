import 'package:contact_app/core/service/entities/address.dart';
import 'package:contact_app/core/service/manager/api_manager.dart';
import 'package:contact_app/features/contact_info/data/models/address_mapper.dart';
import 'package:contact_app/features/contact_info/data/models/address_model.dart';
import 'package:contact_app/features/contact_info/domain/repositories/address_repository.dart';
import 'package:fpdart/fpdart.dart';

class AddressRepositoryImpl implements AddressRepository {
  late final ApiManager _apiManager;

  AddressRepositoryImpl() {
    _apiManager = ApiManager();
  }

  @override
  Future<Either<void, List<AddressModel>>> insertAddresses(
      {required List<Address> addresses}) async {
    final insertedAddressesResponse = await _apiManager.addressApiManager
        .insertAddresses(addresses: addresses);
    return insertedAddressesResponse.fold(
      (error) => Left(error),
      (response) => Right(response.map(addressModelFromEntity).toList()),
    );
  }

  @override
  Future<Either<void, bool>> deleteAddresses(
      {required List<int> addressObjectIds}) async {
    final deletedAddressesResponse = await _apiManager.addressApiManager
        .deleteAddresses(addressObjectIds: addressObjectIds);
    return deletedAddressesResponse.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }
}
