import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:asaneed/theme/AppThemeManager.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.getAppBarColor(context),
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Image.asset(
          color: AppColor.getBlack(context),
          AssetsManager.homeLogo,
          height: 60,
          width: 144,
        ),
      ),
      elevation: 0,

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
