import 'package:injectable/injectable.dart';
import 'package:contact_app/features/contact_info/domain/repositories/contact_info_repository.dart';

@Injectable(as: ContactInfoRepository)
class ContactInfoRepositoryImpl implements ContactInfoRepository {}
