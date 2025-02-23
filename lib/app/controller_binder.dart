import 'package:cruftybay/features/auth/ui/controller/sign_up_controller.dart';
import 'package:cruftybay/features/auth/ui/controller/signIn_controller.dart';
import 'package:cruftybay/features/auth/ui/controller/otp_verification_controller.dart';
import 'package:cruftybay/features/auth/ui/controller/read_profile_controller.dart';
import 'package:cruftybay/features/common/ui/controllers/auth_controller.dart';
import 'package:cruftybay/features/common/ui/controllers/category_list_controller.dart';
import 'package:cruftybay/features/common/ui/controllers/main_bottom_nab_controllers.dart';
import 'package:cruftybay/features/home/controller/home_banner_list_controller.dart';
import 'package:cruftybay/features/home/controller/popular_product_list_by_remark_controller.dart';
import 'package:cruftybay/services/networkcaller/networkcaller.dart';
import 'package:get/get.dart';


class ControllerBinder extends Bindings{

  @override
  void dependencies() {
    Get.put(MainBottomNabController());
    Get.put(AuthController());
    Get.put(NetworkCaller());
    Get.put(SignInController());
    Get.put(SignUpController());
    Get.put(OTPVerificationController());
    Get.put(ReadProfileController());
    Get.put(HomeCarouselSliderController());
    Get.put(CategoryListController());
    Get.put(PopularProductListByRemarkController());
  }
}