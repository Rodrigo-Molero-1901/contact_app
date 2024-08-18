// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/service/manager/api_manager.dart' as _i7;
import '../features/contact_info/data/repositories/contact_info_repository_impl.dart'
    as _i9;
import '../features/contact_info/domain/repositories/contact_info_repository.dart'
    as _i8;
import '../features/contact_info/domain/usecases/create_contact.dart' as _i3;
import '../features/contact_info/domain/usecases/delete_contact.dart' as _i5;
import '../features/contact_info/domain/usecases/update_contact.dart' as _i4;
import '../features/contact_info/presentation/blocs/contact_info_cubit.dart'
    as _i13;
import '../features/home/data/repositories/contact_list_repository_impl.dart'
    as _i11;
import '../features/home/domain/repositories/contact_list_repository.dart'
    as _i10;
import '../features/home/domain/usecases/get_contact_list.dart' as _i12;
import '../features/home/presentation/blocs/home_cubit.dart' as _i14;
import '../objectbox.g.dart' as _i6;
import 'app_module.dart' as _i15;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.CreateContactUseCase>(() => _i3.CreateContactUseCase());
    gh.factory<_i4.UpdateContactUseCase>(() => _i4.UpdateContactUseCase());
    gh.factory<_i5.DeleteContactUseCase>(() => _i5.DeleteContactUseCase());
    await gh.factoryAsync<_i6.Store>(
      () => appModule.objectBoxStore,
      preResolve: true,
    );
    await gh.factoryAsync<_i7.ApiManager>(
      () => appModule.apiManager,
      preResolve: true,
    );
    gh.factory<_i8.ContactInfoRepository>(
        () => _i9.ContactInfoRepositoryImpl());
    gh.factory<_i10.ContactListRepository>(
        () => _i11.ContactListRepositoryImpl(apiManager: gh<_i7.ApiManager>()));
    gh.factory<_i12.GetContactListUseCase>(
        () => _i12.GetContactListUseCase(gh<_i10.ContactListRepository>()));
    gh.factory<_i13.ContactInfoCubit>(() => _i13.ContactInfoCubit(
          createContactUseCase: gh<_i3.CreateContactUseCase>(),
          deleteContactUseCase: gh<_i5.DeleteContactUseCase>(),
          updateContactUseCase: gh<_i4.UpdateContactUseCase>(),
        ));
    gh.factory<_i14.HomeCubit>(() => _i14.HomeCubit(
        getContactListUseCase: gh<_i12.GetContactListUseCase>()));
    return this;
  }
}

class _$AppModule extends _i15.AppModule {}
