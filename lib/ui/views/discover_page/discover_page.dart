import 'package:flutter/material.dart';
import 'package:hk_music/common/constants/colors.dart';
import 'package:hk_music/common/helpers/helpers_functions.dart';
import 'package:hk_music/ui/views/categories/all_category_page.dart';
import 'package:hk_music/ui/views/discover_page/components/search_page.dart';
import 'package:iconsax/iconsax.dart';
import '../../../common/styles/spacing_styles.dart';
import '../categories/comedy_category_page.dart';
import '../categories/life_category_page.dart';
import '../categories/tech_category_page.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  bool isSearchOpen = false;

  @override
  Widget build(BuildContext context) {
    final height = THelperFunctions.screenHeight(context);
    final width = THelperFunctions.screenWidth(context);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Podkes",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          leading: Padding(
            padding: EdgeInsets.only(left: width * 0.05),
            child: const Icon(
              Icons.sort_outlined,
              color: AppColors.textPrimary,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () => setState(() => isSearchOpen = !isSearchOpen),
              icon: Icon(
                isSearchOpen ? Icons.close : Icons.search,
                color: AppColors.textPrimary,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: width * 0.05),
              child: const Icon(
                Iconsax.notification5,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () => setState(() => isSearchOpen = false),
        child: Stack(
          children: [
            Visibility(
              visible: !isSearchOpen,
              child: Padding(
                padding: TSpacingStyle.paddingWithAppBarHeight,
                child: Column(
                  children: [
                    // DefaultTabController and TabBarView
                    Expanded(
                      child: DefaultTabController(
                        length: 4,
                        child: Column(
                          children: [
                            Material(
                              child: Container(
                                height: height * 0.075, //65,
                                color: AppColors.primaryColor,
                                child: TabBar(
                                  isScrollable:
                                      true, // Yatay olarak kaydırılabilir
                                  indicatorColor: Colors.yellow,
                                  physics: const ClampingScrollPhysics(),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width * 0,
                                    vertical: height * 0.013,
                                  ),
                                  labelColor: AppColors.secondaryColor,
                                  unselectedLabelColor: AppColors.textPrimary,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  tabs: [
                                    Tab(
                                      child: Container(
                                        width:
                                            width * 0.2, //90, // Tab genişliği
                                        decoration: BoxDecoration(
                                          color: AppColors.buttonColor,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Align(
                                          alignment: Alignment.center,
                                          child: Text("All"),
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Container(
                                        width: width *
                                            0.26, //100, // Tab genişliği
                                        decoration: BoxDecoration(
                                          color: AppColors.buttonColor,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Align(
                                          alignment: Alignment.center,
                                          child: Text("Life"),
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Container(
                                        width:
                                            width * 0.3, //120, // Tab genişliği
                                        decoration: BoxDecoration(
                                          color: AppColors.buttonColor,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Align(
                                          alignment: Alignment.center,
                                          child: Text("Comedy"),
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Container(
                                        width: width * 0.3, // Tab genişliği
                                        decoration: BoxDecoration(
                                          color: AppColors.buttonColor,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Align(
                                          alignment: Alignment.center,
                                          child: Text("Tech"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Expanded(
                              child: TabBarView(
                                children: [
                                  AllCategoryPage(),
                                  LifeCategoryPage(),
                                  ComedyCategoryPage(),
                                  TechCategoryPage(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: isSearchOpen,
              child: const SearchPage(),
            ),
          ],
        ),
      ),
    );
  }
}
