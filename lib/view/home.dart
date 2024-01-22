import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/utils/app_colors.dart';
import 'package:quick_chat/utils/app_text_style.dart';
import 'package:quick_chat/widget/chat_user_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.h,
        backgroundColor: CustomColors.black,
        centerTitle: true,
        title: Text(
          'Quick Chat',
          style:
              CustomTextStyle.salsa(fontSize: 22.sp, color: CustomColors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: CustomColors.white,
                size: 25.sp,
              )),
          PopupMenuButton(
            position: PopupMenuPosition.under,
            color: CustomColors.black,
            itemBuilder: (context) => [
              PopupMenuItem(
                  onTap: () {},
                  child: Text(
                    'Logout',
                    style: CustomTextStyle.salsa(
                        fontSize: 18.sp, color: CustomColors.white),
                  ))
            ],
            child: Icon(
              Icons.more_vert_rounded,
              color: CustomColors.white,
              size: 25.sp,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
        backgroundColor: CustomColors.black,
        onPressed: () {},
        child: Icon(
          Icons.sms_rounded,
          color: CustomColors.white,
          size: 25.sp,
        ),
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 30,
          itemBuilder: (context, index) {
            return const ChatUserCard();
          }),
    );
  }
}
