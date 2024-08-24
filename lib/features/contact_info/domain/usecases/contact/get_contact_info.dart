import 'package:contact_app/features/contact_info/data/models/contact_info_model.dart';
import 'package:contact_app/features/contact_info/data/repositories/contact_info_repository_impl.dart';
import 'package:contact_app/features/contact_info/domain/repositories/contact_info_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetContactInfoUseCase {
  late final ContactInfoRepository _repository;

  GetContactInfoUseCase() {
    _repository = ContactInfoRepositoryImpl();
  }

  Future<Either<void, ContactInfoModel>> getContact(
      {required String contactId}) async {
    return await _repository.getContact(contactId: contactId);
  }
}
