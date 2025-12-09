import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Extra extends StatefulWidget {

  const Extra({super.key});

  @override
  State<Extra> createState() => _ExtraState();
}

class _ExtraState extends State<Extra> {
  bool isBookmarked = false;
  bool isCopy=false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(

          color: Color(0xffF9F7F2),
          width: 380,
          //height: 1028,
          child: Padding(
            padding: const EdgeInsets.only(right: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "سفيان بن عيينة الهلالي",
                  style: AppColor.title.copyWith(color: AppColor.getBlack(context)),
                ),
                SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isBookmarked = !isBookmarked;
                        });
                      },
                      child: Icon( isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                          color: AppColor.primary, size: 30),
                    ),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isCopy= !isCopy;
                        });
                      },
                      child: Icon( isCopy ?  FontAwesomeIcons.solidCopy: Icons.copy,
                          color: AppColor.primary, size: 30),
                    ),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.share, color: AppColor.primary, size: 30),
                    ),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.comment, color: AppColor.primary, size: 30),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Text(
                      "تاريخ الوفاة 78 هجريه",
                      style: AppColor.title.copyWith(fontSize: 12,color: AppColor.getBlack(context)),
                    ),
                    SizedBox(width: 4),
                    Container(
                      width: 90,
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColor.orange,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          "تابعي التابعي",
                          style: AppColor.titletabeen2,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),


            SizedBox(height: 10,),


            Text(
                  "السيرة الذاتية",
                  style: AppColor.title.copyWith(color: AppColor.getBlack(context)),
                ),

            buildBioRow("الكنية", "أبو عبد الله ، ويقال : أبو عبد الرحمن ، ويقال : أبو محمد"),
            buildBioRow("النسب", "الخزرجي، الأنصاري، السلمي، المدني، عقبي"),
            buildBioRow("بلد الإقامة", "المدينة"),
            buildBioRow("علاقات الراوي", "لا يوجد"),
            buildBioRow("بلد الوفاة", "لا يوجد"),
            buildBioRow("بلد الرحلة", "لا يوجد"),
            buildBioRow("طبقة رواة التقريب", "كبار الثالثة"),
            buildBioRow("الرتبة عند ابن حجر", "ثقة، رمي بالتشيع"),
            buildBioRow("الرتبة عند الذهبي", "ثقة"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildBioRow(
                    "الجرح والتعديل",
                    "أحمد بن حنبل قال حرب بن إسماعيل: قيل لأحمد بن حنبل: أبو عبد الله الجدلي معروف ؟ قال: نعم ووثقه [تهذيب الكمال (34/24)] "
                        "نا عبد الرحمن، نا حرب بن إسماعيل فيما كتب إلي قال: قلت لأحمد بن حنبل: أبو عبد الله الجدلي معروف ؟ قال: نعم ووثقه [الجرح والتعديل لابن أبي حاتم (6/93)] "
                        "قال حرب بن إسماعيل: قيل لأحمد بن حنبل: أبو عبد الله الجدلي معروف ؟ قال: نعم، ووثقه [تهذيب التهذيب (4/547)] "
                        "ابن حبان وذكره ابن حبان في \"الثقات\" [تهذيب التهذيب (4/547)] "
                        "ابن حجر – [لسان الميزان (9/474)] "
                        "وعمرو بن ميمون الأودي على خلاف فيه [تهذيب التهذيب (4/547)] "
                        "ثقة، رمي بالتشيع [تقريب التهذيب (1/1170)] "
                        "الذهبي ثقة [الكاشف في معرفة من له رواية في الكتب الستة (5/70)] "
                        "العجلي وقال العجلي: بصري، تابعي، ثقة [تهذيب التهذيب (4/547)] "
                        "يحيى بن معين وقال ابن أبي خيثمة عن ابن معين: ثقة [تهذيب التهذيب (4/547)] "
                        "نا عبد الرحمن، أنا أبو بكر بن أبي خيثمة فيما كتب إلي قال: سألت يحيى بن معين عن أبي عبد الله الجدلي، فقال: كوفي ثقة [الجرح والتعديل لابن أبي حاتم (6/93)] "
                        "قال البخاري: لا يعرف له سماع من خزيمة بن ثابت، ذكر ذلك عنه الترمذي في حديث المسح على الخفين، وقد صححه ابن معين [تحفة التحصيل في المراسيل (1/323)] "
                        "وقال أبو بكر بن أبي خيثمة، عن يحيى بن معين: ثقة [تهذيب الكمال (34/24)] "
                        "محمد بن سعد وقال ابن سعد في الطبقة الأولى من أهل الكوفة: اسمه عبد بن عبد بن عبد الله بن أبي يعمر بن حبيب بن عائذ بن مالك بن واثلة بن عمرو بن ناج بن يشكر بن عدوان بن عمرو بن قيس عيلان بن مضر، يستضعف في حديثه، وكان شديد التشيع [تهذيب التهذيب (4/547)] "
                        "أبو داود السجستاني وإبراهيم النخعي. قال أبو داود: لم يسمع منه [تهذيب التهذيب (4/547)] "
                        "المزي وعمرو بن ميمون الأزدي (ت) على خلاف فيه [تهذيب الكمال (34/24)] "
                        "البخاري قال البخاري: لا يعرف له سماع من خزيمة بن ثابت، ذكر ذلك عنه الترمذي في حديث المسح على الخفين، وقد صححه ابن معين [تحفة التحصيل في المراسيل (1/323)]",
                  ),
                ),

              ],
            ),
          ),
        
        ),
      ),
    );
  }
  Widget buildBioRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xff212121)
                    : Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 12,color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : const Color(0xff3F3F46),
                )
              ),
            ),
          ),
          const SizedBox(width: 8),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xff212121)
                  : Colors.white,

              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : const Color(0xffE6DBA7),
              ),
            ),
            child: Text(
              label,
              style: AppColor.title2.copyWith(
                color:AppColor.getBlack(context)

              ),
            ),
          ),
        ],
      ),
    );
  }

}
