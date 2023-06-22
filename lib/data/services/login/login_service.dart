import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:aleynabitirme/data/services/dio_manager.dart';

import 'model/login_request_model.dart';
import 'model/login_response_model.dart';

abstract class LoginService {
  Future login(LoginRequestModel registerRequestModel);
}
class LoginServiceImp extends LoginService {
  final Dio _dio;
  LoginServiceImp(DioManager _dioManager): _dio= _dioManager.dio;

  @override
  Future login(LoginRequestModel loginRequestModel) async {
    const String _baseUrl = 'http://aleynahilalkizmaz.com/notebook/login.php';

    var _url = Uri.parse(_baseUrl);

    final response = await http.post(_url, body: loginRequestModel.toJson());

    if (response.statusCode == 200) {
      print('GİRİŞ BAŞARILI');
      return loginResponseModelFromJson(response.body);
    } else {
      return '';
    }
  }
}