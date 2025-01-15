import 'package:cruftybay/app/urls.dart';
import 'package:cruftybay/features/auth/ui/controller/read_profile_controller.dart';
import 'package:cruftybay/features/common/ui/controllers/auth_controller.dart';
import 'package:cruftybay/services/networkcaller/network_response.dart';
import 'package:cruftybay/services/networkcaller/networkcaller.dart';
import 'package:get/get.dart';

class CreateProfileScreenController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _shouldNavigateMainBottomScreen = false;
  bool get shouldNavigateMainBottomScreen => _shouldNavigateMainBottomScreen;

  Future<bool> createProfile({
    required String cusName,
    required String cusAddress,
    required String cusCity,
    required String cusState,
    required String cusPostCode,
    required String cusCountry,
    required String cusPhoneNumber,
    required String cusFax,
    required String shipPersonName,
    required String shipAddress,
    required String shipCity,
    required String shipState,
    required String shipPostCode,
    required String shipCountry,
    required String shipPhone,
  }) async {
    Map<String, dynamic> requestBody = {
      "cus_name": cusName,
      "cus_add": cusAddress,
      "cus_city": cusCity,
      "cus_state": cusState,
      "cus_postcode": cusPostCode,
      "cus_country": cusCountry,
      "cus_phone": cusPhoneNumber,
      "cus_fax": cusFax,
      "ship_name": shipPersonName,
      "ship_add": shipAddress,
      "ship_city": shipCity,
      "ship_state": shipState,
      "ship_postcode": shipPostCode,
      "ship_country": shipCountry,
      "ship_phone": shipPhone,
    };

    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(
      Urls.createProfile,
      body: requestBody,
    );

    if (response.isSuccess) {
      _errorMessage = null;
      await Get.find<AuthController>().saveUserData(
        AuthController.accessToken.toString(),
        Get.find<ReadProfileController>().profileModel!,
      );
      _shouldNavigateMainBottomScreen = true;
      isSuccess = true;
      _inProgress = false;
      update();
    } else {
      _errorMessage = response.errorMessage;
      _shouldNavigateMainBottomScreen = false;
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}
