import 'dart:io';

import 'package:e_commerce/provider/auth.dart';
import 'package:e_commerce/provider/user_profile_pic.dart';
import 'package:e_commerce/utils/constant/colors.dart';
import 'package:e_commerce/utils/constant/const.dart';
import 'package:e_commerce/utils/constant/route.dart';
import 'package:e_commerce/utils/widgets/appbar.dart';
import 'package:e_commerce/utils/widgets/medium_text.dart';
import 'package:e_commerce/utils/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  File? imagePath;
  pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    var img = File(image.path);
    setState(() {
      imagePath = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: myTile(leading: MText(text: 'Profile')),
      body: Column(
        children: [
          GestureDetector(
            onTap: () async => context.read<UsersPic>().pickImage,
            child: Container(
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(border: Border.all(color: secondColor)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(wallPadding),
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: thirdColor,
                        image: DecorationImage(
                          image:
                              AssetImage(context.watch<UsersPic>().imagePath),
                        ),
                      ),
                      // child: Image.file(imagePath!)??Text(data),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MText(text: 'Stephen Essoun'),
                      SText(text: 'essoun379@gmail.com'),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.edit_outlined),
                        label: const Text('edit my profile'),
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: white,
                            foregroundColor: black,
                            side: const BorderSide(color: secondColor)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          wSpacing,
          ...List.generate(6, (index) {
            final leadingIcons = [
              const Icon(Icons.settings),
              const Icon(Icons.payment_outlined),
              const FaIcon(FontAwesomeIcons.gift),
              const Icon(Icons.location_on_outlined),
              const FaIcon(FontAwesomeIcons.basketShopping),
              const Icon(Icons.logout_outlined),
            ];
            final title = [
              'Settings',
              'Payments',
              'Reward',
              'Address',
              'My orders',
              'Log out'
            ];
            return ListTile(
              textColor: index == 5 ? mainColor : null,
              iconColor: index == 5 ? mainColor : null,
              onTap: () => index == 5
                  ? context
                      .read<Authentication>()
                      .logOut()
                      .then((value) => Navigator.pop(context, homeRoute))
                  : null,
              leading: leadingIcons[index],
              title: Text(title[index]),
              trailing: index == 5 ? null : const Icon(Icons.arrow_forward_ios),
            );
          })
        ],
      ),
    );
  }
}
