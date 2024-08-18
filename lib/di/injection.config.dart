// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i8;

import '../core/service/manager/api_manager.dart' as _i4;
import '../features/contact_info/data/repositories/contact_info_repository_impl.dart'
    as _i10;
import '../features/contact_info/domain/repositories/contact_info_repository.dart'
    as _i9;
import '../features/contact_info/domain/usecases/create_contact.dart' as _i5;
import '../features/contact_info/domain/usecases/delete_contact.dart' as _i7;
import '../features/contact_info/domain/usecases/update_contact.dart' as _i6;
import '../features/contact_info/presentation/blocs/contact_info_cubit.dart'
    as _i14;
import '../features/home/data/repositories/contact_list_repository_impl.dart'
    as _i12;
import '../features/home/domain/repositories/contact_list_repository.dart'
    as _i11;
import '../features/home/domain/usecases/get_contact_list.dart' as _i13;
import '../features/home/presentation/blocs/home_cubit.dart' as _i15;
import '../objectbox.g.dart' as _i3;
import 'app_module.dart' as _i16;

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
    await gh.factoryAsync<_i3.Store>(
      () => appModule.objectBoxStore,
      preResolve: true,
    );
    await gh.factoryAsync<_i4.ApiManager>(
      () => appModule.apiManager,
      preResolve: true,
    );
    gh.factory<_i5.CreateContactUseCase>(() => _i5.CreateContactUseCase());
    gh.factory<_i6.UpdateContactUseCase>(() => _i6.UpdateContactUseCase());
    gh.factory<_i7.DeleteContactUseCase>(() => _i7.DeleteContactUseCase());
    gh.lazySingleton<_i8.Logger>(() => appModule.logger);
    gh.factory<_i9.ContactInfoRepository>(
        () => _i10.ContactInfoRepositoryImpl());
    gh.factory<_i11.ContactListRepository>(
        () => _i12.ContactListRepositoryImpl(apiManager: gh<_i4.ApiManager>()));
    gh.factory<_i13.GetContactListUseCase>(
        () => _i13.GetContactListUseCase(gh<_i11.ContactListRepository>()));
    gh.factory<_i14.ContactInfoCubit>(() => _i14.ContactInfoCubit(
          createContactUseCase: gh<_i5.CreateContactUseCase>(),
          deleteContactUseCase: gh<_i7.DeleteContactUseCase>(),
          updateContactUseCase: gh<_i6.UpdateContactUseCase>(),
        ));
    gh.factory<_i15.HomeCubit>(() => _i15.HomeCubit(
        getContactListUseCase: gh<_i13.GetContactListUseCase>()));
    return this;
  }
}

class _$AppModule extends _i16.AppModule {}
