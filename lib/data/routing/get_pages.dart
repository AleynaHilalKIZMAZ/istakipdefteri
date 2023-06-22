import 'package:get/get.dart';

import '../../views/add_notes/add_notes_page.dart';
import '../../views/home/home_page.dart';
import '../../views/info/info_page.dart';
import '../../views/login/login_page.dart';

import '../../views/register/register_page.dart';



List<GetPage> getPages = [
  GetPage(name: LoginPage.routeName, page: () => LoginPage()),
  GetPage(name: RegisterPage.routeName, page: () => RegisterPage()),
  GetPage(name: HomePage.routeName, page: () => HomePage()),
  GetPage(name: AddNotesPage.routeName, page: () => AddNotesPage()),
  GetPage(name: InfoPage.routeName, page: () => InfoPage()),


];