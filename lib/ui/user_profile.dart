import 'package:e_commerce/utils/constant/colors.dart';
import 'package:e_commerce/utils/constant/const.dart';
import 'package:e_commerce/utils/widgets/appbar.dart';
import 'package:e_commerce/utils/widgets/medium_text.dart';
import 'package:e_commerce/utils/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: myTile(leading: MText(text: 'Profile')),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 5,
            decoration: BoxDecoration(border: Border.all(color: secondColor)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(wallPadding),
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: thirdColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MText(text: 'Name'),
                    SText(text: 'email'),
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
