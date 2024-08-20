import 'package:contact_app/features/contact_info/data/models/contact_info_model.dart';
import 'package:contact_app/features/contact_info/domain/repositories/contact_info_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetContactInfoUseCase {
  final ContactInfoRepository _repository;

  GetContactInfoUseCase(this._repository);

  Future<Either<void, ContactInfoModel>> getContact(
      {required String contactId}) async {
    return await _repository.getContact(contactId: contactId);
  }
}