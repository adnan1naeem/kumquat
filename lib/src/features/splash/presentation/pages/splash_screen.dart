import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kumquat_app/src/core/components/app_scaffold.dart';
import 'package:kumquat_app/src/core/helper/space.dart';
import 'package:kumquat_app/src/core/routes/app_router.gr.dart';
import 'package:kumquat_app/src/features/auth/blocs/session/bloc.dart';
import 'package:kumquat_app/src/features/auth/blocs/session/state.dart';
import '../../../../core/components/eclipse_header.dart';
import '../../../welcome/presentation/widgets/welcome_widget.dart';


@RoutePage<void>()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SessionBloc, SessionState>(
        listener: (context, state) {
          if(state is SessionAuthenticated){
            context.router.maybePop();
            context.router.replace(const FindUsersRoute());
          }
          if(state is SessionUnAuthenticated){
            context.router.maybePop();
            context.router.replace(const WelcomeRoute());
          }
        },
        child: AppScaffold(
             body: SingleChildScrollView(
                 child: Column(
                   children: [
                     const EclipseHeader(),
                     verticalSpace(100),
                     const Padding(
                       padding:  EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
                       child: Column(
                         children: [
                            WelcomeWidget(),
                         ],
                       ),
                     )
                   ],
                 ),
               ))

        );
  }
}
