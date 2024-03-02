import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/src/controller/home_controller.dart';
import 'package:flutter_japanese_restaurant_app/src/view/screen/cart_screen.dart';
import 'package:flutter_japanese_restaurant_app/src/view/screen/food_list_screen.dart';
import 'package:flutter_japanese_restaurant_app/src/view/screen/profile_screen.dart';
import 'package:flutter_japanese_restaurant_app/src/view/widget/bottombar.dart';
import 'package:get/get.dart';

final HomeController controller = Get.put(HomeController());

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    controller.tabIconsList.first.isSelected = true;
    tabBody = FoodListScreen(animationController: animationController);
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: controller.getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget tabBody = Container(
    color: Get.theme.scaffoldBackgroundColor,
  );

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: controller.tabIconsList,
          addClick: () {
            setState(() {
              tabBody = CartScreen(animationController: animationController);
            });
          },
          changeIndex: (int index) {
            if (index == 0) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      FoodListScreen(animationController: animationController);
                });
              });
            } else if (index == 1) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      ProfileScreen(animationController: animationController);
                });
              });
            }
          },
        ),
      ],
    );
  }
}
