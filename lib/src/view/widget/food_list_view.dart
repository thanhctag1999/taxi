import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/core/app_color.dart';
import 'package:flutter_japanese_restaurant_app/core/app_extension.dart';
import 'package:flutter_japanese_restaurant_app/src/controller/home_controller.dart';
import 'package:flutter_japanese_restaurant_app/src/model/food.dart';
import 'package:get/get.dart';

final HomeController homeController = Get.put(HomeController());

class FoodListView extends StatelessWidget {
  const FoodListView({
    super.key,
    required this.foods,
    this.isReversedList = false,
  });

  final List<Food> foods;
  final bool isReversedList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 20, left: 10),
        scrollDirection: Axis.horizontal,
        itemCount: isReversedList ? 3 : foods.length,
        itemBuilder: (_, index) {
          Food food =
              isReversedList ? foods.reversed.toList()[index] : foods[index];
          return GestureDetector(
            onTap: () {},
            child: Container(
              width: 160,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: homeController.isLightTheme
                    ? Colors.white
                    : DarkThemeColor.primaryLight,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          10), // Adjust the value as needed
                      child: Image.asset(
                        food.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    food.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ).fadeAnimation(0.7),
            ),
          );
        },
        separatorBuilder: (_, __) {
          return const Padding(padding: EdgeInsets.only(right: 50));
        },
      ),
    );
  }
}
