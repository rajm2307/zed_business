import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:zed_business/core/styles/text.style.dart';
import 'package:zed_business/features/homePage/presentation/logic/others/carousel.dart';
import 'package:zed_business/features/homePage/presentation/logic/others/drawer.dart';
import 'package:zed_business/features/homePage/presentation/logic/others/homepage.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  static var page;

  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool _isLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    if (mounted) {
      _getHome();
    }
  }

  _getHome() async {
    if (mounted) {
      setState(() {
        _isLoading = true;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the GlobalKey to the Scaffold

      backgroundColor: Color.fromRGBO(230, 230, 230, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(230, 230, 230, 1),
        scrolledUnderElevation: 10.0,
        toolbarHeight: 1,
      ),
      drawer: openDrawer(),
      body: RefreshIndicator(
        onRefresh: () async {
          await _getHome();
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: _isLoading
              ? Center(
                  child: LoadingAnimationWidget.flickr(
                      size: 50,
                      leftDotColor: Colors.red,
                      rightDotColor: Colors.green),
                )
              : SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(),
                  ),
                ),
        ),
      ),
    );
  }
}
