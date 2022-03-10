import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lol/utilities/size_config.dart';
import 'package:lol/widget/home_card.dart';
import 'package:lol/widget/loading_shimmer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 10),
        child: Obx(() {
          // final _healthPoint = controller.healthPoint;
          num steps;
          num calories;
          if (controller.healthPoint.isNotEmpty) {
            steps = controller.healthPoint.first.value;
            calories = controller.healthPoint.last.value;
          } else {
            steps = 0;
            calories = 0;
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hii!",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 5.116),
              LoadingShimmer(
                loading: controller.isLoading.value,
                child: HomeCard(
                  iconPath: "images/foot.png",
                  heading: "Steps:",
                  value: steps.toDouble(), //steps.toDouble(),
                  title: '$steps',
                  goal: '15,000',
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 6.395),
              LoadingShimmer(
                loading: controller.isLoading.value,
                child: HomeCard(
                  iconPath: "images/kcal.png",
                  heading: "Calories Burned:",
                  value: calories.toDouble(), //steps.toDouble(),
                  title: '$calories',
                  goal: '10,000',
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
