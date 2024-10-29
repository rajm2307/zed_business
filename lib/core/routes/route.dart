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

    // ProfileAccountPage
    CustomRoute(
      page: ProfileAccountRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),

    // QrCodePage
    CustomRoute(
      page: QrCodeRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),

    // IdCardPage
    CustomRoute(
      page: IdCardRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),

    // BankKYCPage
    CustomRoute(
      page: BankKYCRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),

    // GalleryPage
    CustomRoute(
      page: GalleryRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),

    // ScannerPage
    CustomRoute(
      page: ScannerRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),

    // WithdrawalPage
    CustomRoute(
      page: WithdrawalRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),

    // MoneyTransferPage
    CustomRoute(
      page: MoneyTransferRoute.page,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
  ];
}
