import 'package:flutter/material.dart';

class NameBox extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback? onTap;

  const NameBox({
    Key? key,
    required this.title,
    required this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 47,
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 35,
              height: 45,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 18,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TreeSahaba extends StatelessWidget {
  final TabController tabController; //
  const TreeSahaba({super.key,required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 12,
        itemBuilder: (context, index) {
          return
            NameBox(
            title: "جابر بن عبد الله الأنصاري", // نفس الاسم للكل
            color: Colors.purple,
              onTap: () {
                // ✅ هنا التغيير مع أنيميشن
                tabController.animateTo(1);

                debugPrint("Tapped on جابر $index");
              },
          );
        },
      ),
    );
  }
}
