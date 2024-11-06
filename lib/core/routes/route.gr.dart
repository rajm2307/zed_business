// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i21;
import 'package:flutter/material.dart' as _i22;
import 'package:zed_business/features/app_page/presentation/pages/index.dart'
    as _i2;
import 'package:zed_business/features/bank_kyc/presentation/pages/index.dart'
    as _i3;
import 'package:zed_business/features/gallery/presentation/pages/index.dart'
    as _i4;
import 'package:zed_business/features/homePage/presentation/pages/index.dart'
    as _i6;
import 'package:zed_business/features/id_card/presentation/pages/index.dart'
    as _i7;
import 'package:zed_business/features/myteam/presentation/pages/index.dart'
    as _i9;
import 'package:zed_business/features/Notification/presentation/pages/index.dart'
    as _i10;
import 'package:zed_business/features/others/add_fund.dart' as _i1;
import 'package:zed_business/features/payment/presentation/pages/index.dart'
    as _i11;
import 'package:zed_business/features/profile%20_account_page/presentation/pages/index.dart'
    as _i12;
import 'package:zed_business/features/profile/presentation/pages/history.dart'
    as _i5;
import 'package:zed_business/features/profile/presentation/pages/index.dart'
    as _i13;
import 'package:zed_business/features/qr_code/presentation/pages/index.dart'
    as _i14;
import 'package:zed_business/features/scanner/presentation/pages/index.dart'
    as _i15;
import 'package:zed_business/features/team/presentation/pages/index.dart'
    as _i16;
import 'package:zed_business/features/team_view/presentation/pages/index.dart'
    as _i17;
import 'package:zed_business/features/withdrawal_/detailspage/detailspage/pages/index.dart'
    as _i18;
import 'package:zed_business/features/withdrawal_/moneytransfer/presentation/pages/index.dart'
    as _i8;
import 'package:zed_business/features/withdrawal_/transactionHistory/presentation/pages/index.dart'
    as _i19;
import 'package:zed_business/features/withdrawal_/withdrawal/presentation/pages/index.dart'
    as _i20;

/// generated route for
/// [_i1.AddFundPaymentPage]
class AddFundPaymentRoute extends _i21.PageRouteInfo<AddFundPaymentRouteArgs> {
  AddFundPaymentRoute({
    _i22.Key? key,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          AddFundPaymentRoute.name,
          args: AddFundPaymentRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddFundPaymentRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddFundPaymentRouteArgs>(
          orElse: () => const AddFundPaymentRouteArgs());
      return _i1.AddFundPaymentPage(key: args.key);
    },
  );
}

class AddFundPaymentRouteArgs {
  const AddFundPaymentRouteArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'AddFundPaymentRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.AppPage]
class AppRoute extends _i21.PageRouteInfo<AppRouteArgs> {
  AppRoute({
    _i22.Key? key,
    required String title,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          AppRoute.name,
          args: AppRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'AppRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AppRouteArgs>();
      return _i2.AppPage(
        key: args.key,
        title: args.title,
      );
    },
  );
}

class AppRouteArgs {
  const AppRouteArgs({
    this.key,
    required this.title,
  });

  final _i22.Key? key;

  final String title;

  @override
  String toString() {
    return 'AppRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i3.BankKYCPage]
class BankKYCRoute extends _i21.PageRouteInfo<BankKYCRouteArgs> {
  BankKYCRoute({
    _i22.Key? key,
    required String? userID,
    required String? fullName,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          BankKYCRoute.name,
          args: BankKYCRouteArgs(
            key: key,
            userID: userID,
            fullName: fullName,
          ),
          initialChildren: children,
        );

  static const String name = 'BankKYCRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BankKYCRouteArgs>();
      return _i3.BankKYCPage(
        key: args.key,
        userID: args.userID,
        fullName: args.fullName,
      );
    },
  );
}

class BankKYCRouteArgs {
  const BankKYCRouteArgs({
    this.key,
    required this.userID,
    required this.fullName,
  });

  final _i22.Key? key;

  final String? userID;

  final String? fullName;

  @override
  String toString() {
    return 'BankKYCRouteArgs{key: $key, userID: $userID, fullName: $fullName}';
  }
}

/// generated route for
/// [_i4.GalleryPage]
class GalleryRoute extends _i21.PageRouteInfo<void> {
  const GalleryRoute({List<_i21.PageRouteInfo>? children})
      : super(
          GalleryRoute.name,
          initialChildren: children,
        );

  static const String name = 'GalleryRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i4.GalleryPage();
    },
  );
}

/// generated route for
/// [_i5.HistoryPage]
class HistoryRoute extends _i21.PageRouteInfo<void> {
  const HistoryRoute({List<_i21.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i5.HistoryPage();
    },
  );
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i21.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i22.Key? key,
    required _i22.GlobalKey<_i22.ScaffoldState> keyToOpenDrawer,
    required Null Function() onViewAll,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            keyToOpenDrawer: keyToOpenDrawer,
            onViewAll: onViewAll,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>();
      return _i6.HomePage(
        key: args.key,
        keyToOpenDrawer: args.keyToOpenDrawer,
        onViewAll: args.onViewAll,
      );
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    required this.keyToOpenDrawer,
    required this.onViewAll,
  });

  final _i22.Key? key;

  final _i22.GlobalKey<_i22.ScaffoldState> keyToOpenDrawer;

  final Null Function() onViewAll;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, keyToOpenDrawer: $keyToOpenDrawer, onViewAll: $onViewAll}';
  }
}

/// generated route for
/// [_i7.IdCardPage]
class IdCardRoute extends _i21.PageRouteInfo<void> {
  const IdCardRoute({List<_i21.PageRouteInfo>? children})
      : super(
          IdCardRoute.name,
          initialChildren: children,
        );

  static const String name = 'IdCardRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i7.IdCardPage();
    },
  );
}

/// generated route for
/// [_i8.MoneyTransferPage]
class MoneyTransferRoute extends _i21.PageRouteInfo<MoneyTransferRouteArgs> {
  MoneyTransferRoute({
    _i22.Key? key,
    required _i22.TextEditingController amountController,
    required String? selectedText,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          MoneyTransferRoute.name,
          args: MoneyTransferRouteArgs(
            key: key,
            amountController: amountController,
            selectedText: selectedText,
          ),
          initialChildren: children,
        );

  static const String name = 'MoneyTransferRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MoneyTransferRouteArgs>();
      return _i8.MoneyTransferPage(
        key: args.key,
        amountController: args.amountController,
        selectedText: args.selectedText,
      );
    },
  );
}

class MoneyTransferRouteArgs {
  const MoneyTransferRouteArgs({
    this.key,
    required this.amountController,
    required this.selectedText,
  });

  final _i22.Key? key;

  final _i22.TextEditingController amountController;

  final String? selectedText;

  @override
  String toString() {
    return 'MoneyTransferRouteArgs{key: $key, amountController: $amountController, selectedText: $selectedText}';
  }
}

/// generated route for
/// [_i9.MyTeamPage]
class MyTeamRoute extends _i21.PageRouteInfo<void> {
  const MyTeamRoute({List<_i21.PageRouteInfo>? children})
      : super(
          MyTeamRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyTeamRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i9.MyTeamPage();
    },
  );
}

/// generated route for
/// [_i10.NotificationPage]
class NotificationRoute extends _i21.PageRouteInfo<void> {
  const NotificationRoute({List<_i21.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i10.NotificationPage();
    },
  );
}

/// generated route for
/// [_i11.PaymentPage]
class PaymentRoute extends _i21.PageRouteInfo<PaymentRouteArgs> {
  PaymentRoute({
    _i22.Key? key,
    required double? ratePayment,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          PaymentRoute.name,
          args: PaymentRouteArgs(
            key: key,
            ratePayment: ratePayment,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PaymentRouteArgs>();
      return _i11.PaymentPage(
        key: args.key,
        ratePayment: args.ratePayment,
      );
    },
  );
}

class PaymentRouteArgs {
  const PaymentRouteArgs({
    this.key,
    required this.ratePayment,
  });

  final _i22.Key? key;

  final double? ratePayment;

  @override
  String toString() {
    return 'PaymentRouteArgs{key: $key, ratePayment: $ratePayment}';
  }
}

/// generated route for
/// [_i12.ProfileAccountPage]
class ProfileAccountRoute extends _i21.PageRouteInfo<void> {
  const ProfileAccountRoute({List<_i21.PageRouteInfo>? children})
      : super(
          ProfileAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileAccountRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i12.ProfileAccountPage();
    },
  );
}

/// generated route for
/// [_i13.ProfilePage]
class ProfileRoute extends _i21.PageRouteInfo<void> {
  const ProfileRoute({List<_i21.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i13.ProfilePage();
    },
  );
}

/// generated route for
/// [_i14.QrCodePage]
class QrCodeRoute extends _i21.PageRouteInfo<void> {
  const QrCodeRoute({List<_i21.PageRouteInfo>? children})
      : super(
          QrCodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'QrCodeRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i14.QrCodePage();
    },
  );
}

/// generated route for
/// [_i15.ScannerPage]
class ScannerRoute extends _i21.PageRouteInfo<void> {
  const ScannerRoute({List<_i21.PageRouteInfo>? children})
      : super(
          ScannerRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScannerRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i15.ScannerPage();
    },
  );
}

/// generated route for
/// [_i16.TeamPage]
class TeamRoute extends _i21.PageRouteInfo<void> {
  const TeamRoute({List<_i21.PageRouteInfo>? children})
      : super(
          TeamRoute.name,
          initialChildren: children,
        );

  static const String name = 'TeamRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i16.TeamPage();
    },
  );
}

/// generated route for
/// [_i17.TeamViewPage]
class TeamViewRoute extends _i21.PageRouteInfo<TeamViewRouteArgs> {
  TeamViewRoute({
    _i22.Key? key,
    required String appBarName,
    required int level,
    required int userStatus,
    required String fetchDay,
    List<_i21.PageRouteInfo>? children,
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

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TeamViewRouteArgs>();
      return _i17.TeamViewPage(
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

  final _i22.Key? key;

  final String appBarName;

  final int level;

  final int userStatus;

  final String fetchDay;

  @override
  String toString() {
    return 'TeamViewRouteArgs{key: $key, appBarName: $appBarName, level: $level, userStatus: $userStatus, fetchDay: $fetchDay}';
  }
}

/// generated route for
/// [_i18.TransactionDetailsPage]
class TransactionDetailsRoute
    extends _i21.PageRouteInfo<TransactionDetailsRouteArgs> {
  TransactionDetailsRoute({
    required String? userId,
    required String? userName,
    required double? amount,
    required double? emergencyFund,
    required DateTime? transactionDateTime,
    required String? status,
    _i22.Key? key,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          TransactionDetailsRoute.name,
          args: TransactionDetailsRouteArgs(
            userId: userId,
            userName: userName,
            amount: amount,
            emergencyFund: emergencyFund,
            transactionDateTime: transactionDateTime,
            status: status,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TransactionDetailsRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TransactionDetailsRouteArgs>();
      return _i18.TransactionDetailsPage(
        userId: args.userId,
        userName: args.userName,
        amount: args.amount,
        emergencyFund: args.emergencyFund,
        transactionDateTime: args.transactionDateTime,
        status: args.status,
        key: args.key,
      );
    },
  );
}

class TransactionDetailsRouteArgs {
  const TransactionDetailsRouteArgs({
    required this.userId,
    required this.userName,
    required this.amount,
    required this.emergencyFund,
    required this.transactionDateTime,
    required this.status,
    this.key,
  });

  final String? userId;

  final String? userName;

  final double? amount;

  final double? emergencyFund;

  final DateTime? transactionDateTime;

  final String? status;

  final _i22.Key? key;

  @override
  String toString() {
    return 'TransactionDetailsRouteArgs{userId: $userId, userName: $userName, amount: $amount, emergencyFund: $emergencyFund, transactionDateTime: $transactionDateTime, status: $status, key: $key}';
  }
}

/// generated route for
/// [_i19.TransactionHistoryPage]
class TransactionHistoryRoute
    extends _i21.PageRouteInfo<TransactionHistoryRouteArgs> {
  TransactionHistoryRoute({
    _i22.Key? key,
    required bool? isCommissionSelected,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          TransactionHistoryRoute.name,
          args: TransactionHistoryRouteArgs(
            key: key,
            isCommissionSelected: isCommissionSelected,
          ),
          initialChildren: children,
        );

  static const String name = 'TransactionHistoryRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TransactionHistoryRouteArgs>();
      return _i19.TransactionHistoryPage(
        key: args.key,
        isCommissionSelected: args.isCommissionSelected,
      );
    },
  );
}

class TransactionHistoryRouteArgs {
  const TransactionHistoryRouteArgs({
    this.key,
    required this.isCommissionSelected,
  });

  final _i22.Key? key;

  final bool? isCommissionSelected;

  @override
  String toString() {
    return 'TransactionHistoryRouteArgs{key: $key, isCommissionSelected: $isCommissionSelected}';
  }
}

/// generated route for
/// [_i20.WithdrawalPage]
class WithdrawalRoute extends _i21.PageRouteInfo<void> {
  const WithdrawalRoute({List<_i21.PageRouteInfo>? children})
      : super(
          WithdrawalRoute.name,
          initialChildren: children,
        );

  static const String name = 'WithdrawalRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i20.WithdrawalPage();
    },
  );
}
