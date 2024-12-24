import 'package:cruftybay/app/app_color.dart';
import 'package:cruftybay/app/asset_path.dart';
import 'package:cruftybay/common/ui/controllers/main_bottom_nab_controllers.dart';
import 'package:cruftybay/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:cruftybay/features/auth/ui/screens/email_verification_screen.dart';
import 'package:cruftybay/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/app_logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _moveToNextScreen();
    super.initState();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            AppLogoWidget(),
            Spacer(),
            CircularProgressIndicator(
              color: AppColors.themeColor,
            ),
            SizedBox(height: 10),
            Text('Version : 1.0'),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
