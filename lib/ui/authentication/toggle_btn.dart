import 'package:e_commerce/ui/authentication/login.dart';
import 'package:e_commerce/ui/authentication/register.dart';
import 'package:flutter/material.dart';

class ToggleBetweenUi extends StatefulWidget {
  const ToggleBetweenUi({
    super.key,
  });

  @override
  State<ToggleBetweenUi> createState() => _ToggleBetweenUiState();
}

class _ToggleBetweenUiState extends State<ToggleBetweenUi> {
  bool isLogin = true;
  void toggleUi() => setState(() {
        isLogin = !isLogin;
      });

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? LoginUi(toggle: toggleUi)
        : RegisteringUi(
            toggle: toggleUi,
          );
  }
}
