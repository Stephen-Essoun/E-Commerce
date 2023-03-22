import 'dart:developer';

import 'package:e_commerce/provider/auth.dart';
import 'package:e_commerce/ui/authentication/toggle_btn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:provider/provider.dart';

class AuthState extends StatefulWidget {
  const AuthState({super.key});

  @override
  State<AuthState> createState() => _AuthStateState();
}

class _AuthStateState extends State<AuthState> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshot) {
        var user = context.watch<Authentication>().user;
        if (user != null) {
          if (!user.emailVerified) {
            log('${user.emailVerified}');
          } else if (user.emailVerified) {
            log('${user.emailVerified}');
          }
        }
        return const ToggleBetweenUi();
      },
    );
  }
}
