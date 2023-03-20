import 'package:e_commerce/utils/constant/const.dart';
import 'package:e_commerce/utils/widgets/big_text.dart';
import 'package:e_commerce/utils/widgets/small_text.dart';
import 'package:e_commerce/utils/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utils/constant/colors.dart';

class RegisteringUi extends StatelessWidget {
  const RegisteringUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: wallPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(child: LText(text: 'Create account')),
                wSpacing,
                Center(child: SText(text: 'Uncover much of your interest')),
                wSpacing,
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: white,
                      foregroundColor: mainColor,
                      side: const BorderSide(
                          width: 2, // the thickness
                          color: mainColor // the color of the border
                          )),
                  child: const Text('Sign up with Google'),
                ),
                wSpacing,
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: SText(text: 'Or sign up with email'),
                    ),
                    const Expanded(child: Divider())
                  ],
                ),
                wSpacing,
                wSpacing,
                const CustomTextField(
                  id: 'Name',
                ),
                wSpacing,
                const CustomTextField(
                  id: 'Email',
                ),
                wSpacing,
                const CustomTextField(
                  id: 'Password',
                  prefixIcon: Icon(Icons.visibility),
                ),
                wSpacing,
                ElevatedButton(onPressed: () {}, child: const Text('Sign up'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
