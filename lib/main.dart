import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jono/data/blocs/autocomplete/auto_complete_bloc.dart';
import 'package:jono/data/blocs/places/places_bloc.dart';
import 'package:jono/data/repositories/auth/auth_repository.dart';
import 'package:jono/data/repositories/places/places_repository.dart';
import 'package:jono/data/services/remote/firestore_service.dart';
import 'package:jono/modules/auth/blocs/auth/auth_bloc.dart';

import './common/constants/theme.dart';
import './modules/modules.dart';
import './routes/router.dart';
import 'data/blocs/geolocation/geolocation_bloc.dart';
import 'data/repositories/geolocation/geolocation_repository.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => AuthRepository(
              auth: FirebaseAuth.instance,
              fireStoreService: FireStoreService()),
        ),
        RepositoryProvider(
          create: (_) => GeolocationRepository(),
        ),
        RepositoryProvider(
          create: (_) => PlacesRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GeolocationBloc(
              geolocationRepository: context.read<GeolocationRepository>(),
            )..add(LoadGeolocationEvent()),
          ),
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => PlacesBloc(
              placesRepository: context.read<PlacesRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => AutoCompleteBloc(
              placesRepository: context.read<PlacesRepository>(),
            ),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 800),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Jono",
              theme: appTheme(),
              onGenerateRoute: MyRouter.generateRoute,
              initialRoute: HomeScreen.routeName,
            );
          },
        ),
      ),
    );
  }
}
