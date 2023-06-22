
import 'package:http/http.dart' as http;

import 'model/add_notes_request_model.dart';
import 'model/add_notes_response_model.dart';

abstract class AddNotesService {
  Future addNotes(AddNotesRequestModel addNotesRequestModel);
}

class AddNotesServiceImp extends AddNotesService {
  @override
  Future addNotes(AddNotesRequestModel addNotesRequestModel) async {
    const String _baseUrl = 'http://aleynahilalkizmaz.com/notebook/add_notes.php';

    var _url = Uri.parse(_baseUrl);

    final response = await http.post(_url, body: addNotesRequestModel.toJson());

    if (response.statusCode == 200) {
      return addNotesResponseModelFromJson(response.body);
    } else {
      return '';
    }
  }
}