import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './common/constants/theme.dart';
import './modules/modules.dart';
import './routes/router.dart';
import 'data/blocs/geolocation/geolocation_bloc.dart';
import 'data/repositories/geolocation/geolocation_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => GeolocationRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GeolocationBloc(
              geolocationRepository: context.read<GeolocationRepository>(),
            )..add(LoadGeolocationEvent()),
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
