import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/user_profile_pic.dart';
import '../ui/user_profile.dart';
import 'constant/colors.dart';

class UserAppBarProfile extends StatelessWidget {
  const UserAppBarProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const UserProfile())),
      child:  CircleAvatar(
        backgroundColor: secondColor,
        foregroundColor: mainColor,
        backgroundImage: AssetImage(context.watch<UsersPic>().imagePath),
        // child: Icon(Icons.person),
      ),
    );
  }
}
