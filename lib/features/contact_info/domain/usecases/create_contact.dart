import 'package:contact_app/core/service/entities/contact_info.dart';
import 'package:contact_app/features/contact_info/data/models/contact_info_model.dart';
import 'package:contact_app/features/contact_info/domain/repositories/contact_info_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateContactUseCase {
  final ContactInfoRepository _repository;

  CreateContactUseCase(this._repository);

  Future<Either<void, ContactInfoModel>> createContact(
      {required ContactInfo contactInfo}) async {
    return await _repository.createContact(contactInfo: contactInfo);
  }
}
