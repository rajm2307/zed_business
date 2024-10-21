// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:zed_business/features/homePage/presentation/pages/index.dart'
    as _i1;
import 'package:zed_business/features/profile/presentation/pages/index.dart'
    as _i2;
import 'package:zed_business/features/team/presentation/pages/index.dart'
    as _i3;
import 'package:zed_business/features/team_view/presentation/pages/index.dart'
    as _i4;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.ProfilePage]
class ProfileRoute extends _i5.PageRouteInfo<void> {
  const ProfileRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.ProfilePage();
    },
  );
}

/// generated route for
/// [_i3.TeamPage]
class TeamRoute extends _i5.PageRouteInfo<void> {
  const TeamRoute({List<_i5.PageRouteInfo>? children})
      : super(
          TeamRoute.name,
          initialChildren: children,
        );

  static const String name = 'TeamRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.TeamPage();
    },
  );
}

/// generated route for
/// [_i4.TeamViewPage]
class TeamViewRoute extends _i5.PageRouteInfo<TeamViewRouteArgs> {
  TeamViewRoute({
    _i6.Key? key,
    required String? appBarName,
    required int level,
    required int userStatus,
    required String fetchDay,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          TeamViewRoute.name,
          args: TeamViewRouteArgs(
            key: key,
            appBarName: appBarName,
            level: level,
            userStatus: userStatus,
            fetchDay: fetchDay,
          ),
          initialChildren: children,
        );

  static const String name = 'TeamViewRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TeamViewRouteArgs>();
      return _i4.TeamViewPage(
        key: args.key,
        appBarName: args.appBarName,
        level: args.level,
        userStatus: args.userStatus,
        fetchDay: args.fetchDay,
      );
    },
  );
}

class TeamViewRouteArgs {
  const TeamViewRouteArgs({
    this.key,
    required this.appBarName,
    required this.level,
    required this.userStatus,
    required this.fetchDay,
  });

  final _i6.Key? key;

  final String? appBarName;

  final int level;

  final int userStatus;

  final String fetchDay;

  @override
  String toString() {
    return 'TeamViewRouteArgs{key: $key, appBarName: $appBarName, level: $level, userStatus: $userStatus, fetchDay: $fetchDay}';
  }
}