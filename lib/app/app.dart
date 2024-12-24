import 'package:cruftybay/app/app_theme_data.dart';
import 'package:cruftybay/app/controller_binder.dart';
import 'package:cruftybay/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:cruftybay/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:cruftybay/features/auth/ui/screens/email_verification_screen.dart';
import 'package:cruftybay/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:cruftybay/features/auth/ui/screens/splash_screen.dart';
import 'package:cruftybay/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CruftyBay extends StatelessWidget {
  const CruftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,

      initialBinding: ControllerBinder(),
      routes: {
        '/': (context) => const SplashScreen(),
        EmailVerificationScreen.name: (context) => const EmailVerificationScreen(),
        OtpVerificationScreen.name: (context) => const OtpVerificationScreen(),
        CompleteProfileScreen.name: (context)=> const CompleteProfileScreen(),
        MainBottomNavScreen.name: (context)=> const MainBottomNavScreen(),

      },


      // home: SplashScreen(),
    );
  }
}

