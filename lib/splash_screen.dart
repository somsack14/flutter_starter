import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lod_laos/components/constants/image_path.dart';
import 'package:lod_laos/components/router/router.dart';
import 'package:rive/rive.dart';

import 'components/styles/size_config.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late RiveAnimationController _controller;
  late Artboard _artboard;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    checkStatusAuth();
    _loadRiveFile();
  }

  Future checkStatusAuth() async {
    Future.delayed(const Duration(seconds: 3), () {
      context.go(PageName.homeScreenRoute);
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     FadePageRoute(builder: (context) => const NavigatorBottomBar()),
      //     (route) => false);
    });
  }

  void _loadRiveFile() async {
    _controller = OneShotAnimation(
      'Example',
      autoplay: true,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Switch.adaptive(
            //   value: darkTheme.darkTheme,
            //   onChanged: (value) {
            //     darkTheme.darkTheme = value;
            //   },
            // ),
            SizedBox(
              height: SizeConfig.imageSizeMultiplier * 30,
              child: RiveAnimation.asset(
                ImagePath.imgCarLogo,
                fit: BoxFit.fitHeight,
                animations: const ["example"],
                controllers: [_controller],
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 40.0,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('LODLAOS',
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(
                              fontFamily: "Orange",
                              fontSize: SizeConfig.textMultiplier * 3)),
                ],
                isRepeatingAnimation: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FadePageRoute<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  FadePageRoute({required this.builder})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
