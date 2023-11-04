import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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

// Resource<T> getErrorBody<T>(Object exception) {
//   if (exception.runtimeType == DioError) {
//     var dioException = exception as DioError;
//     return Resource(Status.ERROR,
//         errorMessage:
//             GenericResponseBody.fromJson(dioException.response!.data)
//                 .msgValue);
//   } else {
//     return Resource(Status.ERROR, errorMessage: exception.toString());
//   }
// }

// Future<Resource<List<ProjectModel>>> getMyProjects(int uid) async {
//   try {
//     var response = await dio.get("${baseUrl}listProjects/$uid");
//     List<ProjectModel> myProjects = [];
//     for (var item in response.data) {
//       myProjects.add(ProjectModel.fromJson(item));
//     }
//     return Resource(Status.SUCCESS, data: myProjects);
//   } catch (exception) {
//     return Resource(Status.ERROR, errorMessage: exception.toString());
//   }
// }
}
