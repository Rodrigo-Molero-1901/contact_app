import 'package:contact_app/core/service/manager/api_manager.dart';
import 'package:contact_app/features/home/data/models/contact_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:contact_app/features/home/domain/repositories/contact_list_repository.dart';

@Injectable(as: ContactListRepository)
class ContactListRepositoryImpl implements ContactListRepository {
  final ApiManager _apiManager;

  ContactListRepositoryImpl({
    required ApiManager apiManager,
  }) : _apiManager = apiManager;

  @override
  Future<Either<void, List<ContactModel>>> getContactList() async {
    final contactListResponse =
        await _apiManager.contactApiManager.getContactList();
    return contactListResponse.fold(
      (error) => Left(error),
      (response) => Right(response.map(contactFromEntity).toList()),
    );
  }
}
