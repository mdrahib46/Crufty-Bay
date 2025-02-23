import 'package:cruftybay/app/urls.dart';
import 'package:cruftybay/features/auth/data/model/auth_success_model.dart';
import 'package:cruftybay/features/common/ui/controllers/auth_controller.dart';
import 'package:cruftybay/services/networkcaller/network_response.dart';
import 'package:cruftybay/services/networkcaller/networkcaller.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> signIn(String email, String password) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final requestParams = {"email": email, "password": password};
    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(Urls.signInUrl, body: requestParams);
    if (response.isSuccess) {
      AuthSuccessModel signInModel = AuthSuccessModel.fromJson(response.responseData);
      await Get.find<AuthController>().saveUserData(signInModel.data!.token!, signInModel.data!.user as User);
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
