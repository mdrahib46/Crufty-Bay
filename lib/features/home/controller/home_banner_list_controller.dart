import 'package:cruftybay/app/urls.dart';
import 'package:cruftybay/features/home/data/model/SliderModel.dart';
import 'package:cruftybay/features/home/data/model/slider_pagination_response.dart';
import 'package:cruftybay/services/networkcaller/network_response.dart';
import 'package:cruftybay/services/networkcaller/networkcaller.dart';
import 'package:get/get.dart';

class SliderListController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  SliderPaginationModel? _sliderPaginationListModel;

  List<SliderModel> get bannerList => _sliderPaginationListModel?.data!.results ?? [];



  Future<bool> getHomeBannerList() async{
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(Urls.homeSlideUrl);
    if(response.isSuccess){
      _sliderPaginationListModel = SliderPaginationModel.fromJson(response.responseData);
      isSuccess = true;
    }else{
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();


    return isSuccess;

  }

}