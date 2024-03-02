import 'package:flutter/material.dart';

class TabIconData {
  var label;

  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
    this.animationController,
    this.label = '',
  });

  String imagePath;
  String selectedImagePath;
  bool isSelected;
  int index;

  AnimationController? animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
        imagePath: 'assets/icons/home.png',
        selectedImagePath: 'assets/icons/home (1).png',
        index: 0,
        isSelected: true,
        animationController: null,
        label: 'Trang chủ'),
    TabIconData(
        imagePath: 'assets/icons/setting.png',
        selectedImagePath: 'assets/icons/setting (1).png',
        index: 1,
        isSelected: false,
        animationController: null,
        label: 'Cá nhân'),
  ];
}
