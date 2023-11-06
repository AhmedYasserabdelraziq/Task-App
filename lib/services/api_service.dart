import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:task_test/screens/home_screen/model/place_holder_model.dart';

import '../core/utils/resources.dart';
import '../core/utils/status.dart';

class ApiService {
  final String baseUrl;
  final Dio dio;

  ApiService(this.baseUrl) : dio = Dio(BaseOptions(baseUrl: baseUrl)) {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
  }

  Future<Resource<List<UserModel>>> getMyUsers() async {
    try {
      var response = await dio.get("${baseUrl}users");
      List<UserModel> myUsers = [];
      for (var item in response.data) {
        myUsers.add(UserModel.fromJson(item));
      }
      return Resource(Status.SUCCESS, data: myUsers);
    } catch (exception) {
      return Resource(Status.ERROR, errorMessage: exception.toString());
    }
  }
}
