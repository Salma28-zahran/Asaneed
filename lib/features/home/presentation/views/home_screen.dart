import 'package:asaneed/core/resources/app_assets_manager.dart';

import 'package:asaneed/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:asaneed/features/home/presentation/widgets/custom_bottom_navbar.dart';
import 'package:asaneed/features/tabs/presentaion/views/book/book_screen.dart';
import 'package:asaneed/features/tabs/presentaion/views/fav_screen.dart' show FavScreen;
import 'package:asaneed/features/tabs/presentaion/views/home_page.dart';
import 'package:asaneed/features/tabs/presentaion/views/home_page2.dart';
import 'package:asaneed/features/tabs/presentaion/views/profile/profile_screen.dart';
import 'package:asaneed/features/tabs/presentaion/views/search_screen.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../profile/presentation/views/profile_screen.dart';

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
      const MyAccount(),
      const BookScreen(),
      const SearchScreen(),
      const FavScreen(),
      const MyAccount(),
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
      appBar: _selectedIndex == 5 ? const CustomAppBar() : null,
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

}

