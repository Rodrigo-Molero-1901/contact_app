import 'package:contact_app/core/service/api/api.dart';
import 'package:contact_app/core/service/manager/contact_api_manager.dart';
import 'package:objectbox/objectbox.dart';

class ApiManager {
  final Store store;
  late Api _api;

  static Future<ApiManager> init({
    required Store store,
  }) async {
    var apiManager = ApiManager._(store: store);
    return apiManager;
  }

  ApiManager._({
    required this.store,
  }) {
    _api = Api(store);
  }

  ContactApiManager get contactApiManager => ContactApiManager(_api);
}
