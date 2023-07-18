
import 'package:e_commerce/provider/auth.dart';
import 'package:e_commerce/utils/constant/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailVerifyView extends StatelessWidget {
  const EmailVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Be a verified user',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          ElevatedButton(
              onPressed: () {
                context.read<Authentication>().verifyUser(context);
                context.read<Authentication>().user!.reload().then((value) {
                  showDialog(
                      context: context,
                      builder: (ctx) => const AspectRatio(
                            aspectRatio: 16 / 19,
                            child: Dialog(
                              child: (Text(
                                  'Check your mails to verify then login back. Thanks!')),
                            ),
                          ));
                  Future.delayed(
                    const Duration(seconds: 3),
                    () => Navigator.pushNamed(context, toggleBetweenUIRoute),
                  );
                });
              },
              child: const Text('Verify')),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, toggleBetweenUIRoute),
            icon: const Icon(Icons.cancel),
            iconSize: 40,
          )
        ]),
      ),
    );
  }
}