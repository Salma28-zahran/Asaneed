import 'package:asaneed/features/details/presentation/views/tabs/ahades.dart';
import 'package:asaneed/features/details/presentation/views/tabs/extra.dart';
import 'package:asaneed/features/details/presentation/views/tabs/rwah2/rawah2.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SahabaDetails extends StatefulWidget {
  const SahabaDetails({super.key});

  @override
  State<SahabaDetails> createState() => _SahabaDetailsState();
}

class _SahabaDetailsState extends State<SahabaDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.index = 2;
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
      ) {
    return AnimatedBuilder(
      animation: _tabController,
      builder: (context, _) {
        bool isSelected = _tabController.index == index;

        return GestureDetector(
          onTap: () => _tabController.animateTo(index),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: isSelected ? activeBgColor : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              title,
              style: baseStyle.copyWith(
                fontSize: 13,
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
      //backgroundColor: AppColor.white,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "الصحابه",
          style: AppColor.title,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Align(
              alignment: Alignment.topRight,
              child: const Text(
                "سفيان بن عيينة الهلالي",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              buildTab("الأحاديث", 0, Colors.teal, Colors.white, AppColor.title),
              buildTab("من روي عنه", 1, Colors.teal, Colors.white, AppColor.title),
              buildTab("المزيد عنه", 2, Colors.teal, Colors.white, AppColor.title),
            ],
          ),

          const SizedBox(height: 16),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children:  [

               Ahades(),
              Rawah2(),
              Extra(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
