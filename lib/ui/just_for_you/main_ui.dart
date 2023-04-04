import 'package:e_commerce/controllers/api.dart';
import 'package:e_commerce/controllers/network.dart';
import 'package:e_commerce/utils/constant/progress_inducator.dart';
import 'package:e_commerce/utils/widgets/appbar.dart';
import 'package:e_commerce/utils/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class JustForYou extends StatefulWidget {
  const JustForYou({super.key});

  @override
  State<JustForYou> createState() => _JustForYouState();
}

class _JustForYouState extends State<JustForYou> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myTile(leading: LText(text: 'Just For You')),
      body: FutureBuilder(
        future: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 3,
                childAspectRatio: 1.5,
                mainAxisExtent: 5,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemBuilder: (context, index) => startLoading('Never loose God'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
