import 'package:contact_app/features/contact_info/data/repositories/contact_info_repository_impl.dart';
import 'package:contact_app/features/contact_info/domain/repositories/contact_info_repository.dart';
import 'package:fpdart/fpdart.dart';

class DeleteContactUseCase {
  late final ContactInfoRepository _repository;

  DeleteContactUseCase() {
    _repository = ContactInfoRepositoryImpl();
  }

  Future<Either<void, bool>> deleteContact({required int objectId}) async {
    return await _repository.deleteContact(objectId: objectId);
  }
}
