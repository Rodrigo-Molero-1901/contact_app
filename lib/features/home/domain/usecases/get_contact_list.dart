import 'package:contact_app/features/home/data/models/contact_model.dart';
import 'package:contact_app/features/home/data/repositories/contact_list_repository_impl.dart';
import 'package:contact_app/features/home/domain/repositories/contact_list_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetContactListUseCase {
  late final ContactListRepository _repository;

  GetContactListUseCase() {
    _repository = ContactListRepositoryImpl();
  }

  Future<Either<void, List<ContactModel>>> getContactList() async {
    return await _repository.getContactList();
  }
}
