
import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:asaneed/features/home/provider/favorites_provider.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.getAppBarColor(context),
          elevation: 0,
          bottom:
          TabBar(
            indicator: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(25),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.white,
            unselectedLabelColor: AppColor.getBlack(context),
            labelStyle: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            tabs: [
              Tab(
                text: "السلاسل",
                icon: ImageIcon(
                  AssetImage(AssetsManager.sal),
                  size: 20,
                ),
              ),
              const Tab(
                text: "الرواة",
                icon: Icon(Icons.groups),
              ),
              Tab(
                text: "الأحاديث",
                icon: ImageIcon(
                  AssetImage(AssetsManager.book1),
                  size: 20,
                ),
              ),
            ],
          )




        ),
        body: TabBarView(
          children: [


            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ImageIcon(
                    AssetImage(AssetsManager.sal2),
                    size: 180,
                    color: AppColor.primary,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "لا توجد سلاسل مفضلة",
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColor.grey,
                    ),
                  ),
                ],
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.groups,
                  weight: 162,
                    size: 160,
                    color: AppColor.primary,
                  ),

                   SizedBox(height: 6),
                  Text(
                    "لا توجد رواة مفضلين",
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColor.grey,
                    ),
                  ),
                ],
              ),
            ),
            Consumer<FavoritesProvider>(
              builder: (context, favProvider, child) {
                if (favProvider.favHadiths.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage(AssetsManager.book2),
                          size: 150,
                          color: AppColor.primary,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "لا توجد أحاديث مفضلة",
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColor.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return SingleChildScrollView(
                  child: Column(
                    children: favProvider.favHadiths.map((hadithWidget) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Stack(
                          children: [
                            hadithWidget,
                            Positioned(
                              top: 22,
                              right: 220,
                              child: IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red,size: 32,),
                                onPressed: () {
                                  favProvider.removeFromFav(hadithWidget);
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),


          ],
        ),
      ),
    );
  }
}
