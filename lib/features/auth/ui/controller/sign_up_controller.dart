import 'package:cruftybay/app/urls.dart';
import 'package:cruftybay/features/auth/data/model/auth_success_model.dart';
import 'package:cruftybay/features/auth/data/model/signup_params.dart';
import 'package:cruftybay/features/auth/ui/controller/read_profile_controller.dart';
import 'package:cruftybay/features/common/ui/controllers/auth_controller.dart';
import 'package:cruftybay/services/networkcaller/network_response.dart';
import 'package:cruftybay/services/networkcaller/networkcaller.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  final bool _shouldNavigateMainBottomScreen = false;

  bool get shouldNavigateMainBottomScreen => _shouldNavigateMainBottomScreen;

  Future<bool> signUp(SignUpParams params) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
    await Get.find<NetworkCaller>().postRequest(
      Urls.signUpUrl,
      body: params.toJson(),
    );
    if (response.isSuccess) {
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
