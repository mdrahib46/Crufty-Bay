import 'package:cruftybay/app/app_theme_data.dart';
import 'package:cruftybay/features/auth/ui/screens/email_verification_screen.dart';
import 'package:cruftybay/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:cruftybay/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class CruftyBay extends StatelessWidget {
  const CruftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,

      routes: {
        '/': (context) => const SplashScreen(),
        EmailVerificationScreen.name: (context) => const EmailVerificationScreen(),
        OtpVerificationScreen.name: (context) => const OtpVerificationScreen(),
      },


      // home: SplashScreen(),
    );
  }
}

