// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:hk_music/common/constants/colors.dart';
import 'package:hk_music/common/helpers/helpers_functions.dart';
import 'package:hk_music/ui/views/audio_player_page/audio_player_screen.dart';
import 'package:hk_music/core/view_model/music_viewmodel.dart';
import 'package:iconsax/iconsax.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Data> display_list = [];
  bool _isSearching = false;

  void updateList(String value) {
    setState(() {
      display_list = musics
          .where((element) =>
              element.musicName.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = THelperFunctions.screenHeight(context);
    //final width = THelperFunctions.screenWidth(context);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(height * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onTap: () {
                setState(() {
                  _isSearching = true;
                });
              },
              onChanged: (value) => updateList(value),
              style: const TextStyle(color: AppColors.textPrimary),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.searchButtonColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "eg: The Dark Knight",
                suffixIcon: const Icon(Iconsax.search_normal_1),
                suffixIconColor: AppColors.textSecondary,
              ),
            ),
            SizedBox(height: height * 0.03),
            _isSearching
                ? Expanded(
                    child: display_list.isEmpty
                        ? const Center(
                            child: Text(
                            "No result found",
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                        : ListView.builder(
                            itemCount: display_list.length,
                            itemBuilder: (context, index) => ListTile(
                              contentPadding: EdgeInsets.all(height * 0.01),
                              title: Text(
                                display_list[index].musicName,
                                style: const TextStyle(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                "${display_list[index].artist}",
                                style: const TextStyle(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              trailing: Text(
                                "${display_list[index].category}",
                                style: const TextStyle(
                                  color: AppColors.ambercolor,
                                ),
                              ),
                              leading: Image.asset(display_list[index].image),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AudioPlayerScreen(
                                      musicData: display_list[index].musicLink,
                                      image: display_list[index].image,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
