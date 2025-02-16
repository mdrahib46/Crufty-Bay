import 'package:cruftybay/app/urls.dart';
import 'package:cruftybay/features/auth/ui/controller/read_profile_controller.dart';
import 'package:cruftybay/features/common/ui/controllers/auth_controller.dart';
import 'package:cruftybay/services/networkcaller/network_response.dart';
import 'package:cruftybay/services/networkcaller/networkcaller.dart';
import 'package:get/get.dart';

class OTPVerificationController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _shouldNavigateCompleteProfile = false;
  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;

  String? _token;
  String? get token => _token;

  Future<bool> verifyOTP(String email, String otp) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      Urls.otpVerification(email, otp),
    );
    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
      String token = response.responseData['data'];
      AuthController.saveAccessToken(token);
      ///Navigate  CompleteProfile Screen Form OTPVerification Screen

      await Get.find<ReadProfileController>().readProfile(token);
      if (Get.find<ReadProfileController>().profileModel == null) {
        _shouldNavigateCompleteProfile = true;
      } else {
        // await Get.find<AuthController>().saveUserData(token, Get.find<ReadProfileController>().profileModel!);
        // _shouldNavigateCompleteProfile = false;
      }
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
