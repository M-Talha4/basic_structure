import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../common/constants/app_images.dart';
import '../common/constants/global_variables.dart';
import '../common/constants/static_data.dart';
import '../router/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool colorChanged = false;
  @override
  void initState() {
    super.initState();
    _changeColor();
    _navigate();
  }

  /// change the [Coloring]
  Future<void> _changeColor() async {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        colorChanged = true;
        context.loaderOverlay.show();
        _navigate();
      });
    });
  }

  /// change the [Navigate] ahead
  Future<void> _navigate() async {
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) {
        context.loaderOverlay.hide();
        if (StaticData.isFirstTime) {
          // context.pushReplacementNamed(AppRoute.onBoarding);
        } else if (StaticData.isLoggedIn) {
          if (StaticData.isUser) {
            // context.pushReplacementNamed(AppRoute.tenantBottomNavigation);
          } else {
            // context.pushReplacementNamed(AppRoute.landlordAddProperty);
          }
        } else {
          // context.pushReplacementNamed(AppRoute.chooseRole);
        }
        context.pushReplacementNamed(AppRoute.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: colorChanged
              ? colorScheme(context).primary
              : colorScheme(context).surface,
          gradient: colorChanged
              ? null
              : RadialGradient(radius: 16, colors: [
                  colorScheme(context).surface,
                  colorScheme(context).primary,
                ]),
        ),
        child: Center(
            child: Image.asset(
          width: 180,
          colorChanged ? AppImages.avatar : AppImages.avatar,
        )),
      ),
    );
  }
}
