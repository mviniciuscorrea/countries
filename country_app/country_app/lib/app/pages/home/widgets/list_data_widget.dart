import 'package:country_app/app/pages/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ListDataWidget extends GetView<HomeController> {
  const ListDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.step.value != 3
          ? controller.loading.value
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(controller.data[index].id),
                      trailing: const Icon(
                        Icons.arrow_forward,
                        color: Color(0xFFEF3844),
                      ),
                      onTap: () {
                        controller.loadData(controller.data[index].id);
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                )
          : controller.loading.value
              ? const Center(child: CircularProgressIndicator())
              : Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: const BorderSide(
                      color: Color(0xFFEF3844),
                      width: 1,
                    ),
                  ),
                  child: ExpansionTile(
                    expandedAlignment: Alignment.topLeft,
                    childrenPadding: const EdgeInsets.all(15),
                    backgroundColor: Colors.white,
                    title: Text(
                      controller.infoCity["name"],
                    ),
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Geoname Id: ${controller.infoCity["geonameid"]}'),
                      const SizedBox(height: 10),
                      Text('SubCountry: ${controller.infoCity["subcountry"]}'),
                    ],
                  ),
                ),
    );
  }
}
