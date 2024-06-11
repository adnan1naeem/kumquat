import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kumquat_app/src/core/providers/app_bloc_provider.dart';
import 'package:kumquat_app/src/core/theme/app_theme.dart';
import 'package:kumquat_app/src/features/auth/blocs/session/bloc.dart';

import '../../core/routes/app_router.dart';



class MyApp extends StatefulWidget {
  final SessionBloc sessionBloc;
  const MyApp({super.key, required this.sessionBloc});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: AppBlocProvider(widget.sessionBloc).getProviders,
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        theme: AppTheme.mainTheme,
        title: 'Kamquat App',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}