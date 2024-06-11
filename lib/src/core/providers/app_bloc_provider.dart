

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kumquat_app/src/features/auth/blocs/auth/bloc.dart';
import 'package:kumquat_app/src/features/auth/blocs/session/bloc.dart';

class AppBlocProvider{
  final SessionBloc sessionBloc;

  AppBlocProvider(this.sessionBloc);

  List<BlocProvider> get getProviders => [
    BlocProvider<SessionBloc>.value(value: sessionBloc),
    BlocProvider<AuthBloc>(
      create: (_)=> AuthBloc(sessionBloc),
    )
  ];


}
