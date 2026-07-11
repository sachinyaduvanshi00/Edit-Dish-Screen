import 'package:get/get.dart';

import '../controllers/edit_dish_controller.dart';

/// Registers dependencies required by the Edit Dish feature.
class EditDishBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditDishController>(EditDishController.new);
  }
}
