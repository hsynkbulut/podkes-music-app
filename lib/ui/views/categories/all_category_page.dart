import 'package:flutter/material.dart';
import 'package:hk_music/core/view_model/music_viewmodel.dart';
import '../../../common/constants/colors.dart';
import '../../../common/helpers/helpers_functions.dart';
import '../audio_player_page/audio_player_screen.dart';

class AllCategoryPage extends StatefulWidget {
  const AllCategoryPage({Key? key}) : super(key: key);

  @override
  State<AllCategoryPage> createState() => _AllCategoryPageState();
}

class _AllCategoryPageState extends State<AllCategoryPage> {
  @override
  Widget build(BuildContext context) {
    final height = THelperFunctions.screenHeight(context);
    //final width = THelperFunctions.screenWidth(context);
    return GridView.builder(
      //physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Her satırda yer alacak kart sayısı
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 270, // Kartların yüksekliği
      ),
      itemCount: musics.length,
      itemBuilder: (_, index) {
        var data = musics[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AudioPlayerScreen(
                musicData: data.musicLink,
                image: data.image,
              ),
            ),
          ),
          child: Container(
            //margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              //color: AppColors.textGrey,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image(
                          fit: BoxFit.cover,
                          height: 180,
                          image: AssetImage(data.image),
                        )),
                  ],
                ),
                SizedBox(height: height * 0.01),
                Text(
                  data.musicName,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: AppColors.textPrimary,
                      ),
                ),
                SizedBox(height: height * 0.005),
                Row(
                  children: [
                    Text(
                      data.artist,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: AppColors.textSecondary,
                              ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
