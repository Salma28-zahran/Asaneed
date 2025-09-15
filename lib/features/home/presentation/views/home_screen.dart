import 'package:asaneed/core/resources/app_assets_manager.dart';
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
    const Center(child: Text("notes Page")),
    const Center(child: Text("Search Page")),
    const Center(child: Text("Saved Page")),
    SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.all(10),
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
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "يوفر تطبيق أسانيد طرق مختلفة لأستعراض الأسانيد",
                style: AppColor.titleStyle2.copyWith(fontSize: 18),
                textDirection: TextDirection.rtl,
              ),
            ),
          ),

          SizedBox(height: 10),
      
          // أول كارت
          Container(
          margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            //padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            decoration: BoxDecoration(
              color: AppColor.primary2,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColor.primary, width: 1.5),
            ),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 85,
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),

                SizedBox(width: 8),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "البطاقات الإسنادية",
                        style: AppColor.titleStyle2.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "استعراض على شكل بطاقات",
                        style: AppColor.titleStyle2.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 4,),

                Image.asset(
                  color: AppColor.primary3,
                  AssetsManager.files,
                  width:40 ,
                  height:40 ,
                )
              ],
            ),
          ),

          // ثاني كارت
          Container(
            margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            //padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            decoration: BoxDecoration(
              color: AppColor.primary2,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColor.primary, width: 1.5),
            ),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 85,
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),

                SizedBox(width: 8),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "الدائرة الإسنادية",
                        style: AppColor.titleStyle2.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "استعراض الأسنايد على شكل دائرة متعددة الطبقات",
                        style: AppColor.titleStyle2.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 4,),

                Image.asset(
                  //color: AppColor.primary3,
                  AssetsManager.circle,
                  width:40 ,
                  height:40 ,
                )
              ],
            ),
          ),

          // ثالث كارت
          Container(
            margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              color: AppColor.primary2,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColor.primary, width: 1.5),
            ),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 85,
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),

                SizedBox(width: 8),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "شجرة الإسنادية",
                        style: AppColor.titleStyle2.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "استعراض الأسنايد على شكل شجري",
                        style: AppColor.titleStyle2.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 12),

                Image.asset(
                  AssetsManager.tree,
                  width: 40,
                  height: 40,
                ),

                SizedBox(width: 8),
              ],
            ),
          ),

          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Container(
              margin:EdgeInsets.all(5),

              width: 380,
              height: 90,
              decoration: BoxDecoration(
                color: AppColor.primary2,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: Offset(0, 3),
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
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "هذا المكان مخصص لشروحات وتعريفات بالدائرة الإسنادية\n",
                        style: TextStyle(color: AppColor.primary),
                      ),
                      TextSpan(
                        text: "والحديث عنها\n",
                        style: TextStyle(color: AppColor.primary),
                      ),
                      TextSpan(
                        text:
                        "يمكن استخدام هذا المكان كمرجع لمراجعة أهمية الدائرة الإسنادية.",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Container(
              margin:EdgeInsets.all(5),
              width: 384,
              height: 70,
              decoration: BoxDecoration(
                color: AppColor.primary2,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "هذا المكان مخصص لتقديم تفصيل عن الصورة الملحقة بالموقع و تقديم شروحات لها.",
                  style: AppColor.titleStyle4.copyWith(fontSize: 14),
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.rtl,
                  softWrap: true,
                  maxLines: null,
                ),
              ),
            ),
          )











        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
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
