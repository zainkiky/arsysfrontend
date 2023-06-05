import 'package:arsysfrontend/model/user.dart';
import 'package:arsysfrontend/provider/ProgramProvider.dart';
import 'package:arsysfrontend/provider/ResearchProvider.dart';
import 'package:arsysfrontend/provider/ResearchTypeProvider.dart';
import 'package:arsysfrontend/provider/SupervisorProvider.dart';
import 'package:arsysfrontend/theme.dart';
import 'package:flutter/material.dart';
import 'package:arsysfrontend/provider/auth/AuthProvider.dart';
import 'package:provider/provider.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    double width = MediaQuery.of(context).size.width;

    Widget listTileItem(
      String? description,
    ) {
      return ListTile(
        onTap: () async {
          await Provider.of<ResearchProvider>(context, listen: false)
              .getresearch(description);
          Navigator.pushNamed(
            context,
            '/research_page',
            arguments: {
              "title": description,
            },
          );
        },
        title: Text(
          description!,
          style: TextStyle(
            color: redColor2,
            fontSize: 16,
          ),
        ),
      );
    }

    Widget listTileItem1(
      String? abbrev,
      String? title,
    ) {
      return ListTile(
        onTap: () async {
          await Provider.of<SupervisorProvider>(context, listen: false)
              .getSupervisor(abbrev);
          Navigator.pushNamed(
            context,
            '/supervisor_page',
            arguments: {
              "title": title,
            },
          );
        },
        title: Text(
          abbrev!,
          style: TextStyle(
            color: redColor2,
            fontSize: 16,
          ),
        ),
      );
    }

    Widget ListviewItem(
      String title,
      Icon icoon,
      double bottom,
    ) {
      return Container(
        margin: EdgeInsets.only(bottom: bottom, left: 38),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: redColor1,
                shape: BoxShape.circle,
              ),
              child: icoon,
            ),
            SizedBox(
              width: 22,
            ),
            Text(
              title,
              style: TextStyle(
                color: redColor2,
                fontSize: 19,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      );
    }

    return Drawer(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: redColor3,
              // image: DecorationImage(
              //   colorFilter: ColorFilter.mode(
              //       Colors.black.withOpacity(0.3), BlendMode.dstATop),
              //   image: NetworkImage(
              //       'https://i.pinimg.com/564x/91/6c/24/916c24fbc16faed523d252459de3eafe.jpg'),
              //   fit: BoxFit.cover,
              // ),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/profile_page');
              },
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 53, bottom: 8),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: greyColor,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.dstATop),
                        image: NetworkImage('${user.profilePhotoUrl}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    "${user.name}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "${user.email}",
                    style: TextStyle(color: Colors.white54, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(18),
              ),
            ),
            child: Stack(
              children: [
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 32,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/home_page');
                          },
                          child: ListviewItem(
                            "Prodi",
                            Icon(
                              Icons.dashboard_rounded,
                              color: whiteColor,
                            ),
                            32,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            authProvider.onToggle();
                            print(Provider.of<ResearchTypeProvider>(context,
                                    listen: false)
                                .rType
                                .length);
                          },
                          child: ListviewItem(
                              "Research",
                              Icon(
                                Icons.book_rounded,
                                color: whiteColor,
                              ),
                              authProvider.toggle ? 32 : 0),
                        ),
                        AnimatedContainer(
                          margin: EdgeInsets.only(
                              left: authProvider.toggle ? 0 : 70),
                          duration: Duration(milliseconds: 700),
                          curve: Curves.easeInOut,
                          width: width,
                          child: Visibility(
                            visible: authProvider.toggle ? false : true,
                            child: Consumer<ResearchTypeProvider>(
                              builder: (context, research, child) {
                                return Column(children: [
                                  for (var i = 0;
                                      i < research.rType.length;
                                      i++)
                                    listTileItem(
                                      research.rType[i].description,
                                    ),
                                ]);
                              },
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            authProvider.onToggle1();
                          },
                          child: ListviewItem(
                              "Dosen",
                              Icon(
                                Icons.school_rounded,
                                color: whiteColor,
                              ),
                              authProvider.toggle1 ? 32 : 0),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 700),
                          margin: EdgeInsets.only(
                              left: authProvider.toggle1 ? 0 : 70),
                          curve: Curves.easeInOut,
                          width: width,
                          child: Visibility(
                            visible: authProvider.toggle1 ? false : true,
                            child: Consumer<ProgramProvider>(
                              builder: (context, program, child) {
                                return Column(children: [
                                  for (var i = 0;
                                      i < program.program.length;
                                      i++)
                                    listTileItem1(
                                      program.program[i].abbrev,
                                      program.program[i].description,
                                    ),
                                ]);
                              },
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/profile_page');
                          },
                          child: ListviewItem(
                            "Profile",
                            Icon(
                              Icons.person,
                              color: whiteColor,
                              size: 28,
                            ),
                            0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: width,
                    color: whiteColor,
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                      child: Consumer<AuthProvider>(
                          builder: (context, authProvider, child) {
                        return TextButton(
                          onPressed: () {
                            authProvider.logout(user.token!, context);
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: blackColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Sign Out',
                            style: whiteTextStyle.copyWith(
                                fontSize: 16, fontWeight: medium),
                          ),
                        );
                      }),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
