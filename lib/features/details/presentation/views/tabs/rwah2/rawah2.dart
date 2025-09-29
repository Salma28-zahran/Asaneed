import 'package:asaneed/features/details/presentation/views/tabs/rwah2/widgets/hadith_card.dart';
import 'package:asaneed/features/details/presentation/views/tabs/rwah2/widgets/hadith_data.dart';
import 'package:flutter/material.dart';
import 'package:asaneed/theme/app_theme.dart';

class Rawah2 extends StatefulWidget {
  const Rawah2({super.key});

  @override
  State<Rawah2> createState() => _Rawah2State();
}

class _Rawah2State extends State<Rawah2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: hadiths.map((h) {
              return HadithCard(
                mainText: h.mainText,
                highlights: h.highlights,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
