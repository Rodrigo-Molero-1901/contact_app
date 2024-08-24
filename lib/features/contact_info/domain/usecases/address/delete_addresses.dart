import 'package:contact_app/features/contact_info/data/repositories/address_repository_impl.dart';
import 'package:contact_app/features/contact_info/domain/repositories/address_repository.dart';
import 'package:fpdart/fpdart.dart';

class DeleteAddressesUseCase {
  late final AddressRepository _repository;

  DeleteAddressesUseCase() {
    _repository = AddressRepositoryImpl();
  }

  Future<Either<void, bool>> deleteAddresses(
      {required List<int> addressObjectIds}) async {
    return await _repository.deleteAddresses(
        addressObjectIds: addressObjectIds);
  }
}
