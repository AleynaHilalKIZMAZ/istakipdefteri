import 'package:aleynabitirme/data/src/strings.dart';
import 'package:aleynabitirme/views/add_notes/add_notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/src/colors.dart';
import '../home/home_page.dart';

class AddNotesPage extends GetWidget<AddNotesController>{
  const AddNotesPage({Key? key}): super(key: key);

  static const String routeName='/views/add_notes/add_notes_page';

  @override
  Widget build(BuildContext context) {
    controller.isSave.listen((isSave) {
      isSave ? _goToHome(): _empty();
    }
    );
    controller.error.listen((error) => _errorDialog());
    return Scaffold(
        appBar: AppBar(
          title: Text(addNoteAppBarText),
          backgroundColor: mainColor,
        ),
        body: _buildBody());
  }
  Widget _buildBody() {
    return Padding(
      padding:const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
      child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         crossAxisAlignment: CrossAxisAlignment.stretch,
         mainAxisSize: MainAxisSize.min,
         children:[
           SingleChildScrollView(
             child: Column(
               mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                _buildTitleText(),
                _buildSpace(),
                _buildTextFieldTitle(),
                _buildSpace(),
                Divider(),
                _buildSpace(),
                _buildDescription(),
                _buildSpace(),
               _buildTextFieldDescription(),

        ],
      ),
    ),
               _buildSpace(),
               _buildButton(),
     ],
    ),
      ),
    );
  }

  Widget _buildSpace() {
    return SizedBox(
      height: 20,
    );
  }


  Widget _buildTitleText() {
    return Text(addNoteTitleText,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _buildTextFieldTitle(){
    return  Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 40),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: addNoteTitleHintText,
          ),
          controller: controller.titleController,
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Text(addNoteDescriptionText,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _buildTextFieldDescription(){
    return  Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 70),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: addNoteDescriptionHinText,
          ),
          controller: controller.descriptionController,
        ),
      ),
    );
  }

  Widget _buildButton() {
    final double size = 40;
    return SizedBox(
      height: size,
      child: ElevatedButton(
          onPressed: () => _onTap(),
          child: Text(addNoteSaveButton),
          style: ElevatedButton.styleFrom(
            primary: mainColor,
          )),
    );
  }
  void _onTap() {
    if (controller.titleController.text.isNotEmpty || controller.descriptionController.text.isNotEmpty) {
      controller.callingAddNotesService(
        controller.titleController.text,
        controller.descriptionController.text,
      );
    } else {
      _emptyDialog();
    }
  }
  void _emptyDialog() {
    Get.snackbar(
      errorTitle,
      emptyText,
      colorText: white,
      backgroundColor: red,
    );
  }
  void _errorDialog() {
    Get.snackbar(
      errorTitle,
      errorDescription,
      colorText: white,
      backgroundColor: red,
    );
  }
  void _goToHome() {
    Get.toNamed(HomePage.routeName);
  }
void _empty(){

}
  }