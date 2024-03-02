import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/core/app_data.dart';
import 'package:flutter_japanese_restaurant_app/core/app_theme.dart';
import 'package:flutter_japanese_restaurant_app/src/model/food.dart';
import 'package:flutter_japanese_restaurant_app/src/model/tabIcon_data.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Food> favoriteFood = <Food>[].obs;
  RxList<Food> filteredFoods = AppData.foodItems.obs;

  RxInt currentBottomNavItemIndex = 0.obs;
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;
  Rx<ThemeData> theme = AppTheme.lightTheme.obs;
  bool isLightTheme = true;

  void switchBetweenBottomNavigationItems(int currentIndex) {
    currentBottomNavItemIndex.value = currentIndex;
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  void changeTheme() {
    if (theme.value == AppTheme.darkTheme) {
      theme.value = AppTheme.lightTheme;
      isLightTheme = true;
    } else {
      theme.value = AppTheme.darkTheme;
      isLightTheme = false;
    }
  }

  isFavoriteFood(Food food) {
    food.isFavorite = !food.isFavorite;
    update();
    if (food.isFavorite) {
      favoriteFood.add(food);
    }
    if (!food.isFavorite) {
      favoriteFood.removeWhere((element) => element == food);
    }
  }
}
