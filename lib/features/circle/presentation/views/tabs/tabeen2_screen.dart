import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Tabeen2Screen extends StatelessWidget {
  final TabController tabController;
  final int zoomLevel;

  const Tabeen2Screen({super.key, required this.tabController, required this.zoomLevel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:_tabeen2Content(context),
    );
  }

  Widget _tabeen2Content(BuildContext context) {
    return Center(
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // --- الصف الأول (2 صناديق) ---
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _nameBox(context),
              SizedBox(width: zoomLevel == 2 ? 10 : 4),
              _nameBox(context),
            ],
          ),


          // --- الصف الثاني (4 صناديق) ---
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _nameBox(context),
              SizedBox(height: zoomLevel == 2 ? 24 : 4),
              _nameBox(context),
              SizedBox(height: zoomLevel == 2 ? 24 : 4),
              _nameBox(context),
              SizedBox(height: zoomLevel == 2 ? 24 : 4),
              _nameBox(context),
            ],
          ),
          SizedBox(height: zoomLevel == 2 ? 28 : 4),

          // --- الصف الثالث (2 بالطول + الوسط + 2 بالطول) ---
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  _nameBox(context),
                  SizedBox(height: zoomLevel == 2 ? 7 : 4),
                  _nameBox(context),
                ],
              ),
              _centerBox(),
              SizedBox(width: zoomLevel == 2 ? 27 : 4),


              Column(
                children: [
                  _nameBox(context),
                  SizedBox(height: zoomLevel == 2 ? 7 : 4),


                  _nameBox(context),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),

          // --- الصف الرابع (4 صناديق) ---
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _nameBox(context),
              const SizedBox(width: 4),
              _nameBox(context),
              const SizedBox(width: 4),
              _nameBox(context),
              const SizedBox(width: 4),
              _nameBox(context),
            ],
          ),
          const SizedBox(height: 4),

          // --- الصف الخامس (2 صناديق) ---
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _nameBox(context),
              SizedBox(height: zoomLevel == 2 ? 24 : 4),
              _nameBox(context),
            ],
          ),
        ],
      ),
    );
  }

  /// المربع الصغير
  Widget _nameBox(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PageRouteName.details);
      },
      child: Container(
        width: 82,
        height: 82,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:AppColor.orange,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            "سفيان بن \nعيينة \nالهلالي",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              height: 1.3,
              fontFamily: "Arial Nova",
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  /// المربع الأوسط
  Widget _centerBox() {
    return Container(
      margin: const EdgeInsets.only(left: 14, right: 14, top: 8, bottom: 8),
      width: 172,
      height: 172,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColor.pink,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text(
          "عمرو بن دينار\n المكي",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 24,
            height: 1.4,
            fontFamily: "Arial Nova",
          ),
        ),
      ),
    );
  }
}
