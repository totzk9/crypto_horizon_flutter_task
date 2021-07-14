import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class RemoteDataSource extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://api.coinranking.com/v2';

    httpClient.addRequestModifier<void>((Request<void> request) {
      request.headers['x-access-token'] = 'coinranking75c80398941aa2ed77c894d93e33c7f0e3c6ed1ec6e06232';
      request.headers['Content-Type'] = 'application/json';
      return request;
    });

    httpClient.addResponseModifier((Request<Object?> request, Response<Object?> response) async {
      return response;
    });
  }
}
