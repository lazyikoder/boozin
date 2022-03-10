import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lol/app/modules/home/views/home_view.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool _visible = false;
  bool align = false;

  @override
  void initState() {
    super.initState();
    initSetup().then((_) async {
      _startAnimation();
    });
  }

  Future<void> _startAnimation() async {
    setState(() => align = !align);
    await Future.delayed(
      const Duration(milliseconds: 100),
    );
    setupComplete();
  }

  Future<void> initSetup() {
    return Future.delayed(const Duration(seconds: 2));
  }

  Future<void> setupComplete() async {
    setState(() => _visible = true);
    await Future.delayed(const Duration(seconds: 1));
    Get.off(() => HomeView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints.tight(const Size(210, 85)),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  AnimatedAlign(
                      duration: const Duration(milliseconds: 500),
                      alignment:
                          align ? const Alignment(0.615, 0) : Alignment.center,
                      child: SizedBox(
                        child: Image.asset(
                          "images/logo-small.png",
                          fit: BoxFit.cover,
                        ),
                      )),
                  if (align)
                    AnimatedOpacity(
                        opacity: _visible ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 1500),
                        child: SizedBox(
                          child: Image.asset(
                            "images/logo.png",
                            fit: BoxFit.cover,
                          ),
                        ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
