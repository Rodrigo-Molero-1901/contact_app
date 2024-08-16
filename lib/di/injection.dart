import 'package:contact_app/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final injector = GetIt.instance;

@InjectableInit(preferRelativeImports: true)
Future<void> configureDependencies() async => injector.init();
