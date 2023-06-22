import 'package:aleynabitirme/data/services/home/model/home_response_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:aleynabitirme/data/services/home/home_service.dart';

class HomeController extends GetxController {
  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();

  final Rxn<List> notes= Rxn();

  final HomeService _homeService;

  HomeController(this._homeService);

  @override
  void onInit(){
    _callingGetNotes();
    super.onInit();
  }


  void _callingGetNotes() {
    isLoading.call(true);

    _homeService.getNotes().then((not) {
      notes.value=not;
    }).catchError((dynamic error) {
      this.error.trigger(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }

  }



