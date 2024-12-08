import 'package:cruftybay/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class CruftyBay extends StatelessWidget {
  const CruftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,


      home: SplashScreen(),
    );
  }
}

