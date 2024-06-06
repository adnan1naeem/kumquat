import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/theme/app_theme.dart';

import '../../core/routes/app_router.dart';



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: _appRouter.config(),
      theme: AppTheme.mainTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}