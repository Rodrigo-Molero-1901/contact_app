import 'package:contact_app/core/service/entities/contact_info.dart';
import 'package:contact_app/features/contact_info/data/models/contact_info_model.dart';
import 'package:contact_app/features/contact_info/data/repositories/contact_info_repository_impl.dart';
import 'package:contact_app/features/contact_info/domain/repositories/contact_info_repository.dart';
import 'package:fpdart/fpdart.dart';

class UpdateContactUseCase {
  late final ContactInfoRepository _repository;

  UpdateContactUseCase() {
    _repository = ContactInfoRepositoryImpl();
  }

  Future<Either<void, ContactInfoModel>> updateContact(
      {required ContactInfo contactInfo}) async {
    return await _repository.updateContact(contactInfo: contactInfo);
  }
}
