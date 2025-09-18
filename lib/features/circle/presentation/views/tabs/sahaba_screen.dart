import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SahabaScreen extends StatelessWidget {
  const SahabaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: _sahabaContent(),
    );
  }

  Widget _sahabaContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // --- الصف الأول (2 صناديق) ---
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _nameBox(),
              const SizedBox(width: 4),
              _nameBox(),
            ],
          ),
          const SizedBox(height: 4),

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

          // --- الصف الخامس (2 صناديق) ---
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
    return Container(
      width: 82,
      height: 82,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xffe0bce6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        'جابر بن\nعبد الله\nالأنصاري',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 10, height: 1.3),
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
        color: Color(0xFFD2E8D2),
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
          ),
        ),
      ),
    );
  }
}
