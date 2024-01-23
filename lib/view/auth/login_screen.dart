import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quick_chat/utils/app_colors.dart';
import 'package:quick_chat/utils/app_text_style.dart';
import 'package:quick_chat/utils/my_flutter_app_icons.dart';
import 'package:quick_chat/view/home.dart';
import 'package:quick_chat/widget/auth_widget.dart';
import 'package:quick_chat/widget/snack_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  void googleButton() async {
    setState(() {
      loading = true;
    });
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) {
      setState(() {
        loading = false;
      });
      successMessage(context, 'You have login Successfully');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeView()));
    }).onError((error, stackTrace) {
      errorMessage(context, error.toString());
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.black,
      body: Stack(
        children: [
          Positioned(
              height: 130.w,
              width: 360.w,
              bottom: 390.h,
              child: Image.asset(
                'assets/image/quickly.png',
                height: 130.w,
                width: 130.w,
              )),
          Positioned(
              height: 80.h,
              right: 30.w,
              left: 30.w,
              bottom: 310.h,
              child: Text(
                'Quick Chat',
                style: CustomTextStyle.itim(
                    fontSize: 60.sp, weight: FontWeight.w700),
              )),
          Positioned(
              height: 100.h,
              bottom: 210.h,
              right: 25.w,
              left: 25.w,
              child: Text(
                'Chat with anyone, anytime, anywhere.\nQuick Chat makes it easy!',
                style: CustomTextStyle.grandstander(
                    fontSize: 15.sp, weight: FontWeight.w700),
                textAlign: TextAlign.center,
              )),
          Positioned(
              height: 45.h,
              bottom: 90.h,
              right: 40.w,
              left: 40.w,
              child: loading == true
                  ? Center(
                      child: CircularProgressIndicator(
                        color: CustomColors.white,
                      ),
                    )
                  : SocialButton(
                      image: 'search',
                      title: 'Google',
                      onTap: () {
                        googleButton();
                      },
                    )),
          Positioned(
              height: 100.h,
              bottom: 5.h,
              left: 48.w,
              right: 48.w,
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
