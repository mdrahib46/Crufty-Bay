import 'package:cruftybay/app/urls.dart';
import 'package:cruftybay/features/auth/data/model/auth_success_model.dart';
import 'package:cruftybay/features/common/ui/controllers/auth_controller.dart';
import 'package:cruftybay/services/networkcaller/network_response.dart';
import 'package:cruftybay/services/networkcaller/networkcaller.dart';
import 'package:get/get.dart';

class OTPVerificationController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  final bool _shouldNavigateCompleteProfile = false;

  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;

  String? _token;

  String? get token => _token;

  Future<bool> verifyOTP(String email, String otp) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final Map<String, dynamic> requestParams = {"email": email, "otp": otp};

    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(Urls.otpVerification, body: requestParams);
    if (response.isSuccess) {
      AuthSuccessModel authSuccessModel = AuthSuccessModel.fromJson(response.responseData);
      await Get.find<AuthController>().saveUserData(
        authSuccessModel.data!.token!,
        authSuccessModel.data!.user!,
      );
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
