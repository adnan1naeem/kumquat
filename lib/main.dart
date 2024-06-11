import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kumquat_app/src/app/presentation/app.dart';
import 'package:kumquat_app/src/domain/services/firebase_service.dart';
import 'package:kumquat_app/src/domain/services/secure_storage_service.dart';
import 'package:kumquat_app/src/features/auth/blocs/session/bloc.dart';
import 'package:kumquat_app/src/features/auth/blocs/session/event.dart';

import 'firebase_options.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   SessionBloc sessionBloc = SessionBloc(SecureStorageService());
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );

   FirebaseService().initialize(sessionBloc);

  runApp( MyApp(
    sessionBloc: sessionBloc..add(AppStarted()),
  ));
}



