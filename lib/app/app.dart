import 'package:cruftybay/app/app_theme_data.dart';
import 'package:cruftybay/app/controller_binder.dart';
import 'package:cruftybay/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:cruftybay/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:cruftybay/features/auth/ui/screens/email_verification_screen.dart';
import 'package:cruftybay/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:cruftybay/features/auth/ui/screens/splash_screen.dart';
import 'package:cruftybay/features/category/ui/screens/category_list_screen.dart';
import 'package:cruftybay/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CruftyBay extends StatelessWidget {
  const CruftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,

      initialBinding: ControllerBinder(),

      onGenerateRoute: (RouteSettings settings) {
        late Widget widget;

        if (settings.name == SplashScreen.name) {
          widget = const SplashScreen();
        } else if (settings.name == EmailVerificationScreen.name) {
          widget = const EmailVerificationScreen();
        } else if (settings.name == OtpVerificationScreen.name) {
          widget = const OtpVerificationScreen();
        } else if (settings.name == CompleteProfileScreen.name) {
          widget = const CompleteProfileScreen();
        } else if (settings.name == MainBottomNavScreen.name) {
          widget = const MainBottomNavScreen();
        } else if (settings.name == CategoryListScreen.name) {
          widget = const CategoryListScreen();
        } else if (settings.name == ProductListScreen.name) {
          String name = settings.arguments as String;
          widget = ProductListScreen(categoryName: name);
        }
        return MaterialPageRoute(builder: (ctx) {
          return widget;
        });
      },

      // home: SplashScreen(),
    );
  }
}
