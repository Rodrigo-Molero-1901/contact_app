import 'package:contact_app/core/service/entities/contact_info.dart';
import 'package:contact_app/core/service/manager/api_manager.dart';
import 'package:contact_app/features/contact_info/data/models/contact_info_mapper.dart';
import 'package:contact_app/features/contact_info/data/models/contact_info_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:contact_app/features/contact_info/domain/repositories/contact_info_repository.dart';

@Injectable(as: ContactInfoRepository)
class ContactInfoRepositoryImpl implements ContactInfoRepository {
  final ApiManager _apiManager;

  ContactInfoRepositoryImpl({
    required ApiManager apiManager,
  }) : _apiManager = apiManager;

  @override
  Future<Either<void, ContactInfoModel>> getContact(
      {required String contactId}) async {
    final createdContactResponse =
        await _apiManager.contactApiManager.getContact(contactId: contactId);
    return createdContactResponse.fold(
      (error) => Left(error),
      (response) => Right(contactInfoModelFromEntity(response)),
    );
  }

  @override
  Future<Either<void, ContactInfoModel>> createContact(
      {required ContactInfo contactInfo}) async {
    final createdContactResponse = await _apiManager.contactApiManager
        .createContact(contactInfo: contactInfo);
    return createdContactResponse.fold(
      (error) => Left(error),
      (response) => Right(contactInfoModelFromEntity(response)),
    );
  }

  @override
  Future<Either<void, ContactInfoModel>> updateContact(
      {required ContactInfo contactInfo}) async {
    final updatedContactResponse = await _apiManager.contactApiManager
        .updateContact(contactInfo: contactInfo);
    return updatedContactResponse.fold(
      (error) => Left(error),
      (response) => Right(contactInfoModelFromEntity(response)),
    );
  }

  @override
  Future<Either<void, bool>> deleteContact({required int objectId}) async {
    final deletedContactResponse =
        await _apiManager.contactApiManager.deleteContact(objectId: objectId);
    return deletedContactResponse.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }
}
