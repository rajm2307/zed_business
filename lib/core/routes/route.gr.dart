// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;
import 'package:zed_business/features/bank_kyc/presentation/pages/index.dart'
    as _i1;
import 'package:zed_business/features/transactionHistory/presentation/pages/index.dart'
    as _i13;
import 'package:zed_business/features/detailspage/detailspage/pages/index.dart'
    as _i12;
import 'package:zed_business/features/gallery/presentation/pages/index.dart'
    as _i2;
import 'package:zed_business/features/homePage/presentation/pages/index.dart'
    as _i3;
import 'package:zed_business/features/id_card/presentation/pages/index.dart'
    as _i4;
import 'package:zed_business/features/moneytransfer/presentation/pages/index.dart'
    as _i5;
import 'package:zed_business/features/profile%20_account_page/presentation/pages/index.dart'
    as _i6;
import 'package:zed_business/features/profile/presentation/pages/index.dart'
    as _i7;
import 'package:zed_business/features/qr_code/presentation/pages/index.dart'
    as _i8;
import 'package:zed_business/features/scanner/presentation/pages/index.dart'
    as _i9;
import 'package:zed_business/features/team/presentation/pages/index.dart'
    as _i10;
import 'package:zed_business/features/team_view/presentation/pages/index.dart'
    as _i11;
import 'package:zed_business/features/withdrawal/presentation/pages/index.dart'
    as _i14;

/// generated route for
/// [_i1.BankKYCPage]
class BankKYCRoute extends _i15.PageRouteInfo<BankKYCRouteArgs> {
  BankKYCRoute({
    _i16.Key? key,
    required String? userID,
    required String? fullName,
    List<_i15.PageRouteInfo>? children,
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

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BankKYCRouteArgs>();
      return _i1.BankKYCPage(
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

  final _i16.Key? key;

  final String? userID;

  final String? fullName;

  @override
  String toString() {
    return 'BankKYCRouteArgs{key: $key, userID: $userID, fullName: $fullName}';
  }
}

/// generated route for
/// [_i2.GalleryPage]
class GalleryRoute extends _i15.PageRouteInfo<void> {
  const GalleryRoute({List<_i15.PageRouteInfo>? children})
      : super(
          GalleryRoute.name,
          initialChildren: children,
        );

  static const String name = 'GalleryRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i2.GalleryPage();
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute({List<_i15.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.IdCardPage]
class IdCardRoute extends _i15.PageRouteInfo<void> {
  const IdCardRoute({List<_i15.PageRouteInfo>? children})
      : super(
          IdCardRoute.name,
          initialChildren: children,
        );

  static const String name = 'IdCardRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i4.IdCardPage();
    },
  );
}

/// generated route for
/// [_i5.MoneyTransferPage]
class MoneyTransferRoute extends _i15.PageRouteInfo<MoneyTransferRouteArgs> {
  MoneyTransferRoute({
    _i16.Key? key,
    required _i16.TextEditingController amountController,
    required String? selectedText,
    List<_i15.PageRouteInfo>? children,
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

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MoneyTransferRouteArgs>();
      return _i5.MoneyTransferPage(
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

  final _i16.Key? key;

  final _i16.TextEditingController amountController;

  final String? selectedText;

  @override
  String toString() {
    return 'MoneyTransferRouteArgs{key: $key, amountController: $amountController, selectedText: $selectedText}';
  }
}

/// generated route for
/// [_i6.ProfileAccountPage]
class ProfileAccountRoute extends _i15.PageRouteInfo<void> {
  const ProfileAccountRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ProfileAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileAccountRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProfileAccountPage();
    },
  );
}

/// generated route for
/// [_i7.ProfilePage]
class ProfileRoute extends _i15.PageRouteInfo<void> {
  const ProfileRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i7.ProfilePage();
    },
  );
}

/// generated route for
/// [_i8.QrCodePage]
class QrCodeRoute extends _i15.PageRouteInfo<void> {
  const QrCodeRoute({List<_i15.PageRouteInfo>? children})
      : super(
          QrCodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'QrCodeRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i8.QrCodePage();
    },
  );
}

/// generated route for
/// [_i9.ScannerPage]
class ScannerRoute extends _i15.PageRouteInfo<void> {
  const ScannerRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ScannerRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScannerRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i9.ScannerPage();
    },
  );
}

/// generated route for
/// [_i10.TeamPage]
class TeamRoute extends _i15.PageRouteInfo<void> {
  const TeamRoute({List<_i15.PageRouteInfo>? children})
      : super(
          TeamRoute.name,
          initialChildren: children,
        );

  static const String name = 'TeamRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i10.TeamPage();
    },
  );
}

/// generated route for
/// [_i11.TeamViewPage]
class TeamViewRoute extends _i15.PageRouteInfo<TeamViewRouteArgs> {
  TeamViewRoute({
    _i16.Key? key,
    required String appBarName,
    required int level,
    required int userStatus,
    required String fetchDay,
    List<_i15.PageRouteInfo>? children,
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

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TeamViewRouteArgs>();
      return _i11.TeamViewPage(
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

  final _i16.Key? key;

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
/// [_i12.TransactionDetailsPage]
class TransactionDetailsRoute
    extends _i15.PageRouteInfo<TransactionDetailsRouteArgs> {
  TransactionDetailsRoute({
    required String? userId,
    required String? userName,
    required double? amount,
    required double? emergencyFund,
    required DateTime? transactionDateTime,
    required String? status,
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
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

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TransactionDetailsRouteArgs>();
      return _i12.TransactionDetailsPage(
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

  final _i16.Key? key;

  @override
  String toString() {
    return 'TransactionDetailsRouteArgs{userId: $userId, userName: $userName, amount: $amount, emergencyFund: $emergencyFund, transactionDateTime: $transactionDateTime, status: $status, key: $key}';
  }
}

/// generated route for
/// [_i13.TransactionHistoryPage]
class TransactionHistoryRoute
    extends _i15.PageRouteInfo<TransactionHistoryRouteArgs> {
  TransactionHistoryRoute({
    _i16.Key? key,
    required bool? isCommissionSelected,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          TransactionHistoryRoute.name,
          args: TransactionHistoryRouteArgs(
            key: key,
            isCommissionSelected: isCommissionSelected,
          ),
          initialChildren: children,
        );

  static const String name = 'TransactionHistoryRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TransactionHistoryRouteArgs>();
      return _i13.TransactionHistoryPage(
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

  final _i16.Key? key;

  final bool? isCommissionSelected;

  @override
  String toString() {
    return 'TransactionHistoryRouteArgs{key: $key, isCommissionSelected: $isCommissionSelected}';
  }
}

/// generated route for
/// [_i14.WithdrawalPage]
class WithdrawalRoute extends _i15.PageRouteInfo<void> {
  const WithdrawalRoute({List<_i15.PageRouteInfo>? children})
      : super(
          WithdrawalRoute.name,
          initialChildren: children,
        );

  static const String name = 'WithdrawalRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i14.WithdrawalPage();
    },
  );
}
