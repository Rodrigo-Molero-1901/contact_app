import 'package:contact_app/core/service/entities/contact_info.dart';
import 'package:contact_app/features/contact_info/data/models/contact_info_model.dart';
import 'package:contact_app/features/contact_info/data/repositories/contact_info_repository_impl.dart';
import 'package:contact_app/features/contact_info/domain/repositories/contact_info_repository.dart';
import 'package:fpdart/fpdart.dart';

class CreateContactUseCase {
  late final ContactInfoRepository _repository;

  CreateContactUseCase() {
    _repository = ContactInfoRepositoryImpl();
  }

  Future<Either<void, ContactInfoModel>> createContact(
      {required ContactInfo contactInfo}) async {
    return await _repository.createContact(contactInfo: contactInfo);
  }
}
