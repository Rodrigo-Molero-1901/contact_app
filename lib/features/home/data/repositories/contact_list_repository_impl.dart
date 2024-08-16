import 'package:injectable/injectable.dart';
import 'package:contact_app/features/home/domain/repositories/contact_list_repository.dart';

@Injectable(as: ContactListRepository)
class ContactListRepositoryImpl implements ContactListRepository {}
