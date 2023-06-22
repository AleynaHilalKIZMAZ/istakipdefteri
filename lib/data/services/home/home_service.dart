import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:aleynabitirme/data/services/home/model/home_response_model.dart';

import '../dio_manager.dart';

abstract class HomeService {
  Future getNotes();

}

class HomeServiceImp extends HomeService {
  final Dio _dio;

  HomeServiceImp(DioManager _diomanager): _dio= _diomanager.dio;

  @override
  Future getNotes() async {
    const String _baseUrl = 'http://aleynahilalkizmaz.com/notebook/get_notes.php';

    var _url = Uri.parse(_baseUrl);

    final response = await http.get(_url);

    var noteList=[];

    if (response.statusCode == 200) {
      var data= homeResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        noteList.add(data[i].title);
      }
      return noteList;
    } else {
      return '';
    }
  }

}