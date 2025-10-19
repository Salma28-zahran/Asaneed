import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/core/route/routes_generator.dart';
import 'package:asaneed/theme/AppThemeManager.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onCardTap;

  const HomePage({super.key, required this.onCardTap});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPressed = false;
  bool isPressed2 = false;
  bool isTreePressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.watch<AppThemeManager>().isDarkMode
            ? Colors.grey[900]
            : Colors.white,
        body: _homePage());
  }

  Widget _homePage() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '''"اسانيد" هي أداة مبتكرة تهدف إلى تسهيل استعراض الأسانيد من الدائرة الإسنادية بطرق عرض تفاعلية ومتنوعة.
يوفر التطبيق للمستخدمين تجربة مميزة من خلال خيارات البحث المتقدمة، وإمكانية حفظ الأسانيد المفضلة للوصول إليها بسهولة. كما يتيح التطبيق معرفة المزيد عن الرواة، بما في ذلك سيرهم الذاتية ومعلومات دقيقة عن أدوارهم في السلسلة الإسنادية.
سواء كنت باحثًا مهتمًا بعلم الحديث أو مستخدمًا عاديًا يرغب في استكشاف الأسانيد، فإن "اسانيد" يقدم لك تجربة شاملة ومبسطة في عالم الإسناد.'''
                    .replaceAll('\n', ' '),
                style: AppColor.titleStyle.copyWith(
                  color: Colors.white,
                  fontFamily: 'ArialNova',
                  fontSize: 16,
                  height: 1.6,
                ),
                textAlign: TextAlign.justify,
                textDirection: TextDirection.rtl,
                softWrap: true,
                maxLines: null,
              ),
            ),
          ),

          const SizedBox(height: 5),

          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "يوفر تطبيق أسانيد طرق مختلفة لأستعراض الأسانيد",
                style: AppColor.titleStyle2.copyWith(fontSize: 18,color:  AppColor.getBlack(context),),
                textDirection: TextDirection.rtl,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // 🔹 أول كارت
        InkWell(
          onTap: () async {
            setState(() {
              isPressed = true;
            });

            await Future.delayed(const Duration(milliseconds: 150));

            widget.onCardTap();
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? (isPressed ? AppColor.primary : const Color(0xff2c2b2b)) // 🌑 Dark Mode
                  : (isPressed ? AppColor.primary : AppColor.primary2), // 🌞 Light Mode
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColor.primary, width: 1.5),
            ),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 85,
                  decoration: BoxDecoration(
                    color: isPressed ? Colors.white : AppColor.primary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: isPressed ? AppColor.primary : Colors.white,
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "البطاقات الإسنادية",
                        style: AppColor.titleStyle2.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: isPressed
                              ? Colors.white
                              : Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : AppColor.titleStyle2.color,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "استعراض على شكل بطاقات",
                        style: AppColor.titleStyle2.copyWith(
                          fontSize: 12,
                          color: isPressed
                              ? Colors.white
                              : Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : AppColor.titleStyle2.color,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                Image.asset(
                  AssetsManager.files,
                  width: 40,
                  height: 40,
                  color: AppColor.primary3,
                ),
              ],
            ),
          ),
        ),

        // ثاني كارت
        InkWell(
          onTap: () {
            setState(() {
              isPressed2 = true;
            });
            Navigator.pushNamed(context, PageRouteName.circle1);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? (isPressed ? AppColor.primary : const Color(0xff2c2b2b)) // 🌑 Dark Mode
                  : (isPressed ? AppColor.primary : AppColor.primary2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColor.primary, width: 1.5),
            ),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 85,
                  decoration: BoxDecoration(
                    color: isPressed2 ? Colors.white : AppColor.primary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: isPressed2 ? AppColor.primary : Colors.white,
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "الدائرة الإسنادية",
                        style: AppColor.titleStyle2.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: isPressed2
                              ? Colors.white
                              : Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : AppColor.titleStyle2.color,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "استعراض الأسنايد على شكل دائرة متعددة الطبقات",
                        style: AppColor.titleStyle2.copyWith(
                          fontSize: 12,
                          color: isPressed2
                              ? Colors.white
                              : Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : AppColor.titleStyle2.color,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                Image.asset(
                  AssetsManager.circle,
                  width: 40,
                  height: 40,
                ),
              ],
            ),
          ),
        ),

        // ثالث كارت
        InkWell(
          onTap: () {
            setState(() {
              isTreePressed = true;
            });
            Navigator.pushNamed(context, PageRouteName.tree);
            print("تم الضغط على كارت شجرة الإسنادية");
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? (isPressed ? AppColor.primary : const Color(0xff2c2b2b)) // 🌑 Dark Mode
                  : (isPressed ? AppColor.primary : AppColor.primary2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColor.primary, width: 1.5),
            ),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 85,
                  decoration: BoxDecoration(
                    color: isTreePressed ? Colors.white : AppColor.primary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: isTreePressed ? AppColor.primary : Colors.white,
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "شجرة الإسنادية",
                        style: AppColor.titleStyle2.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: isTreePressed
                              ? Colors.white
                              : Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : AppColor.titleStyle2.color,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "استعراض الأسنايد على شكل شجري",
                        style: AppColor.titleStyle2.copyWith(
                          fontSize: 12,
                          color: isTreePressed
                              ? Colors.white
                              : Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : AppColor.titleStyle2.color,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Image.asset(
                  AssetsManager.tree,
                  width: 40,
                  height: 40,
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),


        const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Container(
              margin: const EdgeInsets.all(5),
              width: 380,
              height: 90,
              decoration: BoxDecoration(
                color: AppColor.getPrimary2(context),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.rtl,
                  text: TextSpan(
                    style: AppColor.titleStyle4.copyWith(
                      fontFamily: "Arial Nova",
                      fontSize: 15,
                      color: AppColor.getBlack(context),
                    ),
                    children: [
                      TextSpan(
                        text:
                            "هذا المكان مخصص لشروحات وتعريفات بالدائرة الإسنادية\n",
                        style: TextStyle(color: AppColor.primary),
                      ),
                      TextSpan(
                        text: "والحديث عنها\n",
                        style: TextStyle(color: AppColor.primary),
                      ),
                      const TextSpan(
                        text:
                            "يمكن استخدام هذا المكان كمرجع لمراجعة أهمية الدائرة الإسنادية.",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 4),

          // بوكس الشرح الثاني
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Container(
              margin: const EdgeInsets.all(5),
              width: 384,
              height: 70,
              decoration: BoxDecoration(
                color: AppColor.getPrimary2(context),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "هذا المكان مخصص لتقديم تفصيل عن الصورة الملحقة بالموقع و تقديم شروحات لها.",
                  style: AppColor.titleStyle4.copyWith(fontSize: 14,color: AppColor.getBlack(context),
                  ),
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.rtl,
                  softWrap: true,
                  maxLines: null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
