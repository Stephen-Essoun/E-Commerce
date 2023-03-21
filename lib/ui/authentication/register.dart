import 'package:e_commerce/ui/authentication/toggle_btn.dart';
import 'package:e_commerce/utils/constant/const.dart';
import 'package:e_commerce/utils/widgets/big_text.dart';
import 'package:e_commerce/utils/widgets/small_text.dart';
import 'package:e_commerce/utils/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utils/constant/colors.dart';

class RegisteringUi extends StatefulWidget {
  final Function toggle;
  const RegisteringUi({super.key, required this.toggle});

  @override
  State<RegisteringUi> createState() => _RegisteringUiState();
}

class _RegisteringUiState extends State<RegisteringUi> {
  bool _isVisible = false;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: wallPadding),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(child: LText(text: 'Create account')),
                  wSpacing,
                  Center(
                      child: SText(
                    text: 'Uncover what truly resonates with\nyour interest',
                    textAlign: TextAlign.center,
                  )),
                  wSpacing,
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: white,
                        foregroundColor: black.withAlpha(150),
                        side: const BorderSide(
                            width: 2, // the thickness
                            color: secondColor // the color of the border
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
                  CustomTextField(
                    id: 'Password',
                    prefixIcon: InkWell(
                        onTap: () => setState(() {
                              _isVisible = !_isVisible;
                            }),
                        child: Icon(_isVisible
                            ? Icons.visibility
                            : Icons.visibility_off)),
                  ),
                  wSpacing,
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Sign up')),
                  wSpacing,
                  Center(
                    child: GestureDetector(
                      onTap: () => widget.toggle(),
                      child: RichText(
                          text: const TextSpan(
                              text: 'Already a members? ',
                              style: TextStyle(color: black),
                              children: [
                            TextSpan(
                                text: 'Login',
                                style: TextStyle(
                                    color: mainColor,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline))
                          ])),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
