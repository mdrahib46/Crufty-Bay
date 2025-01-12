import 'package:cruftybay/app/app_color.dart';
import 'package:cruftybay/app/app_constants.dart';
import 'package:cruftybay/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:cruftybay/features/auth/ui/widgets/otp_verification_controller.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  static const String name = "/Otp-VerificationScreen";

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpTEController = TextEditingController();

  RxInt _remainingTime = AppConstants.resendOtpTimeOutInSecs.obs;
  late Timer timer;

  RxBool enableResendCodeButton = false.obs;

  final OTPVerificationController _otpVerificationController = Get.find<OTPVerificationController>();

  @override
  void initState() {
    super.initState();
    _startResendCodeTime();
  }

  void _startResendCodeTime() {
    enableResendCodeButton.value = false;
    _remainingTime.value = AppConstants.resendOtpTimeOutInSecs;
    timer = Timer.periodic(const Duration(seconds: 1), (time) {
      _remainingTime--;
      setState(() {});
      if (_remainingTime.value == 0) {
        time.cancel();
        enableResendCodeButton.value = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  const AppLogoWidget(),
                  const SizedBox(height: 16),
                  Text(
                    'Enter OTP Code',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'A 4 digit otp has been sent',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  const SizedBox(height: 24),
                  PinCodeTextField(
                    appContext: context,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    animationDuration: const Duration(milliseconds: 300),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      activeColor: AppColors.themeColor,
                      inactiveColor: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(8),
                      selectedColor: Colors.green,
                    ),
                    keyboardType: TextInputType.number,
                    controller: _otpTEController,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {

                    },
                    child: const Text('Next'),
                  ),
                  const SizedBox(height: 24),
                  Obx(
                    () => Visibility(
                      visible: !enableResendCodeButton.value,
                      child: RichText(
                        text: TextSpan(
                          text: 'This Code will be expired in ',
                          style: const TextStyle(color: Colors.grey),
                          children: [
                            TextSpan(
                              text: '${_remainingTime}s',
                              style:
                                  const TextStyle(color: AppColors.themeColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Visibility(
                      visible: enableResendCodeButton.value,
                      child: TextButton(
                        onPressed: () {
                          _startResendCodeTime();
                        },
                        child: const Text('Resend Code'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  // Fluture<void> _onTapNextButton() async{
  //     if(_formKey.currentState!.validate()){
  //       bool isSuccess = _otpVerificationController.verifyOtpController(, otp)
  //     }
  // }
}
