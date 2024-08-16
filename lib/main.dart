import 'package:contact_app/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  // await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: GoRouter(
        initialLocation: Routes.pathHome,
        routes: [
          GoRoute(
            path: Routes.pathHome,
            name: Routes.nameHome,
            builder: (context, state) {
              return Container();
            },
          ),
          GoRoute(
            path: Routes.pathContactDetails,
            name: Routes.nameContactDetails,
            builder: (context, state) {
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
