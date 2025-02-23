import 'package:cruftybay/features/auth/data/model/signup_params.dart';
import 'package:cruftybay/features/auth/ui/controller/sign_up_controller.dart';
import 'package:cruftybay/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:cruftybay/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:cruftybay/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:cruftybay/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:cruftybay/features/common/ui/widgets/snackbar_message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const name = '/SignUp-Screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityNameTEController = TextEditingController();

  final SignUpController _signUpController = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 60),
                const AppLogoWidget(
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 16),
                Text(
                  'Complete Profile',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Get started with us with your details',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                _buildForm(),
                const SizedBox(height: 16),
                GetBuilder<SignUpController>(builder: (controller) {
                  return Visibility(
                    visible: controller.inProgress == false,
                    replacement: const CenterCircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _signUp();
                        }
                      },
                      child: const Text('Sign Up'),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _firstNameTEController,
            decoration: const InputDecoration(hintText: 'First Name'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return "Enter your first name";
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _lastNameTEController,
            decoration: const InputDecoration(hintText: 'Last Name'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return "Enter your last name";
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
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
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
            validator: (String? value) {
              if ((value?.isEmpty ?? true) || value!.length < 6) {
                return 'Enter a password more than 8 character';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _mobileTEController,
            decoration: const InputDecoration(hintText: 'Mobile'),
            maxLength: 11,
            validator: (String? value) {
              final regex = RegExp(r'^01[3-9]\d{8}$');
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your mobile number';
              }
              if (!regex.hasMatch(value!)) {
                return "Enter your valid mobile number !";
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _cityNameTEController,
            decoration: const InputDecoration(hintText: 'City Name'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return "Enter your city name";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Future<void> _signUp() async {
    SignUpParams signUpParams = SignUpParams(
      _emailTEController.text.trim(),
      _firstNameTEController.text.trim(),
      _lastNameTEController.text.trim(),
      _passwordTEController.text,
      _mobileTEController.text.trim(),
      _cityNameTEController.text.trim(),
    );
    final bool isSuccess = await _signUpController.signUp(signUpParams);
    if (isSuccess) {
      if (mounted) {
        Navigator.pushNamed(context, OtpVerificationScreen.name, arguments: _emailTEController.text.trim());
      }
    } else {
      if (mounted) {
        showSnackBarMessage(context, _signUpController.errorMessage!);
      }
    }
  }

  @override
  void dispose() {
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _emailTEController.clear();
    _passwordTEController.clear();
    _mobileTEController.clear();
    _cityNameTEController.clear();
    super.dispose();
  }
}
