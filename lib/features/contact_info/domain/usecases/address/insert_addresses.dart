import 'package:contact_app/core/service/entities/address.dart';
import 'package:contact_app/features/contact_info/data/models/address_model.dart';
import 'package:contact_app/features/contact_info/data/repositories/address_repository_impl.dart';
import 'package:contact_app/features/contact_info/domain/repositories/address_repository.dart';
import 'package:fpdart/fpdart.dart';

class InsertAddressesUseCase {
  late final AddressRepository _repository;

  InsertAddressesUseCase() {
    _repository = AddressRepositoryImpl();
  }

  Future<Either<void, List<AddressModel>>> insertAddresses(
      {required List<Address> addresses}) async {
    return await _repository.insertAddresses(addresses: addresses);
  }
}
