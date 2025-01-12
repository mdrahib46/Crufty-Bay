import 'package:cruftybay/features/auth/ui/widgets/email_verification_controller.dart';
import 'package:cruftybay/features/auth/ui/widgets/otp_verification_controller.dart';
import 'package:cruftybay/features/common/ui/controllers/main_bottom_nab_controllers.dart';
import 'package:cruftybay/services/networkcaller/networkcaller.dart';
import 'package:get/get.dart';


class ControllerBinder extends Bindings{

  @override
  void dependencies() {
    Get.put(MainBottomNabController());
    Get.put(NetworkCaller());
    Get.put(EmailVerificationController());
    Get.put(OTPVerificationController());

  }
}