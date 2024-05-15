import 'dart:io';
import 'package:bytesproject/src/sevices/baseurl.dart';
import 'package:dio/dio.dart';

class GetProdectsServicesApi extends BaseApiService {
  Future getproductdetailsApi({
    required String id,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();

      var response = await dio.post(productsURI,
          options: Options(
              headers: {
                'Accept': 'application/json',
                'appid': '2IPbyrCUM7s5JZhnB9fxFAD6',
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: {
            "page": id,
          });
      print(
          "::::::::<get product details Api>::${id}::::::status code::::::::::");
      print(response.statusCode);
      print(response.data);
      responseJson = response;
    } on SocketException {
      print("no internet");
    }
    return responseJson;
  }

  dynamic returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        print("here.>>>>>>>>>>>>");
        return responseJson;
      case 400:
      // throw BadRequestException(response.body.toString());
      case 401:
      case 403:
      // throw UnauthorisedException(response.body.toString());
      case 404:
      // throw UnauthorisedException(response.body.toString());
      case 500:
      default:
      // throw FetchDataException(
      //     'Error occured while communication with server' +
      //         ' with status code : ${response.statusCode}');
    }
  }
}
