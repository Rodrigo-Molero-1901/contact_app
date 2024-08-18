import 'package:contact_app/features/home/data/models/contact_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class ContactListRepository {
  Future<Either<void, List<ContactModel>>> getContactList();
}
