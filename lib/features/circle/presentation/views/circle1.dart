import 'package:asaneed/features/circle/presentation/views/tabs/sahaba_screen.dart';
import 'package:asaneed/features/circle/presentation/views/tabs/tabeen1_screen.dart';
import 'package:asaneed/features/circle/presentation/views/tabs/tabeen2_screen.dart';
import 'package:asaneed/features/home/presentation/widgets/custom_bottom_navbar.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Circle1 extends StatefulWidget {
  const Circle1({super.key});

  @override
  State<Circle1> createState() => _Circle1State();
}

class _Circle1State extends State<Circle1> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 3;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.index = 2;
  }
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // هنا تقدري تغيري الشاشة اللي بتظهر حسب index
    // مثلاً:
    // if (index == 0) { ... }
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
      double width) {
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
                // تابعي التابعين
                buildTab(
                  "تابعي التابعين",
                  0,
                  AppColor.orange,
                  AppColor.orange2,
                  AppColor.titletabeen2,
                  110,
                ),
                // التابعين
                buildTab(
                  "التابعين",
                  1,
                  AppColor.pink,
                  AppColor.pink2,
                  AppColor.titletabeen,
                  90,
                ),
                // الصحابة
                buildTab(
                  "الصحابه",
                  2,
                  AppColor.purple,
                  AppColor.purple2,
                  AppColor.titleSahaba,
                  90,
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          const Tabeen2Screen(),
          const Tabeen1Screen(),
           SahabaScreen(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),

    );
  }
}
