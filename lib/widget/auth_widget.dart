import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/utils/app_colors.dart';
import 'package:quick_chat/utils/app_text_style.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  const EmailTextField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: CustomTextStyle.salsa(fontSize: 22.sp),
          ),
          TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please fill your email';
                } else if (value.isValidEmail() == false) {
                  return 'in Valid Email';
                } else if (value.isValidEmail() == true) {
                  return null;
                }
                return null;
              },
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your email',
                  hintStyle: CustomTextStyle.salsa(fontSize: 15.sp),
                  suffixIcon: Icon(
                    Icons.alternate_email_rounded,
                    size: 20.sp,
                    color: CustomColors.black,
                  )))
        ],
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordTextField({
    super.key,
    required this.controller,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: 340.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: CustomTextStyle.salsa(fontSize: 22.sp),
            ),
            TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please fill your Password';
                  }
                  return null;
                },
                controller: widget.controller,
                obscureText: passwordVisible,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your Password',
                    hintStyle: CustomTextStyle.salsa(fontSize: 15.sp),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                        icon: Icon(
                          passwordVisible
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded,
                          size: 20.sp,
                          color: CustomColors.black,
                        ))))
          ],
        ),
      ),
    );
  }
}

class NameTextField extends StatelessWidget {
  final TextEditingController controller;
  const NameTextField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Full Name',
            style: CustomTextStyle.salsa(fontSize: 22.sp),
          ),
          TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter your full name';
                }
                return null;
              },
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'please fill full name',
                hintStyle: CustomTextStyle.salsa(fontSize: 15.sp),
              ))
        ],
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  final Function() onTap;
  final String label;
  const AuthButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 7.h),
        height: 45.h,
        width: 300.w,
        decoration: BoxDecoration(
            color: CustomColors.black,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
                topRight: Radius.circular(5))),
        child: Center(
          child: Text(
            label,
            style: CustomTextStyle.salsa(
                fontSize: 23.sp, color: CustomColors.white),
          ),
        ),
      ),
    );
  }
}

class HaveAccountButton extends StatelessWidget {
  final Function() onTap;
  final String question;
  final String label;
  const HaveAccountButton({
    super.key,
    required this.question,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            question,
            style: CustomTextStyle.salsa(fontSize: 18.sp),
          ),
          TextButton(
            onPressed: onTap,
            child: Text(
              label,
              style: CustomTextStyle.salsa(fontSize: 22.sp),
            ),
          )
        ],
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final Function() onTap;
  final String image;
  final String title;
  const SocialButton({
    super.key,
    required this.onTap,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45.h,
        width: 300.w,
        decoration: BoxDecoration(
            color: CustomColors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
                topRight: Radius.circular(5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              child: Image.asset(
                'assets/image/$image.png',
                height: 35.w,
                width: 35.w,
              ),
            ),
            Text(
              'Continue with $title',
              style: CustomTextStyle.salsa(
                  fontSize: 20.sp, color: CustomColors.black),
            ),
          ],
        ),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^([a-zA-Z0-9]+)([\_\-\.]*)([a-zA-Z0-9]*)([@])([a-zA-Z0-9]{2,})([\.])([a-zA-z]{2,})$')
        .hasMatch(this);
  }
}
