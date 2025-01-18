import 'package:cruftybay/features/auth/ui/controller/complete_profile_Screen_controller.dart';
import 'package:cruftybay/features/auth/ui/controller/email_verification_controller.dart';
import 'package:cruftybay/features/auth/ui/controller/otp_verification_controller.dart';
import 'package:cruftybay/features/auth/ui/controller/read_profile_controller.dart';
import 'package:cruftybay/features/common/ui/controllers/auth_controller.dart';
import 'package:cruftybay/features/common/ui/controllers/main_bottom_nab_controllers.dart';
import 'package:cruftybay/features/home/controller/home_banner_list_controller.dart';
import 'package:cruftybay/services/networkcaller/networkcaller.dart';
import 'package:get/get.dart';


class ControllerBinder extends Bindings{

  @override
  void dependencies() {
    Get.put(MainBottomNabController());
    Get.put(AuthController());
    Get.put(NetworkCaller());
    Get.put(EmailVerificationController());
    Get.put(OTPVerificationController());
    Get.put(ReadProfileController());
    Get.put(CreateProfileScreenController());
    Get.put(HomeCarouselSliderController());
  }
}