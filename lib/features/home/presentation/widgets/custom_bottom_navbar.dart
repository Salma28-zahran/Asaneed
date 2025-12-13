import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Container(
          height: 74,

          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SizedBox(
              height: 74,
              child: Theme(
                data: Theme.of(context).copyWith(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child:
                BottomNavigationBar(
                  currentIndex: currentIndex,
                  onTap: onTap,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor:  Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xff2c2b2b)
                    : Colors.white,
                  selectedItemColor: AppColor.primary,
                  unselectedItemColor: Colors.grey,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  iconSize: 28,
                  items: [
                    _buildNavItem(const Icon(Icons.settings_outlined), 0),
                    _buildNavItem(const Icon(Icons.group), 1),
                    _buildNavItem(const Icon(Icons.search), 2),
                    _buildNavItem(const Icon(Icons.bookmark_border), 3),
                    _buildNavItem(const Icon(Icons.home), 4),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(Widget icon, int index) {
    final bool isSelected = currentIndex == index;

    return BottomNavigationBarItem(
      label: "",
      icon: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: IconTheme(
          data: IconThemeData(
            color: isSelected ? Colors.white : Colors.grey,
            size: 24,
          ),
          child: icon,
        ),
      ),
    );
  }
}
