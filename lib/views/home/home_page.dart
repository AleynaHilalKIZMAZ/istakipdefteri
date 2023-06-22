import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aleynabitirme/data/src/colors.dart';
import 'package:aleynabitirme/data/src/images.dart';
import 'package:aleynabitirme/data/src/strings.dart';
import 'package:aleynabitirme/views/add_notes/add_notes_page.dart';
import 'package:aleynabitirme/views/home/home_controller.dart';
import 'package:aleynabitirme/views/info/info_page.dart';
import 'package:aleynabitirme/views/login/login_page.dart';



class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/views/home/home_page';

  @override
  Widget build(BuildContext context) {
    controller.error.listen((error) => _errorDialog());

    return Scaffold(
        appBar: AppBar(
          title: Text(homeAppBarText),
          backgroundColor: mainColor,
        ),
        drawer: _buildDrawer(),
        body: _buildBody(),
        floatingActionButton: _buildFloatingActionButton());
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () => _goToAddNotePage(),
      child: Icon(Icons.add),
      backgroundColor: mainColor,
    );
  }

  Widget _buildBody() {
    return Obx(
          () => ListView.builder(
             itemBuilder: (_, index) => Padding(
               padding: const EdgeInsets.all(5.0),
               child: _buildCard(controller.notes.value?[index] ?? ""),
           // controller.notes.value?[index] ?? "",
          ),
        itemCount: controller.notes.value?.length ?? 0,
          ),
    );
  }

  Widget _buildCard(String title) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
      child: Text(title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      ),
    );
  }


  Widget _buildSpace() {
    return SizedBox(
      height: 10,
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildDrawerHeader(),
          _buildTitle(homeAppBarText, Icons.home, _goToBack),

          Divider(),
          _buildTitle(infoText, Icons.info, _goToInfo),
          Divider(),
          _buildTitle(logoutText, Icons.logout, _goToLogout),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text('Aleyna'),
      accountEmail: Text('Aleyna@gmail.com'),
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage(githubLogo),
        backgroundColor: white,
      ),
      decoration: BoxDecoration(color: mainColor),
    );
  }

  Widget _buildTitle(String text, IconData, Function function) {
    return ListTile(
      title: Text(text),
      leading: Icon(
        IconData,
        color: mainColor,
      ),
      onTap: () => function(),
    );
  }

  void _goToBack() {
    Get.back();
  }



  void _goToInfo() {
    Get.toNamed(InfoPage.routeName);
  }

  void _goToLogout() {
    Get.offNamedUntil(LoginPage.routeName, (route) => false);
  }

  void _goToAddNotePage() {
    Get.toNamed(AddNotesPage.routeName);
  }


  void _errorDialog() {
    Get.snackbar(
      errorTitle,
      errorDescription,
      colorText: white,
      backgroundColor: red,
    );
  }
}