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

  Future<Either<void, ContactInfo>> getContact(
      {required String contactId}) async {
    try {
      final contact =
          await _api.contactApi.getContactInfo(contactId: contactId);
      if (contact != null) return Right(contact);
      return const Left(null);
    } catch (_) {
      return const Left(null);
    }
  }

  Future<Either<void, ContactInfo>> createContact(
      {required ContactInfo contactInfo}) async {
    try {
      final createdContact =
          await _api.contactApi.createContact(contactInfo: contactInfo);
      return Right(createdContact);
    } catch (_) {
      return const Left(null);
    }
  }

  Future<Either<void, ContactInfo>> updateContact(
      {required ContactInfo contactInfo}) async {
    try {
      final updatedContact =
          await _api.contactApi.updateContact(contactInfo: contactInfo);
      return Right(updatedContact);
    } catch (_) {
      return const Left(null);
    }
  }

  Future<Either<void, bool>> deleteContact({required int objectId}) async {
    try {
      final contactWasDeleted =
          await _api.contactApi.deleteContact(objectId: objectId);
      return Right(contactWasDeleted);
    } catch (_) {
      return const Left(null);
    }
  }
}
