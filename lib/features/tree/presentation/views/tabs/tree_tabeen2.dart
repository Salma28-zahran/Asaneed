import 'package:asaneed/features/tree/presentation/views/tabs/tree_tabeen1.dart';
import 'package:asaneed/features/tree/presentation/views/tabs/tree_tabeen2.dart' show TreeTabeen2;
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

class NameBox3 extends StatefulWidget {
  final String title;
  final Color color;
  final VoidCallback? onTap;

  const NameBox3({
    Key? key,
    required this.title,
    required this.color,
    this.onTap,
  }) : super(key: key);

  @override
  State<NameBox2> createState() => _NameBoxState();
}

class _NameBoxState extends State<NameBox2> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 47,
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: AppColor.pink,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 35,
              height: 38,
              decoration: BoxDecoration(
                color:AppColor.pink2,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 16,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Center(
                child: Text(
                  widget.title,
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

class TreeTabeen2 extends StatelessWidget {
  const TreeTabeen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Text(
          "الصحابه",
          style: AppColor.title.copyWith(
              fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "عمرو بن دينار المكي",
                style: AppColor.title.copyWith(
                    fontSize: 24, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:  Row(
                    children: [

                      Text(
                        '... اقرأ المزيد ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(Icons.error,color: AppColor.white,),
                    ],
                  ),
                ),
                SizedBox(width: 10,),

                Row(
                  children: [

                    Text(
                      'تاريخ الوفاة 78 هجرية',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColor.purple,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        'صحابي',
                        style: TextStyle(
                          color: AppColor.purple2,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),


            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buildFakeTab("تابعي التابعي",AppColor.orange,AppColor.orange2 ),
              ],
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return NameBox2(
                    title: "سفيان بن عيينه الهلالي ",
                    color: Colors.purple,
                    onTap: () {}
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFakeTab(String title, Color bgColor, Color textColor) {
    return Container(
      width: 80,
      height: 27,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
