import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jono/common/constants/colors.dart';
import 'package:jono/modules/bottom_view/views/bottom_view.dart';
import 'package:jono/modules/splash/views/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/splash-page';
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void navigate() async {
    if (mounted) {
      Future.delayed(const Duration(seconds: 1)).then(
        (value) {
          if (FirebaseAuth.instance.currentUser != null) {
            return Navigator.pushNamedAndRemoveUntil(
                context, BottomPage.routeName, (route) => false);
          }

          return Navigator.pushNamedAndRemoveUntil(
              context, OnboardingPage.routeName, (route) => false);
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svgs/logo.svg'),
          ],
        ),
      ),
    );
  }
}
