import 'package:cruftybay/features/auth/ui/controller/signIn_controller.dart';
import 'package:cruftybay/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:cruftybay/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:cruftybay/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:cruftybay/features/common/ui/widgets/snackbar_message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/SignIn-Screen';

  @override
  State<SignInScreen> createState() =>
      _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignInController _emailVerificationController =
      Get.find<SignInController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 80),
                const AppLogoWidget(),
                const SizedBox(height: 16),
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Please Enter Your Email Address',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _emailTEController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    hintText: 'Email address',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your email';
                    }
                    if (EmailValidator.validate(value!) == false) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordTEController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                GetBuilder<SignInController>(
                  builder: (controller) {
                    if(controller.inProgress){
                      return const CenterCircularProgressIndicator();
                    }
                    return ElevatedButton(
                        onPressed: _onTapNextButton,
                        child: const Text('Sign In'));
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapNextButton() async {
    if (_formKey.currentState!.validate()) {
      bool isSuccess = await _emailVerificationController
          .signIn(_emailTEController.text.trim(), _passwordTEController.text);

      if (isSuccess) {
        if (mounted) {
          Navigator.pushNamed(context, MainBottomNavScreen.name, arguments: _emailTEController.text.trim());
        }
      } else {
        if (mounted) {
          showSnackBarMessage(context, _emailVerificationController.errorMessage!);

        }
      }
    }
  }
}
