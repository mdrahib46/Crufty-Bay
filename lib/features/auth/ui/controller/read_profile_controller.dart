import 'package:cruftybay/app/urls.dart';
import 'package:cruftybay/features/auth/data/model/profile_model.dart';
import 'package:cruftybay/services/networkcaller/network_response.dart';
import 'package:cruftybay/services/networkcaller/networkcaller.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  ProfileModel? _profileModel;
  ProfileModel? get profileModel => _profileModel;

  Future<bool> readProfile(String token) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(Urls.readProfile, accessToken: token);
    if (response.isSuccess) {
      _errorMessage = null;
      if(response.responseData['data'] == null){
        _profileModel = null;
      }else{
        _profileModel = ProfileModel.fromJson(response.responseData['data']);
      }
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();

    return isSuccess;
  }
}
