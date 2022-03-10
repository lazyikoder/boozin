import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lol/utilities/size_config.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return GetMaterialApp(
          title: "Boozin Fit",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          themeMode: ThemeMode.system,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      });
    }),
  );
}

// Widget build(BuildContext context) {
//   return 
// }
