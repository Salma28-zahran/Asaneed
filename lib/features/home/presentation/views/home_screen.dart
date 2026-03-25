import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:asaneed/features/home/presentation/widgets/custom_bottom_navbar.dart';
import 'package:asaneed/features/tabs/presentaion/views/book/book_screen.dart';
import 'package:asaneed/features/tabs/presentaion/views/book/sahaba_screen.dart';
import 'package:asaneed/features/tabs/presentaion/views/fav_screen.dart'
    show FavScreen;
import 'package:asaneed/features/tabs/presentaion/views/hadith/presentation/views/hadethscreen.dart';
import 'package:asaneed/features/tabs/presentaion/views/home_page2.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../tabs/presentaion/views/Account/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 5;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      const SahabaScreen(),
      const FavScreen(),
      const Hadethscreen(),

      const SizedBox(),

      const BookScreen(),

      HomePage2(
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: (_selectedIndex == 5 || _selectedIndex == 4)
          ? const CustomAppBar()
          : null,      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButton: GestureDetector(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}
