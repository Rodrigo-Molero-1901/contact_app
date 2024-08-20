// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i5;

import '../core/service/manager/api_manager.dart' as _i4;
import '../features/contact_info/data/repositories/contact_info_repository_impl.dart'
    as _i10;
import '../features/contact_info/domain/repositories/contact_info_repository.dart'
    as _i9;
import '../features/contact_info/domain/usecases/create_contact.dart' as _i11;
import '../features/contact_info/domain/usecases/delete_contact.dart' as _i13;
import '../features/contact_info/domain/usecases/get_contact_info.dart' as _i14;
import '../features/contact_info/domain/usecases/update_contact.dart' as _i12;
import '../features/contact_info/presentation/blocs/contact_info_cubit.dart'
    as _i16;
import '../features/home/data/repositories/contact_list_repository_impl.dart'
    as _i7;
import '../features/home/domain/repositories/contact_list_repository.dart'
    as _i6;
import '../features/home/domain/usecases/get_contact_list.dart' as _i8;
import '../features/home/presentation/blocs/home_cubit.dart' as _i15;
import '../objectbox.g.dart' as _i3;
import 'app_module.dart' as _i17;

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
    gh.lazySingleton<_i5.Logger>(() => appModule.logger);
    gh.factory<_i6.ContactListRepository>(
        () => _i7.ContactListRepositoryImpl(apiManager: gh<_i4.ApiManager>()));
    gh.factory<_i8.GetContactListUseCase>(
        () => _i8.GetContactListUseCase(gh<_i6.ContactListRepository>()));
    gh.factory<_i9.ContactInfoRepository>(
        () => _i10.ContactInfoRepositoryImpl(apiManager: gh<_i4.ApiManager>()));
    gh.factory<_i11.CreateContactUseCase>(
        () => _i11.CreateContactUseCase(gh<_i9.ContactInfoRepository>()));
    gh.factory<_i12.UpdateContactUseCase>(
        () => _i12.UpdateContactUseCase(gh<_i9.ContactInfoRepository>()));
    gh.factory<_i13.DeleteContactUseCase>(
        () => _i13.DeleteContactUseCase(gh<_i9.ContactInfoRepository>()));
    gh.factory<_i14.GetContactInfoUseCase>(
        () => _i14.GetContactInfoUseCase(gh<_i9.ContactInfoRepository>()));
    gh.factory<_i15.HomeCubit>(() =>
        _i15.HomeCubit(getContactListUseCase: gh<_i8.GetContactListUseCase>()));
    gh.factory<_i16.ContactInfoCubit>(() => _i16.ContactInfoCubit(
          getContactInfoUseCase: gh<_i14.GetContactInfoUseCase>(),
          createContactUseCase: gh<_i11.CreateContactUseCase>(),
          updateContactUseCase: gh<_i12.UpdateContactUseCase>(),
          deleteContactUseCase: gh<_i13.DeleteContactUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i17.AppModule {}
