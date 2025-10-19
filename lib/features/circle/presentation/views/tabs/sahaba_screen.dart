import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SahabaScreen extends StatelessWidget {
  final TabController tabController;
  final int zoomLevel; // 👈 استقبلنا الـ zoomLevel

  const SahabaScreen({
    super.key,
    required this.tabController,
    required this.zoomLevel, // 👈 ضروري
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _sahabaContent(context),
    );
  }

  Widget _sahabaContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // --- الصف الأول (2 صناديق) --- 👈 نخفيه لو zoomLevel > 0
          if (zoomLevel == 0)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _nameBox(),
                const SizedBox(width: 4),
                _nameBox(),
              ],
            ),
          if (zoomLevel == 0) const SizedBox(height: 4),

          // --- الصف الثاني (4 صناديق) ---
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _nameBox(),
              const SizedBox(width: 4),
              _nameBox(),
              const SizedBox(width: 4),
              _nameBox(),
              const SizedBox(width: 4),
              _nameBox(),
            ],
          ),
          const SizedBox(height: 4),

          // --- الصف الثالث (2 بالطول + الوسط + 2 بالطول) ---
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  _nameBox(),
                  _nameBox(),
                ],
              ),
              _centerBox(),
              Column(
                children: [
                  _nameBox(),
                  _nameBox(),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),

          // --- الصف الرابع (4 صناديق) ---
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _nameBox(),
              const SizedBox(width: 4),
              _nameBox(),
              const SizedBox(width: 4),
              _nameBox(),
              const SizedBox(width: 4),
              _nameBox(),
            ],
          ),
          const SizedBox(height: 4),

          // --- الصف الخامس (2 صناديق) --- 👈 نخفيه لو zoomLevel > 0
          if (zoomLevel == 0)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _nameBox(),
                const SizedBox(width: 4),
                _nameBox(),
              ],
            ),
        ],
      ),
    );
  }

  /// المربع الصغير
  Widget _nameBox() {
    return GestureDetector(
      onTap: () {
        tabController.animateTo(
          1,
          duration: const Duration(milliseconds: 1200),
          curve: Curves.elasticOut,
        );
      },
      child: Container(
        width: 82,
        height: 82,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.purple,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'جابر بن\nعبد الله\nالأنصاري',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              height: 1.3,
              fontFamily: "Arial Nova",
              fontWeight: FontWeight.w400,
              color: AppColor.black,
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
        color: const Color(0xFFD8E6D8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text(
          'محمد صلى\n الله عليه\n وسلم',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 24,
            height: 1.4,
            fontFamily: "Arial Nova",
            color: AppColor.black,
          ),
        ),
      ),
    );
  }
}
