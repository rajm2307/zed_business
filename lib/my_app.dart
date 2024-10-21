import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zed_business/core/routes/route.dart';
import 'package:zed_business/core/routes/route.gr.dart';
// import 'package:luminpay/core/constants/app.constants.dart';
// import 'package:luminpay/core/keys/global.key.dart';
// import 'package:luminpay/core/providers/providers.dart';
// import 'package:luminpay/core/routes/route.dart';
// import 'package:luminpay/core/routes/route.gr.dart';
// import 'package:luminpay/core/styles/theme.style.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // final darkTheme = ref.watch(themeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // scaffoldMessengerKey: messengerKey,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(
        deepLinkBuilder: (deepLink) => const DeepLink([TeamRoute()]),
      ),
      // title: AppConstants.app,
      // themeMode: darkTheme ? ThemeMode.dark : ThemeMode.light,
      // theme: AppThemeData.light,
      // darkTheme: AppThemeData.dark,
    );
  }
}
