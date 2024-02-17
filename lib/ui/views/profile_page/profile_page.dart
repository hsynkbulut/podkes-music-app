import 'package:flutter/material.dart';
import 'package:hk_music/common/constants/colors.dart';
import '../../../common/helpers/helpers_functions.dart';
import 'components/profile_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = THelperFunctions.screenHeight(context);
    //final width = THelperFunctions.screenWidth(context);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: height * 0.07),
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/music_user.jpg'),
            ),
            SizedBox(height: height * 0.04),
            const ProfileItem(
              title: 'Name',
              subtitle: 'Hüseyin Karabulut',
              iconData: Icons.person,
            ),
            SizedBox(height: height * 0.015),
            const ProfileItem(
              title: 'Phone',
              subtitle: '05*********',
              iconData: Icons.phone,
            ),
            SizedBox(height: height * 0.015),
            const ProfileItem(
              title: 'Address',
              subtitle: 'Türkiye',
              iconData: Icons.location_pin,
            ),
            SizedBox(height: height * 0.015),
            const ProfileItem(
              title: 'Email',
              subtitle: 'hsyn.kbulut@gmail.com',
              iconData: Icons.mail,
            ),
            SizedBox(height: height * 0.03),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: AppColors.secondaryColor,
                  ),
                  child: const Text('Edit Profile')),
            )
          ],
        ),
      ),
    );
  }
}
