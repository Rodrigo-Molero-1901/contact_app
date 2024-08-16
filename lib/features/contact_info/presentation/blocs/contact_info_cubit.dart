import 'package:contact_app/features/contact_info/domain/usecases/create_contact.dart';
import 'package:contact_app/features/contact_info/domain/usecases/delete_contact.dart';
import 'package:contact_app/features/contact_info/domain/usecases/update_contact.dart';
import 'package:contact_app/features/contact_info/presentation/viewmodels/contact_info_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'contact_info_state.dart';

@injectable
class ContactInfoCubit extends Cubit<ContactInfoState> {
  final CreateContactUseCase _createContactUseCase;
  final DeleteContactUseCase _deleteContactUseCase;
  final UpdateContactUseCase _updateContactUseCase;

  ContactInfoCubit({
    required CreateContactUseCase createContactUseCase,
    required DeleteContactUseCase deleteContactUseCase,
    required UpdateContactUseCase updateContactUseCase,
  })  : _createContactUseCase = createContactUseCase,
        _deleteContactUseCase = deleteContactUseCase,
        _updateContactUseCase = updateContactUseCase,
        super(ContactInfoLoading());

  void _emitMain() {
    emit(
      ContactInfoMain(
        viewModel: ContactInfoViewModel(),
      ),
    );
  }
}
