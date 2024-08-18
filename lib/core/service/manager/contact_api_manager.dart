import 'package:contact_app/core/service/api/api.dart';
import 'package:contact_app/core/service/entities/contact_info.dart';
import 'package:fpdart/fpdart.dart';

class ContactApiManager {
  final Api _api;

  ContactApiManager(this._api);

  Future<Either<void, List<ContactInfo>>> getContactList() async {
    try {
      final contactList = await _api.contactApi.getContactList();
      return Right(contactList);
    } catch (_) {
      return const Left(null);
    }
  }
}
