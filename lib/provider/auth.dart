import 'dart:developer';

import 'package:e_commerce/ui/pages/main_page.dart';
import 'package:e_commerce/utils/constant/progress_inducator.dart';
import 'package:e_commerce/utils/constant/route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication extends ChangeNotifier {
  late BuildContext context;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get user => FirebaseAuth.instance.currentUser;

  //create an account using email and password
  Future<void> createUser(
    String email,
    String password,
  ) async {
    try {
      startLoading('Creating account...');
      await _firebaseAuth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        verifyUser(context);
      });
    } on FirebaseAuthException catch (e) {
      stopLoading();
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      log('$e');
    }
  }

  //log in using email and password
  Future<void> logIn(
    String email,
    String password,
  ) async {
    try {
      startLoading('Logging in...');
      await _firebaseAuth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        stopLoading();
      });
    } on FirebaseAuthException catch (e) {
      stopLoading();
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    }
  }

  //create account with Goggle account
  Future<void> goggleCreateUser() async {
    try {} on FirebaseAuthException catch (e) {}
  }

  //login using Goggle account
  Future<void> goggleLogIn() async {}

  //account verification
  void verifyUser(BuildContext context) async {
    try {
      startLoading('Verifying...');

      await user!.sendEmailVerification().then((value) {
        stopLoading();
        showDialog(
            context: context,
            builder: (ctx) => const Center(
                  child: Dialog(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: (Text(
                        'Check your email to verify your account and login back.\nThanks!',
                        style: TextStyle(fontSize: 18),
                      )),
                    ),
                  ),
                ));
        Future.delayed(
          const Duration(seconds: 5),
          () => Navigator.pushNamed(context, toggleBetweenUIRoute),
        );
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //log user out
  Future<void> logOut() async {
    try {
      startLoading('Logging out...');
      await _firebaseAuth.signOut().then((value) => stopLoading());
    } on FirebaseAuthException catch (e) {
      stopLoading();
    }
  }
}
