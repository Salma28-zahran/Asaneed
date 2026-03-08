import 'package:asaneed/core/route/routes.dart';
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
    return SizedBox(
      height: 120,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.08),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    child: BottomNavigationBar(
                      currentIndex: currentIndex,
                      onTap: onTap,
                      type: BottomNavigationBarType.fixed,
                      backgroundColor:
                          Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xff2c2b2b)
                              : Colors.white,
                      selectedItemColor: AppColor.primary,
                      unselectedItemColor: Colors.grey,
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      iconSize: 26,
                      items: [
                        _buildNavItem(const Icon(Icons.group), 0),
                        _buildNavItem(const Icon(Icons.bookmark_border), 1),

                        const BottomNavigationBarItem(
                          icon: SizedBox(width: 50),
                          label: "",
                        ),

                        _buildNavItem(const Icon(Icons.person_outline), 3),
                        _buildNavItem(const Icon(Icons.home_outlined), 4),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 40,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, PageRouteName.asaneed);
              },
              child: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.account_tree_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
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
