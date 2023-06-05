import 'package:arsysfrontend/provider/LoginProvider.dart';
import 'package:arsysfrontend/provider/StudentProvider.dart';
import 'package:arsysfrontend/provider/auth/AuthProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:arsysfrontend/theme.dart';
import 'package:provider/provider.dart';
import 'package:arsysfrontend/provider/ProgramProvider.dart';
import 'package:arsysfrontend/services/StudentServices.dart';

class SignInpage extends StatelessWidget {
  const SignInpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Provider.of<LoginProvider>(context, listen: false);
    final studentProvider = Provider.of<StudentProvider>(context);

    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Text('Exit App'),
              content: Text('Do you want to exit an App?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('No'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('Yes'),
                ),
              ],
            ),
          ) ??
          false;
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign In',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Sign In to Continue',
              style: greyTextStyle,
            ),
          ],
        ),
      );
    }

    Widget ssoInput() {
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SSO',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.key_rounded,
                      size: 26,
                      color: redColor1,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: blackTextStyle,
                        controller: loginController.ssoController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your SSO Account',
                          hintStyle: greyTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.lock_rounded,
                      color: redColor1,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        obscureText: true,
                        style: blackTextStyle,
                        controller: loginController.passwordController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Password',
                          hintStyle: greyTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget signinbutton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: Consumer<AuthProvider>(builder: (context, authProvider, child) {
          return TextButton(
            onPressed: ()
                // {
                //   print(Provider.of<StudentProvider>(context, listen: false)
                //       .student
                //       .length);
                // },
                async {
              int length = Provider.of<ProgramProvider>(context, listen: false)
                  .program
                  .length;
              await Provider.of<StudentProvider>(context, listen: false)
                  .getStudentCountProgram(length);
              if (await authProvider.login(
                sso: loginController.ssoController.text,
                password: loginController.passwordController.text,
              )) {
                Navigator.pushNamed(context, '/home_page');
                loginController.clear();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(
                      'Signin Failed',
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
            },
            style: TextButton.styleFrom(
              backgroundColor: redColor1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Sign In',
              style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
          );
        }),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account? ',
              style: greyTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/signup_page');
              },
              child: Text(
                'Sign Up',
                style: redTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return WillPopScope(
      onWillPop: showExitPopup, //call function on back button press
      child: Scaffold(
        backgroundColor: backgroundColor1,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                ssoInput(),
                passwordInput(),
                // isLoading ? LoadingButton() :
                signinbutton(),
                Spacer(),
                footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
