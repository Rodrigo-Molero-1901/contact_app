import 'package:contact_app/core/service/entities/contact_info.dart';
import 'package:contact_app/features/contact_info/data/models/contact_info_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class ContactInfoRepository {
  Future<Either<void, ContactInfoModel>> getContact(
      {required String contactId});

  Future<Either<void, ContactInfoModel>> createContact(
      {required ContactInfo contactInfo});

  Future<Either<void, ContactInfoModel>> updateContact(
      {required ContactInfo contactInfo});

  Future<Either<void, bool>> deleteContact({required int objectId});
}
