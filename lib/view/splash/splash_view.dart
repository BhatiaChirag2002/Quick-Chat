import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/utils/app_colors.dart';
import 'package:quick_chat/utils/app_text_style.dart';
import 'package:quick_chat/utils/my_flutter_app_icons.dart';
import 'package:quick_chat/view/splash/splash_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool isAnimateLogo = false;
  bool isAnimateName = false;
  bool isAnimateSlogan = false;
  bool isAnimateCreated = false;
  SplashService splashService = SplashService();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        isAnimateLogo = true;
      });
    });
    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        isAnimateName = true;
      });
    });
    Future.delayed(const Duration(milliseconds: 4000), () {
      setState(() {
        isAnimateSlogan = true;
      });
    });
    Future.delayed(const Duration(milliseconds: 5000), () {
      setState(() {
        isAnimateCreated = true;
      });
    });
    splashService.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.black,
      body: Stack(
        children: [
          AnimatedPositioned(
              top: isAnimateLogo ? 200.h : -140.h,
              height: 130.w,
              width: 360.w,
              duration: const Duration(seconds: 2),
              child: Image.asset(
                'assets/image/quickly.png',
                height: 130.w,
                width: 130.w,
              )),
          AnimatedPositioned(
              height: 80.h,
              right: 30.w,
              left: 30.w,
              bottom: isAnimateName ? 295.h : -100.h,
              duration: const Duration(seconds: 2),
              child: Text(
                'Quick Chat',
                style: CustomTextStyle.itim(
                    fontSize: 60.sp, weight: FontWeight.w700),
              )),
          AnimatedPositioned(
              height: 100.h,
              bottom: 180.h,
              width: 300.w,
              left: isAnimateSlogan ? 25.w : -300.w,
              duration: const Duration(seconds: 1),
              child: Text(
                'Chat with anyone, anytime, anywhere.\nQuick Chat makes it easy!',
                style: CustomTextStyle.grandstander(
                    fontSize: 15.sp, weight: FontWeight.w700),
                textAlign: TextAlign.center,
              )),
          AnimatedPositioned(
              height: 100.h,
              bottom: 10.h,
              width: 360.w,
              right: isAnimateCreated ? -40.w : -360.w,
              duration: const Duration(seconds: 2),
              child: Row(
                children: [
                  Text(
                    'Created By ',
                    style: CustomTextStyle.salsa(
                        fontSize: 20.sp, color: CustomColors.white),
                    textAlign: TextAlign.center,
                  ),
                  Icon(
                    MyFlutterApp.logo,
                    color: CustomColors.white,
                    size: 22.sp,
                  ),
                  Text(
                    ' Chirag Bhatia',
                    style: CustomTextStyle.salsa(
                        fontSize: 20.sp, color: CustomColors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
