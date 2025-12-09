import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

class RwahScreen extends StatefulWidget {
  const RwahScreen({super.key});

  @override
  State<RwahScreen> createState() => _RwahScreenState();
}

class _RwahScreenState extends State<RwahScreen> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: AppColor.getAppBarColor(context),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back_ios, color: AppColor.getBlack(context)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "الصحابه",
          style: AppColor.title.copyWith(color: AppColor.getBlack(context)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10,top: 8),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.primary,
                ),

                child: Center(child: Text("التابعين الرواه",style: AppColor.title.copyWith(fontWeight: FontWeight.w300))),
              ),
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "عن جابر بن عبد الله الانصاري",
                  style: AppColor.title2.copyWith(fontSize: 25),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 110 / 100,
                ),
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return buildSahabiCard(
                    context: context,
                    index: index,
                    isSelected: selectedIndex == index,
                    type: "تابعي",
                    name: "عطاء بن ابي رباح اسلم",
                    date: "تاريخ الوفاة 78 هجريه",
                  );
                },
              ),
            ),

          ],
        ),
      ),

    );
  }

  Widget buildSahabiCard({
    required BuildContext context,
    required int index,
    required bool isSelected,
    required String type,
    required String name,
    required String date,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        Navigator.pushNamed(context, PageRouteName.details);

      },
      child: Card(
        elevation: 3,
        color: isSelected ? AppColor.primary : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [

            Container(
              width: 24,
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : AppColor.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.chevron_left,
                  color: isSelected ? AppColor.primary : AppColor.white,
                  size: 20,
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.white24
                            : AppColor.blue2,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        type,
                        style: TextStyle(
                          color: isSelected ? AppColor.white : AppColor.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? Colors.white : AppColor.getBlack(context),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 12,
                        color: isSelected ? Colors.white70 : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
