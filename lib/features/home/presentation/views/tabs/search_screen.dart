import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:asaneed/theme/app_theme.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.white,
          elevation: 0,
          bottom: const TabBar(
            labelColor: AppColor.black,
            unselectedLabelColor: AppColor.grey,
            indicatorColor: AppColor.primary,
            indicatorWeight: 3,
            tabs: [
              Tab(text: 'بحث بنص الحديث'),
              Tab(text: 'بحث بالراوي'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildSearchTab(
              context: context,
              hint: "ابحث في نص الحديث....",
              image: AssetsManager.search,
              message: "اكتب اسم الراوي للبحث",
            ),
            buildSearchTab(
              context: context,
              hint: "ابحث عن الراوي....",
              image: AssetsManager.search,
              message: "اكتب اسم الراوي للبحث",
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearchTab({
    required BuildContext context,
    required String hint,
    required String image,
    required String message,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    builder: (context) {
                      return const FilterBottomSheet();
                    },
                  );
                },
                child: const Icon(Icons.menu, color: AppColor.black),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SizedBox(
                  height: 44,
                  child: TextField(
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: const TextStyle(color: AppColor.grey),
                      suffixIcon: const Icon(Icons.search, color: AppColor.grey),
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColor.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColor.grey),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(image, height: 100),
                const SizedBox(height: 16),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColor.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final List<bool> _selected = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Filter",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          buildFilterItem(
            text: "صحابي",
            bgColor: AppColor.purple,
            textColor: AppColor.purple2,
            checked: _selected[0],
            onTap: () => setState(() => _selected[0] = !_selected[0]),
          ),
          buildFilterItem(
            text: "تابعي",
            bgColor: AppColor.pink,
            textColor: AppColor.pink2,
            checked: _selected[1],
            onTap: () => setState(() => _selected[1] = !_selected[1]),
          ),
          buildFilterItem(
            text: "تابعي التابعي",
            bgColor: AppColor.orange,
            textColor: AppColor.orange2,
            checked: _selected[2],
            onTap: () => setState(() => _selected[2] = !_selected[2]),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildFilterItem({
    required String text,
    required Color bgColor,
    required Color textColor,
    required bool checked,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.check,
              color: checked ? AppColor.primary : Colors.grey[300],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                text,
                style: TextStyle(fontSize: 14, color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
