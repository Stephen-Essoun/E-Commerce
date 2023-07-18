import 'package:e_commerce/ui/authentication/toggle_btn.dart';
import 'package:e_commerce/ui/onboarding/page_content.dart';
import 'package:e_commerce/utils/constant/colors.dart';
import 'package:e_commerce/utils/constant/const.dart';
import 'package:e_commerce/utils/widgets/small_text.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var pages = [
    const PageContent(
        image: 'images/jda.png',
        title: 'Online shopping.',
        subTitle:
            'Everything you need. Select your prefered item\nand place your order now!'),
    const PageContent(
        image: 'images/pay.png',
        title: 'Easy & Secure payment.',
        subTitle:
            'Shop with peace of mind on our app.\nKeeping your transactions secured'),
    const PageContent(
        image: 'images/wait.png',
        title: 'You can have your\ntask ongoing\nand still enjoy it.',
        subTitle: 'Enjoy no hidden cost\nand outstanding customer service!'),
  ];
  int _pageIndex = 0;
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(wallPadding),
                  child: SText(text: 'Skip'),
                )),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (value) {
                  setState(() {
                    _pageIndex = value;
                  });
                },
                children: pages,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    3,
                    (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 5,
                            width: index == _pageIndex ? 10 : 5,
                            decoration: BoxDecoration(
                                color: index == _pageIndex
                                    ? mainColor
                                    : secondColor,
                                borderRadius: index == _pageIndex
                                    ? const BorderRadius.all(Radius.circular(5))
                                    : null,
                                shape: index == _pageIndex
                                    ? BoxShape.rectangle
                                    : BoxShape.circle),
                          ),
                        )),
              ],
            ),
            wSpacing,
            wSpacing,
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(wallPadding),
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                _pageIndex == 2
                    ? Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) =>
                            const ToggleBetweenUi()))
                    : _controller.nextPage(
                        duration: const Duration(microseconds: 500),
                        curve: Curves.bounceInOut);
              });
            },
            child: Text(_pageIndex == 2 ? 'Get Started' : 'Next')),
      ),
    );
  }
}
