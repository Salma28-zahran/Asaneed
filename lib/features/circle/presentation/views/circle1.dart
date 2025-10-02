import 'package:asaneed/features/circle/presentation/views/tabs/sahaba_screen.dart';
import 'package:asaneed/features/circle/presentation/views/tabs/tabeen1_screen.dart';
import 'package:asaneed/features/circle/presentation/views/tabs/tabeen2_screen.dart';
import 'package:asaneed/features/home/presentation/widgets/custom_bottom_navbar.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:asaneed/features/circle/presentation/views/tabs/zoomable_circle_screen.dart';

class Circle1 extends StatefulWidget {
  const Circle1({super.key});

  @override
  State<Circle1> createState() => _Circle1State();
}

class _Circle1State extends State<Circle1> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  int zoomLevel = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.index = 2;
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildTab(
      String title,
      int index,
      Color activeBgColor,
      Color activeTextColor,
      TextStyle baseStyle,
      double width,
      ) {
    return AnimatedBuilder(
      animation: _tabController,
      builder: (context, _) {
        bool isSelected = _tabController.index == index;

        return Container(
          width: width,
          height: 47,
          decoration: BoxDecoration(
            color: isSelected ? activeBgColor : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              title,
              style: baseStyle.copyWith(
                color: isSelected ? activeTextColor : Colors.grey,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: Text(
          "الدائرة الإسنادية",
          style: AppColor.titleStyle2.copyWith(fontFamily: "Arial Nova"),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: Align(
            alignment: Alignment.centerRight,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: [
                buildTab("تابعي التابعين", 0, AppColor.orange, AppColor.orange2,
                    AppColor.titletabeen2, 110),
                buildTab("التابعين", 1, AppColor.pink, AppColor.pink2,
                    AppColor.titletabeen, 90),
                buildTab("الصحابه", 2, AppColor.purple, AppColor.purple2,
                    AppColor.titleSahaba, 90),

              ],
            ),
          ),
        ),
      ),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: AnimatedBuilder(
          animation: _tabController,
          builder: (context, _) {
            Widget child;
            switch (_tabController.index) {
              case 0:
                child = Tabeen2Screen(tabController: _tabController, zoomLevel: zoomLevel);
                break;
              case 1:
                child = Tabeen1Screen(tabController: _tabController, zoomLevel: zoomLevel);
                break;

              case 2:
                child = ZoomableCircleScreen(tabController: _tabController);
                break;
              default:
                child = const SizedBox();
            }



            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              transitionBuilder: (widget, animation) {
                final slideAnimation = Tween<Offset>(
                  begin: const Offset(0, 0.2),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutCubic,
                ));

                return SlideTransition(
                  position: slideAnimation,
                  child: FadeTransition(
                    opacity: animation,
                    child: widget,
                  ),
                );
              },
              child: KeyedSubtree(
                key: ValueKey<int>(_tabController.index),
                child: child,
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
