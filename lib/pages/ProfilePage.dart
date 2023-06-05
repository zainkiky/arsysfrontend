import 'package:arsysfrontend/model/user.dart';
import 'package:arsysfrontend/provider/ProfileProvider.dart';
import 'package:arsysfrontend/provider/RegisterProvider.dart';
import 'package:arsysfrontend/provider/auth/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:arsysfrontend/theme.dart';
import 'package:provider/provider.dart';
import 'package:arsysfrontend/widget/Painter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileProvider profileController = Provider.of<ProfileProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    UserModel user = authProvider.user;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    AppBar header() {
      return AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: backgroundColor1,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/home_page');
          },
        ),
        backgroundColor: redColor3,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: whiteTextStyle,
        ),
        actions: [
          Consumer<AuthProvider>(builder: (context, authProvider, child) {
            return IconButton(
              icon: Icon(
                Icons.check,
                color: backgroundColor1,
              ),
              onPressed: () async {
                await authProvider.update(
                  name: profileController.nameController.text,
                  email: profileController.emailController.text,
                  token: authProvider.user.token,
                );
                user.name = profileController.nameController.text;
                user.email = profileController.emailController.text;
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     backgroundColor: Colors.red,
                //     content: Text(
                //       'Profile updated',
                //       textAlign: TextAlign.center,
                //     ),
                //   ),
                // );
              },
            );
          })
        ],
      );
    }

    Widget ssoInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SSO',
              style: redTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              enabled: false,
              style: blackTextStyle,
              decoration: InputDecoration(
                hintText: user.sso,
                hintStyle: blackTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: greyColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: redTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              style: blackTextStyle,
              controller: profileController.nameController,
              decoration: InputDecoration(
                hintText: user.name,
                hintStyle: blackTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: greyColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: redTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: profileController.emailController,
              style: blackTextStyle,
              decoration: InputDecoration(
                hintText: user.email,
                hintStyle: blackTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: greyColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 400,
              child: CustomPaint(
                size: Size(width, (width * 0.625).toDouble()),
                painter: RPSCustomPainter(),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 15,
                    ),
                    decoration: BoxDecoration(
                      color: greyColor,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          user.profilePhotoUrl!,
                        ),
                      ),
                    ),
                  ),
                  ssoInput(),
                  nameInput(),
                  emailInput(),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: header(),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
