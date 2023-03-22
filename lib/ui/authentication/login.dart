import 'package:e_commerce/provider/auth.dart';
import 'package:e_commerce/ui/authentication/toggle_btn.dart';
import 'package:e_commerce/utils/constant/progress_inducator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../utils/constant/colors.dart';
import '../../utils/constant/const.dart';
import '../../utils/widgets/big_text.dart';
import '../../utils/widgets/small_text.dart';
import '../../utils/widgets/text_field.dart';

class LoginUi extends StatefulWidget {
  final Function toggle;
  const LoginUi({super.key, required this.toggle});

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
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
              Center(child: LText(text: 'Welcome back')),
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
                child: const Text('Login with Google'),
              ),
              wSpacing,
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: SText(text: 'Or login with email'),
                  ),
                  const Expanded(child: Divider())
                ],
              ),
              wSpacing,
              wSpacing,
              CustomTextField(
                id: 'Email',
                controller: email,
                validator: (p0) => validator(p0),
              ),
              wSpacing,
              CustomTextField(
                id: 'Password',
                controller: password,
                obscureText: _isVisible,
                validator: (p0) => validator(p0),
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
                    var auth = context.read<Authentication>();
                    if (_formkey.currentState!.validate()) {
                      auth.logIn(
                        email.text.trim(),
                        password.text.trim(),
                      );
                    }
                  },
                  child: const Text('Login')),
              wSpacing,
              Center(
                child: GestureDetector(
                  onTap: () => widget.toggle(),
                  child: RichText(
                      text: const TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: black),
                          children: [
                        TextSpan(
                            text: 'Register',
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
