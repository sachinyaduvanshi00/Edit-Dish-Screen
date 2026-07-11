import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constants/app_strings.dart';
import 'core/theme/app_theme.dart';
import 'features/edit_dish/bindings/edit_dish_binding.dart';
import 'features/edit_dish/views/edit_dish_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FitshieldApp());
}

/// Root application widget.
class FitshieldApp extends StatelessWidget {
  const FitshieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialBinding: EditDishBinding(),
      home: const EditDishView(),
    );
  }
}
