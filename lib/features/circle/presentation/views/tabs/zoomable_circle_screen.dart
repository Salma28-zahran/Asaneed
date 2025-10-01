import 'dart:math';
import 'package:flutter/material.dart';
import 'sahaba_screen.dart';
import 'tabeen1_screen.dart';
import 'tabeen2_screen.dart';

class ZoomableCircleScreen extends StatefulWidget {
  final TabController tabController;
  const ZoomableCircleScreen({super.key, required this.tabController});

  @override
  State<ZoomableCircleScreen> createState() => _ZoomableCircleScreenState();
}

class _ZoomableCircleScreenState extends State<ZoomableCircleScreen> {
  int zoomLevel = 0;

  void _zoomOut() {
    setState(() {
      if (zoomLevel < 2) zoomLevel++;
    });
  }

  void _zoomIn() {
    setState(() {
      if (zoomLevel > 0) zoomLevel--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:
      Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // المستوى الثالث (تابعي التابعين)
            AnimatedScale(
              duration: const Duration(milliseconds: 600),
              scale: zoomLevel == 2 ? 1.0 : 0.0,
              child: Padding(
                padding: const EdgeInsets.only(top: 20), // 👈 مسافة نزول لتحت
                child: Tabeen2Screen(
                  tabController: widget.tabController,
                  zoomLevel: zoomLevel,
                ),
              ),
            ),

            // المستوى الثاني (التابعين)
            AnimatedScale(
              duration: const Duration(milliseconds: 600),
              scale: zoomLevel == 1
                  ? 1.0
                  : (zoomLevel == 2 ? 0.6 : 0.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 20,right: 10,left: 10), // 👈 مسافة أصغر
                child: Tabeen1Screen(
                  tabController: widget.tabController,
                  zoomLevel: zoomLevel,
                ),
              ),
            ),

            // المستوى الأول (الرسول ﷺ + الصحابة)
            AnimatedScale(
              duration: const Duration(milliseconds: 600),
              scale: zoomLevel == 0
                  ? 1.0
                  : (zoomLevel == 1 ? 0.6 : 0.4),
              child: SahabaScreen(
                tabController: widget.tabController,
                zoomLevel: zoomLevel,
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "zoomIn",
            onPressed: _zoomIn,
            child: const Icon(Icons.zoom_in),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: "zoomOut",
            onPressed: _zoomOut,
            child: const Icon(Icons.zoom_out),
          ),
        ],
      ),
    );
  }
}
