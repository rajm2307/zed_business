import 'package:auto_route/auto_route.dart';
import 'package:zed_business/core/routes/route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => _list;

  final _list = [
    // HomePage
    CustomRoute(
      page: HomeRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),

    // ProfilePage
    CustomRoute(
      page: ProfileRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),

    // TeamPage
    CustomRoute(
      page: TeamRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),

    // TeamViewPage
    CustomRoute(
      page: TeamViewRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),
  ];
}