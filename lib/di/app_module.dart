import 'package:contact_app/core/service/manager/api_manager.dart';
import 'package:contact_app/objectbox.g.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  static Store? _storeInstance;

  @preResolve
  Future<Store> get objectBoxStore async {
    _storeInstance ??= await openStore();
    return _storeInstance!;
  }

  @preResolve
  Future<ApiManager> get apiManager async {
    final store = await objectBoxStore;
    return ApiManager.init(store: store);
  }
}
