import 'package:bytesproject/src/model/product_model.dart';
import 'package:bytesproject/src/sevices/get_products_api_service.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  RxBool isLoadingdatails = false.obs;
  GetProdectsServicesApi getProdectsServicesApi = GetProdectsServicesApi();
  List<Productsdetails> productDataList = [];
  getproductdetails({required String id}) async {
    print(
        '========================test==1==========${id}=======================');
    isLoadingdatails(true);
    update();
    dio.Response<dynamic> response =
        await getProdectsServicesApi.getproductdetailsApi(id: id);
    isLoadingdatails(false);
    update();
    print('========================test==2=================================');
    if (response.data["success"] == true) {
      GetPordectsModel getPordectsModel =
          GetPordectsModel.fromJson(response.data);
      productDataList = getPordectsModel.list;
      print('========================test==3=================================');
    } else {}
    update();
  }
}
