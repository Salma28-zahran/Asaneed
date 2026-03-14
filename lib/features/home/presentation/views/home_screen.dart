import 'package:asaneed/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:asaneed/features/home/presentation/widgets/custom_bottom_navbar.dart';
import 'package:asaneed/features/tabs/presentaion/views/book_screen.dart';
import 'package:asaneed/features/tabs/presentaion/views/rawah_screen.dart';
import 'package:asaneed/features/tabs/presentaion/views/fav_screen.dart' show FavScreen;
import 'package:asaneed/features/tabs/presentaion/views/home_page2.dart';
import 'package:asaneed/features/tabs/presentaion/views/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 4;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      const RawahScreen(),
      const FavScreen(),

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
      appBar: _selectedIndex == 4 ? const CustomAppBar() : null,
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (index == 2) return;
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}