import 'package:aleynabitirme/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/get_controllers.dart';
import 'data/routing/get_pages.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  Future<void> main() async {
    await getControllers();

  }

  @override
  Widget build(BuildContext context) {
    main();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      home: LoginPage(),
    );
  }
}


