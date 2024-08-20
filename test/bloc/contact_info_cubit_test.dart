import 'package:bloc_test/bloc_test.dart';
import 'package:contact_app/features/contact_info/data/models/contact_info_model.dart';
import 'package:contact_app/features/contact_info/domain/usecases/create_contact.dart';
import 'package:contact_app/features/contact_info/domain/usecases/delete_contact.dart';
import 'package:contact_app/features/contact_info/domain/usecases/get_contact_info.dart';
import 'package:contact_app/features/contact_info/domain/usecases/update_contact.dart';
import 'package:contact_app/features/contact_info/presentation/blocs/contact_info_cubit.dart';
import 'package:contact_app/features/contact_info/presentation/utils/enums.dart';
import 'package:contact_app/features/home/presentation/blocs/home_cubit.dart';
import 'package:contact_app/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:mockito/mockito.dart';

class MockGetContactInfoUseCase extends Mock implements GetContactInfoUseCase {}

class MockCreateContactUseCase extends Mock implements CreateContactUseCase {}

class MockUpdateContactUseCase extends Mock implements UpdateContactUseCase {}

class MockDeleteContactUseCase extends Mock implements DeleteContactUseCase {}

void main() {
  late MockGetContactInfoUseCase mockGetContactInfoUseCase;
  late MockCreateContactUseCase mockCreateContactUseCase;
  late MockUpdateContactUseCase mockUpdateContactUseCase;
  late MockDeleteContactUseCase mockDeleteContactUseCase;
  late ContactInfoCubit contactInfoCubit;
  late Logger mockLogger;

  setUp(() {
    final getIt = GetIt.instance;
    getIt.reset();
    mockLogger = Logger();
    getIt.registerSingleton<Logger>(mockLogger);

    mockGetContactInfoUseCase = MockGetContactInfoUseCase();
    mockCreateContactUseCase = MockCreateContactUseCase();
    mockUpdateContactUseCase = MockUpdateContactUseCase();
    mockDeleteContactUseCase = MockDeleteContactUseCase();
    contactInfoCubit = ContactInfoCubit(
      getContactInfoUseCase: mockGetContactInfoUseCase,
      createContactUseCase: mockCreateContactUseCase,
      updateContactUseCase: mockUpdateContactUseCase,
      deleteContactUseCase: mockDeleteContactUseCase,
    );
  });

  tearDown(() {
    GetIt.instance.reset();
    contactInfoCubit.close();
  });

  group('ContactInfoCubit', () {
    test('initial state is ContactInfoLoading', () {
      expect(contactInfoCubit.state, isA<ContactInfoLoading>());
    });

    blocTest<ContactInfoCubit, ContactInfoState>(
      'emits [ContactInfoLoading, ContactInfoMain] when initialize is called and GetContactInfoUseCase returns a success',
      build: () {
        when(mockGetContactInfoUseCase.getContact(contactId: ''))
            .thenAnswer((_) async => Right(ContactInfoModel()));
        return contactInfoCubit;
      },
      act: (cubit) => cubit.initialize(''),
      expect: () => [
        ContactInfoLoading(),
        isA<ContactInfoMain>().having(
          (state) => state.viewModel.contactInfoStatus,
          'contactInfoStatus',
          ContactInfoStatus.success,
        ),
      ],
    );
  });
}
