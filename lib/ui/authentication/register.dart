import 'dart:developer';

import 'package:e_commerce/ui/authentication/toggle_btn.dart';
import 'package:e_commerce/utils/constant/const.dart';
import 'package:e_commerce/utils/widgets/big_text.dart';
import 'package:e_commerce/utils/widgets/small_text.dart';
import 'package:e_commerce/utils/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/auth.dart';
import '../../utils/constant/colors.dart';
import '../../utils/constant/progress_inducator.dart';

class RegisteringUi extends StatefulWidget {
  final Function toggle;
  const RegisteringUi({super.key, required this.toggle});

  @override
  State<RegisteringUi> createState() => _RegisteringUiState();
}

class _RegisteringUiState extends State<RegisteringUi> {
  bool _isVisible = false;
  final _formkey = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _auth = context.read<Authentication>();
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: wallPadding),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
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
                // controller: email,
              ),
              wSpacing,
              CustomTextField(
                id: 'Email',
                controller: email,
                validator: (value) => validator(value),
              ),
              wSpacing,
              CustomTextField(
                id: 'Password',
                controller: password,
                obscureText: _isVisible,
                validator: (value) => validator(value),
                prefixIcon: InkWell(
                    onTap: () => setState(() {
                          _isVisible = !_isVisible;
                        }),
                    child: Icon(
                        _isVisible ? Icons.visibility : Icons.visibility_off)),
              ),
              wSpacing,
              ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _auth.createUser(
                        email.text.trim(),
                        password.text.trim(),
                      );
                    }
                  },
                  child: const Text('Sign up')),
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
    );
  }
}
