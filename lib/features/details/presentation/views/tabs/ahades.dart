import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PersonCard {
  final String name;
  final String label;
  final Color labelColor;
  final Color textColor;

  PersonCard({
    required this.name,
    required this.label,
    required this.labelColor,
    required this.textColor

  });
}

final List<PersonCard> cards = [
  PersonCard(
    name: "جابر بن عبد الله الأنصاري",
    label: "صحابي",
    labelColor: AppColor.purple,
    textColor: AppColor.purple2
  ),
  PersonCard(
    name: "جابر بن عبد الله الأنصاري",
    label: "تابعي",
    labelColor: AppColor.pink,
      textColor: AppColor.pink2
  ),
  PersonCard(
    name: "جابر بن عبد الله الأنصاري",
    label: "تابعي التابعي",
    labelColor: AppColor.orange,
      textColor: AppColor.orange2
  ),
  PersonCard(
    name: "جابر بن عبد الله الأنصاري",
    label: "تابعي التابعي",
      labelColor: AppColor.orange,
      textColor: AppColor.orange2
  ),
  PersonCard(
    name: "جابر بن عبد الله الأنصاري",
    label: "تابعي التابعي",
      labelColor: AppColor.orange,
      textColor: AppColor.orange2
  ),
];

class Ahades extends StatelessWidget {
  const Ahades({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: cards.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final card = cards[index];
          return Container(
            height: 95,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  decoration: const BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          card.name,
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,

                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: card.labelColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            card.label,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
