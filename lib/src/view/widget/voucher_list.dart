import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/core/app_color.dart';
import 'package:flutter_japanese_restaurant_app/core/app_extension.dart';
import 'package:flutter_japanese_restaurant_app/src/controller/home_controller.dart';
import 'package:flutter_japanese_restaurant_app/src/model/food.dart';
import 'package:get/get.dart';

final HomeController homeController = Get.put(HomeController());

const data = [
  {
    "id": 0,
    "name": "Discount 15%",
    "discount": "15%",
    "endDate": "20/02/2023",
    "image": "assets/images/voucher.png",
  },
  {
    "id": 1,
    "name": "Discount 20%",
    "discount": "20%",
    "endDate": "22/02/2023",
    "image": "assets/images/voucher.png",
  },
  {
    "id": 2,
    "name": "Discount 20%",
    "discount": "20%",
    "endDate": "22/02/2023",
    "image": "assets/images/voucher.png",
  },
];

class VoucherListView extends StatelessWidget {
  const VoucherListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 20, left: 10),
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (_, index) {
          var item = data[index];
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
                        "",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "",
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
