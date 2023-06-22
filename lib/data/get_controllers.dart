import 'package:aleynabitirme/data/services/add_notes/add_notes_service.dart';
import 'package:aleynabitirme/data/services/dio_manager.dart';
import 'package:aleynabitirme/data/services/home/home_service.dart';
import 'package:aleynabitirme/data/services/login/login_service.dart';
import 'package:aleynabitirme/data/services/register/register_service.dart';
import 'package:get/get.dart';

import '../views/add_notes/add_notes_controller.dart';
import '../views/home/home_controller.dart';
import '../views/info/info_controller.dart';
import '../views/login/login_controller.dart';

import '../views/register/register_controller.dart';


Future getControllers() async {
  //PAGES
  Get.create(() => LoginController(Get.find()), permanent: false);
  Get.create(() => RegisterController(Get.find()), permanent: false);
  Get.create(() => HomeController(Get.find()), permanent: false);
  Get.create(() => AddNotesController(Get.find()), permanent: false);
  Get.create(() => InfoController(), permanent: false);

//Services
  Get.lazyPut(()=> DioManager(),fenix: true);

  Get.lazyPut<RegisterService>(() => RegisterServiceImp(Get.find()));
  Get.lazyPut<LoginService>(() => LoginServiceImp(Get.find()));
  Get.lazyPut<AddNotesService>(() => AddNotesServiceImp());
  Get.lazyPut<HomeService>(() => HomeServiceImp(Get.find()));

}