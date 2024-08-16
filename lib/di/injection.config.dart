// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/contact_info/data/repositories/contact_info_repository_impl.dart'
    as _i10;
import '../features/contact_info/domain/repositories/contact_info_repository.dart'
    as _i9;
import '../features/contact_info/domain/usecases/create_contact.dart' as _i4;
import '../features/contact_info/domain/usecases/delete_contact.dart' as _i6;
import '../features/contact_info/domain/usecases/update_contact.dart' as _i5;
import '../features/contact_info/presentation/blocs/contact_info_cubit.dart'
    as _i11;
import '../features/home/data/repositories/contact_list_repository_impl.dart'
    as _i8;
import '../features/home/domain/repositories/contact_list_repository.dart'
    as _i7;
import '../features/home/domain/usecases/get_contact_list.dart' as _i3;
import '../features/home/presentation/blocs/home_cubit.dart' as _i12;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.GetContactListUseCase>(() => _i3.GetContactListUseCase());
    gh.factory<_i4.CreateContactUseCase>(() => _i4.CreateContactUseCase());
    gh.factory<_i5.UpdateContactUseCase>(() => _i5.UpdateContactUseCase());
    gh.factory<_i6.DeleteContactUseCase>(() => _i6.DeleteContactUseCase());
    gh.factory<_i7.ContactListRepository>(
        () => _i8.ContactListRepositoryImpl());
    gh.factory<_i9.ContactInfoRepository>(
        () => _i10.ContactInfoRepositoryImpl());
    gh.factory<_i11.ContactInfoCubit>(() => _i11.ContactInfoCubit(
          createContactUseCase: gh<_i4.CreateContactUseCase>(),
          deleteContactUseCase: gh<_i6.DeleteContactUseCase>(),
          updateContactUseCase: gh<_i5.UpdateContactUseCase>(),
        ));
    gh.factory<_i12.HomeCubit>(() =>
        _i12.HomeCubit(getContactListUseCase: gh<_i3.GetContactListUseCase>()));
    return this;
  }
}
