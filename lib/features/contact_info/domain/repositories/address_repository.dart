import 'package:contact_app/core/service/entities/address.dart';
import 'package:contact_app/features/contact_info/data/models/address_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class AddressRepository {
  Future<Either<void, List<AddressModel>>> insertAddresses(
      {required List<Address> addresses});

  Future<Either<void, bool>> deleteAddresses(
      {required List<int> addressObjectIds});
}
