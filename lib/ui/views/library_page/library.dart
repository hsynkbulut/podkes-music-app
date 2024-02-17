import "package:flutter/material.dart";
import "package:hk_music/common/constants/colors.dart";
import "package:hk_music/common/helpers/helpers_functions.dart";
import "package:hk_music/ui/views/library_page/library_tiles.dart";

import "../../../core/view_model/library_viewmodel.dart";

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = THelperFunctions.screenHeight(context);
    final width = THelperFunctions.screenWidth(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 10,
        shadowColor: Colors.black,
        toolbarHeight: 135,
        flexibleSpace: FlexibleSpaceBar(
          expandedTitleScale: 1,
          titlePadding: EdgeInsetsDirectional.only(
              start: width * 0.04,
              end: width * 0.04,
              top: height * 0.01,
              bottom: height * 0.02),
          background: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              children: [
                SizedBox(height: height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://i.pinimg.com/474x/08/03/1e/08031e3f79a5a12506dd3554a325dd09.jpg"),
                          radius: 15,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Your Library",
                          style: TextStyle(
                              fontFamily: "Gotham-Black",
                              fontSize: 22,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 28,
                        ),
                        SizedBox(width: width * 0.05),
                        const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 28,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: height * 0.03)
              ],
            ),
          ),
          title: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.secondaryColor,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 9, horizontal: 14),
                child: const Text(
                  "Playlists",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.secondaryColor,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 9, horizontal: 14),
                child: const Text(
                  "Podcasts",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.secondaryColor,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 9, horizontal: 14),
                child: const Text(
                  "Artists",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: libraryItems.length,
        itemBuilder: (context, index) {
          final item = libraryItems[index];
          return LibraryTiles(
            image: item.image,
            title: item.title,
            subtitle: item.subtitle,
            pinned: item.pinned ?? false,
          );
        },
      ),
    );
  }
}
