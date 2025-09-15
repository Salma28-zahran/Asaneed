import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.white,
      centerTitle: true,
      title: Image.asset(
        color: AppColor.black,
        AssetsManager.homeLogo,
        height: 60,
        width: 144,
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
