// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:kumquat_app/src/features/auth/blocs/auth/bloc.dart' as _i15;
import 'package:kumquat_app/src/features/auth/presentation/pages/auth_router.dart'
    as _i2;
import 'package:kumquat_app/src/features/auth/presentation/pages/login_page.dart'
    as _i4;
import 'package:kumquat_app/src/features/auth/presentation/pages/new_profile_page_one.dart'
    as _i5;
import 'package:kumquat_app/src/features/auth/presentation/pages/new_profile_page_two.dart'
    as _i6;
import 'package:kumquat_app/src/features/auth/presentation/pages/register_page.dart'
    as _i7;
import 'package:kumquat_app/src/features/payment/presentation/pages/add_funds_page.dart'
    as _i1;
import 'package:kumquat_app/src/features/profile_and_search/presentation/pages/find_users_page.dart'
    as _i3;
import 'package:kumquat_app/src/features/profile_and_search/presentation/pages/search_results_page.dart'
    as _i8;
import 'package:kumquat_app/src/features/profile_and_search/presentation/pages/user_profile_page.dart'
    as _i11;
import 'package:kumquat_app/src/features/settings/presentation/pages/settings_page.dart'
    as _i9;
import 'package:kumquat_app/src/features/splash/presentation/pages/splash_screen.dart'
    as _i10;
import 'package:kumquat_app/src/features/welcome/presentation/pages/welcome_page.dart'
    as _i12;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    AddFundsRoute.name: (routeData) {
      return _i13.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i1.AddFundsPage(),
      );
    },
    AuthRouter.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthRouterWrapper(),
      );
    },
    FindUsersRoute.name: (routeData) {
      return _i13.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i3.FindUsersPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i13.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i4.LoginPage(),
      );
    },
    NewProfileRouteOne.name: (routeData) {
      final args = routeData.argsAs<NewProfileRouteOneArgs>();
      return _i13.AutoRoutePage<void>(
        routeData: routeData,
        child: _i5.NewProfilePageOne(
          key: args.key,
          bloc: args.bloc,
        ),
      );
    },
    NewProfileRouteTwo.name: (routeData) {
      final args = routeData.argsAs<NewProfileRouteTwoArgs>();
      return _i13.AutoRoutePage<void>(
        routeData: routeData,
        child: _i6.NewProfilePageTwo(
          key: args.key,
          bloc: args.bloc,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i13.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i7.RegisterPage(),
      );
    },
    SearchResultsRoute.name: (routeData) {
      return _i13.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i8.SearchResultsPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i13.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i9.SettingsPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i13.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i10.SplashPage(),
      );
    },
    UserProfileRoute.name: (routeData) {
      return _i13.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i11.UserProfilePage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i13.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i12.WelcomePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddFundsPage]
class AddFundsRoute extends _i13.PageRouteInfo<void> {
  const AddFundsRoute({List<_i13.PageRouteInfo>? children})
      : super(
          AddFundsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddFundsRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AuthRouterWrapper]
class AuthRouter extends _i13.PageRouteInfo<void> {
  const AuthRouter({List<_i13.PageRouteInfo>? children})
      : super(
          AuthRouter.name,
          initialChildren: children,
        );

  static const String name = 'AuthRouter';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i3.FindUsersPage]
class FindUsersRoute extends _i13.PageRouteInfo<void> {
  const FindUsersRoute({List<_i13.PageRouteInfo>? children})
      : super(
          FindUsersRoute.name,
          initialChildren: children,
        );

  static const String name = 'FindUsersRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute({List<_i13.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i5.NewProfilePageOne]
class NewProfileRouteOne extends _i13.PageRouteInfo<NewProfileRouteOneArgs> {
  NewProfileRouteOne({
    _i14.Key? key,
    required _i15.AuthBloc bloc,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          NewProfileRouteOne.name,
          args: NewProfileRouteOneArgs(
            key: key,
            bloc: bloc,
          ),
          initialChildren: children,
        );

  static const String name = 'NewProfileRouteOne';

  static const _i13.PageInfo<NewProfileRouteOneArgs> page =
      _i13.PageInfo<NewProfileRouteOneArgs>(name);
}

class NewProfileRouteOneArgs {
  const NewProfileRouteOneArgs({
    this.key,
    required this.bloc,
  });

  final _i14.Key? key;

  final _i15.AuthBloc bloc;

  @override
  String toString() {
    return 'NewProfileRouteOneArgs{key: $key, bloc: $bloc}';
  }
}

/// generated route for
/// [_i6.NewProfilePageTwo]
class NewProfileRouteTwo extends _i13.PageRouteInfo<NewProfileRouteTwoArgs> {
  NewProfileRouteTwo({
    _i14.Key? key,
    required _i15.AuthBloc bloc,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          NewProfileRouteTwo.name,
          args: NewProfileRouteTwoArgs(
            key: key,
            bloc: bloc,
          ),
          initialChildren: children,
        );

  static const String name = 'NewProfileRouteTwo';

  static const _i13.PageInfo<NewProfileRouteTwoArgs> page =
      _i13.PageInfo<NewProfileRouteTwoArgs>(name);
}

class NewProfileRouteTwoArgs {
  const NewProfileRouteTwoArgs({
    this.key,
    required this.bloc,
  });

  final _i14.Key? key;

  final _i15.AuthBloc bloc;

  @override
  String toString() {
    return 'NewProfileRouteTwoArgs{key: $key, bloc: $bloc}';
  }
}

/// generated route for
/// [_i7.RegisterPage]
class RegisterRoute extends _i13.PageRouteInfo<void> {
  const RegisterRoute({List<_i13.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SearchResultsPage]
class SearchResultsRoute extends _i13.PageRouteInfo<void> {
  const SearchResultsRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SearchResultsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchResultsRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SettingsPage]
class SettingsRoute extends _i13.PageRouteInfo<void> {
  const SettingsRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SplashPage]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i11.UserProfilePage]
class UserProfileRoute extends _i13.PageRouteInfo<void> {
  const UserProfileRoute({List<_i13.PageRouteInfo>? children})
      : super(
          UserProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i12.WelcomePage]
class WelcomeRoute extends _i13.PageRouteInfo<void> {
  const WelcomeRoute({List<_i13.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}
