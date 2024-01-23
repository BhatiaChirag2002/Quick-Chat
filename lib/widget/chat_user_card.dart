import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/model/chat_user_model.dart';
import 'package:quick_chat/utils/app_colors.dart';
import 'package:quick_chat/utils/app_text_style.dart';

class ChatUserCard extends StatefulWidget {
  final ChatUserModel user;
  const ChatUserCard({super.key, required this.user});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      child: InkWell(
          onTap: () {},
          child: ListTile(
            leading: CircleAvatar(
              radius: 21.r,
              backgroundColor: CustomColors.black,
              child: Icon(
                Icons.person,
                color: CustomColors.white,
                size: 30.sp,
              ),
            ),
            title: Text(
              '${widget.user.name}',
              style: CustomTextStyle.salsa(fontSize: 20.sp),
            ),
            subtitle: Text(
              '${widget.user.about}',
              style: CustomTextStyle.salsa(fontSize: 13.sp),
              maxLines: 1,
            ),
            trailing: Text(
              '12:00 PM',
              style: CustomTextStyle.salsa(fontSize: 12.sp),
            ),
          )),
    );
  }
}
