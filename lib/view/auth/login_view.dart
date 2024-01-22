import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/utils/app_colors.dart';
import 'package:quick_chat/utils/app_text_style.dart';
import 'package:quick_chat/view/auth/signup_view.dart';
import 'package:quick_chat/widget/auth_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.black,
          toolbarHeight: 0,
        ),
        backgroundColor: CustomColors.white,
        body: Container(
          height: 690.h,
          width: 360.w,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image/background.jpg'),
                  fit: BoxFit.fill)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 90.h,
                  width: 90.h,
                  margin: EdgeInsets.symmetric(vertical: 27.9.h),
                  child: Image.asset(
                    'assets/image/quickly.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  height: 525.h,
                  width: 360.w,
                  decoration: BoxDecoration(
                      color: CustomColors.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(110))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Text(
                            'Login',
                            style: CustomTextStyle.salsa(fontSize: 35.sp),
                          ),
                        ),
                        EmailTextField(controller: emailController),
                        PasswordTextField(controller: passwordController),
                        AuthButton(label: 'Login', onTap: () {}),
                        SizedBox(
                          width: 350.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forget Password?',
                                    style:
                                        CustomTextStyle.salsa(fontSize: 18.sp),
                                  ))
                            ],
                          ),
                        ),
                        HaveAccountButton(
                          question: 'Don\'t have Account?',
                          label: 'Sign Up',
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpView()));
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: Colors.black54,
                                height: 2.5.h,
                                width: 65.w,
                              ),
                              Text(
                                ' Continue with ',
                                style: CustomTextStyle.salsa(fontSize: 15.sp),
                              ),
                              Container(
                                color: Colors.black54,
                                height: 2.5.h,
                                width: 65.w,
                              )
                            ],
                          ),
                        ),
                        SocialButton(
                          onTap: () {},
                          image: 'search',
                          title: 'Google',
                        )
                      ]),
                )
              ],
            ),
          ),
        ));
  }
}
