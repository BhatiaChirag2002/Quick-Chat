import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/model/chat_user_model.dart';
import 'package:quick_chat/utils/api/api.dart';
import 'package:quick_chat/utils/app_colors.dart';
import 'package:quick_chat/utils/app_text_style.dart';
import 'package:quick_chat/view/auth/login_screen.dart';
import 'package:quick_chat/widget/chat_user_card.dart';
import 'package:quick_chat/widget/snack_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void logoutButton() {
    API.auth.signOut().then((value) {
      successMessage(context, 'Logout Successfully');
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }).onError((error, stackTrace) {
      errorMessage(context, error.toString());
    });
  }

  List<ChatUserModel> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50.h,
          backgroundColor: CustomColors.black,
          centerTitle: true,
          title: Text(
            'Quick Chat',
            style: CustomTextStyle.salsa(
                fontSize: 22.sp, color: CustomColors.white),
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
                    onTap: () {
                      logoutButton();
                    },
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
        body: StreamBuilder(
          stream: API.firestore.collection('users').snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return Center(
                  child: CircularProgressIndicator(color: CustomColors.black),
                );
              case ConnectionState.active:
              case ConnectionState.done:
                final data = snapshot.data?.docs;
                list = data
                        ?.map((e) => ChatUserModel.fromJson(e.data()))
                        .toList() ??
                    [];
                if (list.isNotEmpty) {
                  return ListView.builder(
                      itemCount: list.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ChatUserCard(user: list[index]);
                      });
                } else {
                  return Center(
                    child: Text(
                      'No Connections Found!',
                      style: CustomTextStyle.merriweatherSans(
                          fontSize: 20.sp, weight: FontWeight.w500),
                    ),
                  );
                }
            }
          },
        ));
  }
}
