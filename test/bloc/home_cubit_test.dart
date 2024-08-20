import 'package:bloc_test/bloc_test.dart';
import 'package:contact_app/features/home/data/models/contact_model.dart';
import 'package:contact_app/features/home/domain/usecases/get_contact_list.dart';
import 'package:contact_app/features/home/presentation/blocs/home_cubit.dart';
import 'package:contact_app/features/home/presentation/utils/enums.dart';
import 'package:contact_app/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:mockito/mockito.dart';

class MockGetContactListUseCase extends Mock implements GetContactListUseCase {}

void main() {
  late MockGetContactListUseCase mockGetContactListUseCase;
  late HomeCubit homeCubit;
  late Logger mockLogger;

  setUp(() {
    final getIt = GetIt.instance;
    getIt.reset();
    mockLogger = Logger();
    getIt.registerSingleton<Logger>(mockLogger);

    mockGetContactListUseCase = MockGetContactListUseCase();
    homeCubit = HomeCubit(getContactListUseCase: mockGetContactListUseCase);
  });

  tearDown(() {
    GetIt.instance.reset();
    homeCubit.close();
  });

  group('HomeCubit', () {
    test('initial state is HomeLoading', () {
      expect(homeCubit.state, isA<HomeLoading>());
    });

    blocTest<HomeCubit, HomeState>(
      'emits [HomeLoading, HomeMain] when initialize is called and GetContactListUseCase returns a success',
      build: () {
        when(mockGetContactListUseCase.getContactList())
            .thenAnswer((_) async => const Right(<ContactModel>[]));
        return homeCubit;
      },
      act: (cubit) => cubit.initialize(),
      expect: () => [
        HomeLoading(),
        isA<HomeMain>().having(
          (state) => state.viewModel.contactListStatus,
          'contactListStatus',
          ContactListStatus.success,
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits HomeMain with HomeAddContactNavigation when onCreateContactTapped is called',
      build: () => homeCubit,
      act: (cubit) => cubit.onCreateContactTapped(),
      expect: () => [
        isA<HomeMain>().having(
          (state) => state.viewModel.navigation,
          'navigation',
          isA<HomeAddContactNavigation>(),
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits HomeMain with HomeContactInfoNavigation when onContactTapped is called',
      build: () => homeCubit,
      act: (cubit) => cubit.onContactTapped(''),
      expect: () => [
        isA<HomeMain>().having(
          (state) => state.viewModel.navigation,
          'navigation',
          isA<HomeContactInfoNavigation>(),
        ),
      ],
    );
  });
}
