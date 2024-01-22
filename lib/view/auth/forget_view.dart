import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/utils/app_colors.dart';
import 'package:quick_chat/utils/app_text_style.dart';
import 'package:quick_chat/widget/auth_widget.dart';

class ForgetView extends StatefulWidget {
  const ForgetView({super.key});

  @override
  State<ForgetView> createState() => _ForgetViewState();
}

class _ForgetViewState extends State<ForgetView> {
  final emailController = TextEditingController();
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: CustomColors.white,
                            size: 22.sp,
                          )),
                    ),
                    Container(
                      height: 90.h,
                      width: 90.h,
                      margin: EdgeInsets.symmetric(
                          vertical: 27.9.h, horizontal: 89.w),
                      child: Image.asset(
                        'assets/image/quickly.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
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
                            'Forget Password',
                            style: CustomTextStyle.salsa(fontSize: 35.sp),
                          ),
                        ),
                        EmailTextField(
                          controller: emailController,
                        ),
                        AuthButton(label: 'Forget', onTap: () {}),
                      ]),
                )
              ],
            ),
          ),
        ));
  }
}
