import 'package:country_app/app/pages/home/controllers/home_controller.dart';
import 'package:country_app/app/pages/home/widgets/list_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.loadContry();

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        elevation: 0.4,
        title: const Text(
          'Country and Cities',
          style: TextStyle(
            color: Color(0xFFF2F2F2),
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: const Color(0xFFEF3844),
        leading: Obx(
          () => controller.step.value == 0
              ? Container()
              : IconButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  color: Colors.white,
                  onPressed: () => controller.returnList(),
                ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 50, left: 24, right: 24),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: ListDataWidget(),
        ),
      ),
    );
  }
}
