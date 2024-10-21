import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:luminpay/services/cache.service.dart';
import 'package:zed_business/services/route.services.dart';


final routeService = Provider<RouteService>(
  (ref) => RouteServiceImpl(),
);
// final fileService = Provider<FileService>(
//   (ref) => FileServiceImpl(),
// );
// final cacheService = Provider<CacheService>(
//   (ref) => CacheServiceImpl(sharedPref: ref.read(sharedPreferencesProvider)),
// );
// final permissionService = Provider<PermissionService>(
//   (ref) => PermissionServiceImpl(),
// );
// final apiService = Provider<ApiService>(
//   (ref) => ApiServiceImpl(baseUrl: 'https://zbazaarsolutions.co.in/api/v7'),
// );

// final apiService = Provider<ApiService>(
//   (ref) => ApiServiceImpl(
//     baseUrl: 'https://zbazaarsolutions.co.in/api/v7',
//     logoutNotifier: ref.read(logoutNotifierProvider.notifier),
//     cacheService: ref.read(cacheService),
//   ),
// );
// final firebaseService = Provider<FirebaseService>(
//   (ref) => FirebaseServiceImpl(),
// );
