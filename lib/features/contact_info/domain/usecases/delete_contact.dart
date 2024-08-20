import 'package:contact_app/features/contact_info/domain/repositories/contact_info_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteContactUseCase {
  final ContactInfoRepository _repository;

  DeleteContactUseCase(this._repository);

  Future<Either<void, bool>> deleteContact({required int objectId}) async {
    return await _repository.deleteContact(objectId: objectId);
  }
}
