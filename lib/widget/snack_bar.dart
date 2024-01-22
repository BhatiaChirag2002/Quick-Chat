import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/utils/app_text_style.dart';

successMessage(BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.transparent,
      content: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
        height: 75.h,
        width: 350.w,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Icon(
              Icons.check_circle_outline_rounded,
              color: Colors.white,
              size: 50.sp,
            ),
            const SizedBox(
              width: 9,
            ),
            SizedBox(
              width: 250.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Success',
                    style: CustomTextStyle.merriweatherSans(
                        fontSize: 18.sp, weight: FontWeight.w800),
                  ),
                  const Spacer(),
                  Text(
                    message,
                    style: CustomTextStyle.merriweatherSans(
                        fontSize: 16.sp, weight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      )));
}

errorMessage(BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.transparent,
      content: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
        height: 75.h,
        width: 350.w,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Icon(
              Icons.error_outline_rounded,
              color: Colors.white,
              size: 50.sp,
            ),
            const SizedBox(
              width: 9,
            ),
            SizedBox(
              width: 250.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Opps. An Error Occured',
                    style: CustomTextStyle.merriweatherSans(
                        fontSize: 18.sp, weight: FontWeight.w800),
                  ),
                  const Spacer(),
                  Text(
                    message,
                    style: CustomTextStyle.merriweatherSans(
                        fontSize: 16.sp, weight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      )));
}

validatorErrorMessage(BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.transparent,
      content: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
        height: 60.h,
        width: 350.w,
        decoration: BoxDecoration(
            color: Colors.redAccent, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Icon(
              Icons.error_outline_rounded,
              color: Colors.white,
              size: 50.sp,
            ),
            const SizedBox(
              width: 9,
            ),
            SizedBox(
              width: 250.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Opps',
                    style: CustomTextStyle.merriweatherSans(
                        fontSize: 18.sp, weight: FontWeight.w800),
                  ),
                  const Spacer(),
                  Text(
                    'please fill all fields',
                    style: CustomTextStyle.merriweatherSans(
                        fontSize: 16.sp, weight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      )));
}
