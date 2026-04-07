import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
    
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return const HadithContainer();
        },
      ),
    );
  }
}

class HadithContainer extends StatelessWidget {
  const HadithContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.getContainerColor(context),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color:AppColor.getborder(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _chip("#2"),
              const SizedBox(width: 8),
              _chip("حديث #6"),
              const SizedBox(width: 8),
              _chip("صحيح", isGreen: true),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  "علوم الحديث الموقوف والمقطوع",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          const Text(
            "الدين النصيحة، قلنا: لمن؟ قال: لله ولكتابه ولرسوله ولأئمة المسلمين وعامتهم.",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(String text, {bool isGreen = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isGreen ? const Color(0xFFDDF5E5) : const Color(0xFFEDEDED),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isGreen ? Colors.green : Colors.grey[700],
          fontSize: 12,
        ),
      ),
    );
  }
}