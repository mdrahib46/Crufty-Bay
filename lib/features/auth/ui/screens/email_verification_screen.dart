import 'package:cruftybay/features/auth/ui/controller/email_verification_controller.dart';
import 'package:cruftybay/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:cruftybay/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:cruftybay/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:cruftybay/features/common/ui/widgets/snackbar_message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  static const String name = '/EmailVerificationScreen';

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EmailVerificationController _emailVerificationController =
      Get.find<EmailVerificationController>();

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
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your email';
                    }
                    if (EmailValidator.validate(value!) == false) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                GetBuilder<EmailVerificationController>(
                  builder: (controller) {
                    if(controller.inProgress){
                      return const CenterCircularProgressIndicator();
                    }
                    return ElevatedButton(
                        onPressed: _onTapNextButton,
                        child: const Text('Next'));
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
          .verifyEmail(_emailTEController.text.trim());
      if (isSuccess) {
        if (mounted) {
          Navigator.pushNamed(context, OtpVerificationScreen.name, arguments: _emailTEController.text.trim());
        }
      } else {
        if (mounted) {
          showSnackBarMessage(context, _emailVerificationController.errorMessage!);

        }
      }
    }
  }
}
