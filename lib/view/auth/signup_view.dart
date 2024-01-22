import 'package:flutter/material.dart';
import 'package:quick_chat/utils/api/api.dart';
import 'package:quick_chat/view/auth/login_view.dart';
import 'package:quick_chat/view/home.dart';
import 'package:quick_chat/widget/auth_widget.dart';
import 'package:quick_chat/utils/app_colors.dart';
import 'package:quick_chat/utils/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/widget/snack_bar.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signupButton() {
    setState(() {
      isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      API.auth
          .createUserWithEmailAndPassword(
              email: emailController.text.toString(),
              password: passwordController.text.toString())
          .then((value) {
        setState(() {
          isLoading = false;
        });
        successMessage(context, 'You have registered successfully');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomeView()));
      }).onError((error, stackTrace) {
        errorMessage(context, error.toString());
        setState(() {
          isLoading = false;
        });
      });
    } else {
      setState(() {});
      validatorErrorMessage(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.black,
        toolbarHeight: 0,
      ),
      backgroundColor: CustomColors.black,
      body: Container(
          height: MediaQuery.sizeOf(context).height * 1,
          width: MediaQuery.sizeOf(context).width * 1,
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: Text(
                              'Sign Up',
                              style: CustomTextStyle.salsa(fontSize: 35.sp),
                            ),
                          ),
                          NameTextField(controller: nameController),
                          EmailTextField(
                            controller: emailController,
                          ),
                          PasswordTextField(
                            controller: passwordController,
                          ),
                          isLoading == true
                              ? const CircularProgressIndicator(
                                  color: Colors.black,
                                )
                              : AuthButton(
                                  label: 'Sign Up',
                                  onTap: () {
                                    signupButton();
                                  }),
                          HaveAccountButton(
                            question: 'Already have Account?',
                            label: 'Login',
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginView()));
                            },
                          ),
                        ]),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
