import 'package:cruftybay/features/common/ui/controllers/main_bottom_nab_controllers.dart';
import 'package:get/get.dart';


class ControllerBinder extends Bindings{

  @override
  void dependencies() {
    Get.put(MainBottomNabController());
  }
}