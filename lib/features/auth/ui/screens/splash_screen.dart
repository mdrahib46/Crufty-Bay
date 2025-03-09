import 'package:cruftybay/app/app_color.dart';
import 'package:cruftybay/features/auth/ui/screens/signIn_screen.dart';
import 'package:cruftybay/features/common/ui/controllers/auth_controller.dart';
import 'package:cruftybay/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/app_logo_widget.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

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
    await AuthController.getAccessToken();
    if (await Get.find<AuthController>().isUserLoggedIn()) {
      await Get.find<AuthController>().getUserData();
      if (mounted) {
        Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
      }
    } else {
      if (mounted) {
        Navigator.pushNamed(context, SignInScreen.name);
      }
    }
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
            CircularProgressIndicator(color: AppColors.themeColor),
            SizedBox(height: 10),
            Text('Version : 1.0'),
            SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}
