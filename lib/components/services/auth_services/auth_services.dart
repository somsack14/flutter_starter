// import 'package:dio/dio.dart';
// import 'package:xt_trading/component/utils/api_base.dart';
// import '../../utils/api_path.dart';
//
// class AuthServices {
//   late Response response;
//   late Dio? _dio;
//
//   AuthServices() {
//     BaseOptions options = BaseOptions(
//       baseUrl: ApiBase.baseURL,
//       connectTimeout: kConnectTimeout,
//       receiveTimeout: kReceiveTimeout,
//     );
//     _dio = Dio(options);
//   }
//
//   Future login({required phone, required password, fcmToken}) async {
//     var uri = APIPathHelper.getValue(ApiPath.login);
//     Map data = {
//       "phone": phone,
//       "password": password,
//       "device_token": fcmToken,
//     };
//     response = await _dio!.post(
//       uri,
//       data: data,
//       options: Options(
//         contentType: Headers.jsonContentType,
//         headers: {
//           "Accept": "application/json",
//         },
//       ),
//     );
//     return response.data;
//   }
//

// }
