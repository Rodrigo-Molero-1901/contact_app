import 'package:contact_app/core/router/router.dart';
import 'package:contact_app/di/injection.dart';
import 'package:contact_app/features/contact_info/presentation/blocs/contact_info_cubit.dart';
import 'package:contact_app/features/home/presentation/blocs/home_cubit.dart';
import 'package:contact_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(create: (_) => injector<HomeCubit>()),
        BlocProvider<ContactInfoCubit>(
            create: (_) => injector<ContactInfoCubit>()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData.dark(useMaterial3: true),
        routerConfig: GoRouter(
          initialLocation: Routes.pathHome,
          routes: [
            GoRoute(
              path: Routes.pathHome,
              name: Routes.nameHome,
              builder: (context, state) {
                return const HomeView();
              },
            ),
            GoRoute(
              path: Routes.pathContactInfo,
              name: Routes.nameContactInfo,
              builder: (context, state) {
                final contactId = state.extra! as String;
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
