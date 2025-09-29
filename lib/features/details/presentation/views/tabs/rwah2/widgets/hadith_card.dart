import 'package:asaneed/features/details/presentation/views/tabs/rwah2/widgets/hadith_data.dart';
import 'package:asaneed/features/home/provider/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:asaneed/core/route/routes.dart';
import 'package:provider/provider.dart';

class HadithCard extends StatefulWidget {
  final String mainText;
  final List<Highlight> highlights;

  const HadithCard({
    super.key,
    required this.mainText,
    this.highlights = const [],
  });

  @override
  State<HadithCard> createState() => _HadithCardState();
}

class _HadithCardState extends State<HadithCard> {
  bool isBookmarked = false;
  bool isCopied = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 392,
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: const Color(0xff7FCC82),
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      isBookmarked = !isBookmarked;
                    });

                    if (isBookmarked) {
                      // أضيف الكارد نفسه للمفضلة
                      Provider.of<FavoritesProvider>(context, listen: false).addHadith(
                        HadithCard(
                          key: widget.key, // مهم لو حابة تميزيه
                          mainText: widget.mainText,
                          highlights: widget.highlights,
                        ),
                      );
                    } else {
                      Provider.of<FavoritesProvider>(context, listen: false).removeHadith(
                        HadithCard(
                          key: widget.key,
                          mainText: widget.mainText,
                          highlights: widget.highlights,
                        ),
                      );
                    }
                  },
                ),


                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCopied = !isCopied;
                    });
                  },
                  child: Icon(
                    isCopied ? FontAwesomeIcons.solidCopy : Icons.copy,
                    color: AppColor.white,
                    size: 30,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                  },
                  child: Icon(Icons.share, color: AppColor.white, size: 30),
                ),
              ],
            ),
          ),
          Padding(
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
                  const TextSpan(text: "بابِ حَدَثنا "),
                  ...widget.highlights.map(
                    (h) => TextSpan(
                      text: h.text,
                      style: AppColor.titleStyle.copyWith(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap =
                                () => h.onTap(
                                  context,
                                ),

                    ),
                  ),
                  TextSpan(text: widget.mainText),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          // مصدر الحديث
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 100,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "صحيح البخاري",
                  style: AppColor.title.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 80,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xff34a89a),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "المصدر",
                  style: AppColor.title.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
