import 'package:auto_route/auto_route.dart';
import 'package:kumquat_app/src/core/routes/app_router.gr.dart';



@AutoRouterConfig()
class AppRouter extends $AppRouter {

  @override
  List<AutoRoute> get routes => [

    AutoRoute(page: SplashRoute.page , initial: true),
    AutoRoute(page: WelcomeRoute.page),
    ///auth routes
    CustomRoute(page: AuthRouter.page,
      children: [
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: NewProfileRouteOne.page),
        AutoRoute(page: NewProfileRouteTwo.page)
      ]
    ),

    AutoRoute(page: FindUsersRoute.page),
    AutoRoute(page: SearchResultsRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: UserProfileRoute.page),
    AutoRoute(page: AddFundsRoute.page),
    AutoRoute(page: VideoCallRoute.page),
    AutoRoute(page: VoiceCallRoute.page),
    AutoRoute(page: InboxRoute.page),
  ];

}