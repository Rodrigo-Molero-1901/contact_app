import 'package:contact_app/features/home/data/models/contact_model.dart';
import 'package:contact_app/features/home/domain/repositories/contact_list_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetContactListUseCase {
  final ContactListRepository _repository;

  GetContactListUseCase(this._repository);

  Future<Either<void, List<ContactModel>>> getContactList() async {
    return await _repository.getContactList();
  }
}
