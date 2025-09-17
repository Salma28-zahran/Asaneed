import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:asaneed/features/home/presentation/views/tabs/book_screen.dart';
import 'package:asaneed/features/home/presentation/views/tabs/fav_screen.dart';
import 'package:asaneed/features/home/presentation/views/tabs/home_page.dart';
import 'package:asaneed/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:asaneed/features/home/presentation/widgets/custom_bottom_navbar.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 3;
  final List<Widget> _pages = [
    const BookScreen(),
    const Center(child: Text("Search Page")),
    const FavScreen(),
    const HomePage(),

  ];
//n
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (_selectedIndex == 0 || _selectedIndex == 2)
          ? null
          : const CustomAppBar(),
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

