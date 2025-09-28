import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/route/routes.dart';

class Rawah2 extends StatefulWidget {
  const Rawah2({super.key});

  @override
  State<Rawah2> createState() => _Rawah2State();
}

class _Rawah2State extends State<Rawah2> {
  bool isBookmarked2 = false;
  bool isBookmarked3 = false;
  bool isCopy2=false;
  bool isCopy3=false;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: 392,
                height: 325,
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              isBookmarked2 ? Icons.bookmark : Icons.bookmark_border,
                              color: const Color(0xff7FCC82),
                              size: 40,
                            ),
                            onPressed: () {
                              setState(() {
                                isBookmarked2 = !isBookmarked2;
                              });
                            },
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isCopy2= !isCopy2;
                              });
                            },
                            child: Icon( isCopy2 ?  FontAwesomeIcons.solidCopy: Icons.copy,
                                color: AppColor.white, size: 30),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.share, color: AppColor.white, size: 30),
                          ),

                        ],
                      ),
                    ),

                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: RichText(
                          textAlign: TextAlign.right,
                          text: TextSpan(
                            style: AppColor.titleStyle.copyWith(
                              color: Colors.white,
                              fontFamily: 'ArialNova',
                              fontSize: 16,
                              height: 1.6,
                            ),
                            children: [
                              const TextSpan(
                                text: "بابِ حَدَثنا ",
                              ),
                              TextSpan(
                                text: "(عَلَى بِن عَبْد اللّٰه)",
                                style: AppColor.titleStyle.copyWith(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                  fontFamily: 'ArialNova',
                                  fontSize: 16,
                                  height: 1.6,
                                  fontWeight: FontWeight.bold
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, PageRouteName.details);
                                  },
                              ),
                              const TextSpan(
                                text:
                                " حَدَثنا سُفْيان حَدَثنا اِبْن المنكدر قالَ سَمِعْتُ جابِر بِن عَبْد اللّٰه رَضِيَ اللّٰه عَنهُما "
                                    "قالَ جِي بِأَبِي يَوْمَ أَحَدُ قَد مِثْلَ بِهِ حَتَّى وَضْعِ بَيِّنَ يَدَيْ رَسُولُ اللّٰه صَلَّى "
                                    "اللّٰه عَلَيهِ وَسَلَّمَ وَقَد سَجَّى ثَوْبا فَذَهَبَت أُرِيد أَنَّ أَكْشِف عَنهُ فَنَهانِي قَوْمِيٌّ "
                                    "ثُمَّ ذَهَبْتُ أَكْشِف عَنهُ فَنَهانِي قَوْمِيٌّ فَأَمَرّ رَسُولُ اللّٰه صَلَّى اللّٰه عَلَيهِ "
                                    "وَسَلَّمَ فَرَفَعَ فَسَمِعَ صَوْتٍ صائِحه فَقالَ مِن هٰذِهِ فَقالُوا اِبْنَةُ عَمْرو أَو أُخْت عَمْرو "
                                    "قالَ فَلَم تَبْكَى أَو لا تَبْكَى فَما زالَت المَلائِكَةِ تَظَلّه بِأَجْنِحَتها حَتَّى رَفْعِ",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 100,

                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(
                              6,
                            ),
                          ),
                          child: Text(
                            "صحيح البخاري",
                            style: AppColor.title.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color:
                              Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          width: 80,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xff34a89a),
                            borderRadius: BorderRadius.circular(
                              6,
                            ),
                          ),
                          child: Text(
                            "المصدر",
                            style: AppColor.title.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color:
                              Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: 392,
                height: 1300,
                //constraints: BoxConstraints(minHeight: 700),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              isBookmarked2 ? Icons.bookmark : Icons.bookmark_border,
                              color: const Color(0xff7FCC82),
                              size: 40,
                            ),
                            onPressed: () {
                              setState(() {
                                isBookmarked2 = !isBookmarked2;
                              });
                            },
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isCopy3= !isCopy3;
                              });
                            },
                            child: Icon( isCopy3 ?  FontAwesomeIcons.solidCopy: Icons.copy,
                                color: AppColor.white, size: 30),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.share, color: AppColor.white, size: 30),
                          ),

                        ],
                      ),
                    ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: RichText(
                        textAlign: TextAlign.right,
                        text: TextSpan(
                          style: AppColor.titleStyle.copyWith(
                            color: Colors.white,
                            fontFamily: 'ArialNova',
                            fontSize: 16,
                            height: 1.6,
                          ),
                          children: [
                            const TextSpan(
                              text: "بابِ حَدَثنا ",
                            ),
                            TextSpan(
                              text: "(يَحْيَى بِن بَكِير)",
                              style: AppColor.titleStyle.copyWith(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                                fontFamily: 'ArialNova',
                                fontSize: 16,
                                height: 1.6,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, PageRouteName.details);
                                },
                            ),
                            const TextSpan(
                              text: " وَ حَدَثَنِي ",
                            ),
                            TextSpan(
                              text: "(سَعِيد بِن مَرْوان)",
                              style: AppColor.titleStyle.copyWith(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                                fontFamily: 'ArialNova',
                                fontSize: 16,
                                height: 1.6,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, PageRouteName.details);
                                },
                            ),
                            const TextSpan(
                              text: "حَدَثَنِي سَعِيد بِن مَرْوان حَدَثنا مُحَمَّد بِن عَبْد العَزِيز بِن أَبِي رَزَمَهُ أَخْبَرَنا أَبُو صالِح سلمويه قالَ حَدَثَنِي عَبْد اللّٰه عَن يُونِس بِن يَزِيد قالَ أَخْبَرَنِي اِبْن شِهاب أَنَّ عَرَوْهُ بِن الزُبَيْر أَخْبَرَهُ أَنَّ عائِشه زَوْج النَبِيِّ صَلَّى اللّٰه عَلَيهِ وَسَلَّمَ قالَت كانَ أَوَّلِ ما بدئ بِهِ رَسُولُ اللّٰه صَلَّى اللّٰه عَلَيهِ وَسَلَّمَ الرُؤْيا الصادِقَةُ فِي النَوْم فَكانَ لا يَرِي رُؤْيا إِلّا جات مِثْلَ فَلَقَ الصُبْح ثُمَّ حَبَّبَ إِلَيهِ الخلا فَكانَ يُلْحِق بِغار حُرّاً فَيَتَحَنَّث فِيهِ قالَ والتحنث التَعَبُّد اللَيالِي ذَوات العَدَدَ قِبَلَ أَنَّ يَرْجِع إِلَى أَهْله وَيَتَزَوَّد لِذٰلِكَ ثُمَّ يَرْجِع إِلَى خَدِيجَة فَيَتَزَوَّد بِمِثْلِها حَتَّى فَجِئَهُ الحَقَّ وَهُوَ فِي غارَ حُرّاً فَجاه المَلِكُ فَقالَ أَقْرَأ فَقالَ رَسُولُ اللّٰه صَلَّى اللّٰه عَلَيهِ وَسَلَّمَ ما أَنا بِقارِئ قالَ فَأَخَذَنِي فَغَطَّنِي حَتَّى بَلَغَ مِنِّي الجُهْدِ ثُمَّ أَرْسَلَنِي فَقالَ أَقْرَأ قُلْتُ ما أَنا بِقارِئ فَأَخَذَنِي فَغَطَّنِي الثانِيَةِ حَتَّى بَلَغَ مِنِّي الجُهْدِ ثُمَّ أَرْسَلَنِي فَقالَ أَقْرَأ قُلْتُ ما أَنا بِقارِئ فَأَخَذَنِي فَغَطَّنِي الثالِثَةِ حَتَّى بَلَغَ مِنِّي الجُهْدِ ثُمَّ أَرْسَلَنِي فَقالَ { أَقْرَأ بِاِسْمِ رَبّكَ الَّذِي خَلْقُ خَلْقُ الإِنْسانِ مِن عَلَّقَ أَقْرَأ وَرَبّكَ الأَكْرَم الَّذِي عُلِمَ بِالقَلَمِ الآياتِ إِلَى قَوْلَهُ عُلِمَ الإِنْسانِ ما لَم يَعْلَم } فَرَجَعَ بِها رَسُولُ اللّٰه صَلَّى اللّٰه عَلَيهِ وَسَلَّمَ تَرْجُف بَوادِره حَتَّى دَخَلَ عَلَى خَدِيجَة فَقالَ زملوني زملوني فزملوه حَتَّى ذَهَبَ عَنهُ الرَوْع قالَ لَخَدِيجه أَيّ خَدِيجَة ما لِيَ لَقَد خَشِيَت عَلَى نَفْسِي فَأَخْبَرَها الخُبَر قالَت خَدِيجَة كُلّاً أُبَشَّر فوالله لا يَخْزِيكَ اللّٰه أَبْدَأ فوالله أَنَّكَ لِتَصِل الرَحِمِ وَتُصَدِّق الحَدِيثُ وَتَحْمِل الكُلُّ وَتَكْسِب المَعْدُوم وَتُقَرِّي الضَيْفُ وَتُعَيَّن عَلَى نَوائِب الحَقَّ فَاِنْطَلَقَت بِهِ خَدِيجَة حَتَّى أَتَت بِهِ وَرَقَةً بِن نوفل وَهُوَ اِبْن عَمِّ خَدِيجَة أَخِي أَبِيها وَكانَ أَمَرّا تَنَصَّرَ فِي الجاهِلِيَّة وَكانَ يُكْتَب الكِتابِ العَرَبِيِّ وَيَكْتُب مِن الإِنْجِيلِ بِالعَرَبِيَّةِ ما شا اللّٰه أَنَّ يُكْتَب وَكانَ شَيْخا كَبِيراً قَد عَمَّيَّ فَقالَت خَدِيجَة يا اِبْن عَمِّ أَسْمَع مِن اِبْن أَخِيكَ قالَ وَرَقَةً يا اِبْن أَخِي ماذا تَرِي فَأَخْبَرَهُ النَبِيِّ صَلَّى اللّٰه عَلَيهِ وَسَلَّمَ خَبَرٍ ما رَأَى فَقالَ وَرَقَةً هٰذا النامُوس الَّذِي أَنْزِل عَلَى مُوسَى لَيْتَنِي فِيها جَذَعا لَيْتَنِي أَكُون حَيّاً ذَكَرَ حَرْفاً قالَ رَسُولُ اللّٰه صَلَّى اللّٰه عَلَيهِ وَسَلَّمَ اومخرجي هُم قالَ وَرَقَةً نَعَم لَم يَأْت رَجُلُ بِما جِئْتُ بِهِ إِلّا اوذي وَإِن يُدْرِكنِي يَوْمكَ حَيّاً أَنْصُركَ نَصْراً مؤزرا ثُمَّ لَم يَنْشَب وَرَقَةً أَنَّ تُوُفِّيَ وَفَتَرَ الوَحْيِ فَتْرَةٍ حَتَّى حُزْنٍ رَسُولُ اللّٰه صَلَّى اللّٰه عَلَيهِ وَسَلَّمَ قالَ مُحَمَّد بِن شِهاب فَأَخْبَرَنِي أَبُو سَلَّمَهُ بِن عَبْد الرَحْمٰن أَنَّ جابِر بِن عَبْد اللّٰه الأَنْصارِيُّ رَضِيَ اللّٰه عَنهُما قالَ قالَ رَسُولُ اللّٰه صَلَّى اللّٰه عَلَيهِ وَسَلَّمَ وَهُوَ يَحْدُث عَن فَتْرَةٍ الوَحْيِ قالَ فِي حَدِيثِهِ بَيَّنا أَنا أَمْشَى سَمِعْتُ صَوْتاً مِن السما فَرَفَعَت بَصَرِيّ فَإِذا المَلِكُ الَّذِي جانِي بَحْرا جالِس عَلَى كُرْسِيِّ بَيِّنَ السما وَالأَرْض فَفَرَّقَت مِنهُ فَرَجَعَت فَقُلْتُ زملوني زملوني فَدَثَّرُوهُ فَأَنْزِل اللّٰه تَعالَى { يا أَيُّها المدثر قَمَّ فَأَنْذَرَ وَرَبّكَ فَكَبَرَ وَثِيابكَ فَطُهْر وَالرَجَز فَأَهْجُر } قالَ أَبُو سَلَّمَهُ وَهِيَ الأَوْثان الَّتِي كانَ أَهْلِ الجاهِلِيَّة يَعْبُدُونَ قالَ ثُمَّ تُتابِع الوَحْيِ  ",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 100,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(
                              6,
                            ),
                          ),
                          child: Text(
                            "صحيح البخاري",
                            style: AppColor.title.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color:
                              Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          width: 80,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xff34a89a),
                            borderRadius: BorderRadius.circular(
                              6,
                            ),
                          ),
                          child: Text(
                            "المصدر",
                            style: AppColor.title.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color:
                              Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}