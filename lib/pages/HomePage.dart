import 'package:arsysfrontend/provider/ProgramProvider.dart';
import 'package:arsysfrontend/provider/SpecializationPivotProvider.dart';
import 'package:arsysfrontend/provider/StudentProvider.dart';
import 'package:arsysfrontend/provider/auth/AuthProvider.dart';
import 'package:arsysfrontend/widget/Item.dart';
import 'package:arsysfrontend/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:arsysfrontend/widget/DrawerItem.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final programProvider = Provider.of<ProgramProvider>(context);
    final pivotProvider = Provider.of<SpecializationPivotProvider>(context);

    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) =>
                Consumer<AuthProvider>(builder: (context, authProvider, child) {
              return CupertinoAlertDialog(
                title: Text('Log out'),
                content: Text('Do you want to Log out?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('No'),
                  ),
                  TextButton(
                    onPressed: () {
                      authProvider.logout(authProvider.user.token!, context);
                      Navigator.of(context).pop(true);
                    },
                    child: Text('Yes'),
                  ),
                ],
              );
            }),
          ) ??
          false;
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        backgroundColor: backgroundColor1,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "Arsys Prodi",
            style: TextStyle(color: blackColor),
          ),
          iconTheme: IconThemeData(color: blackColor),
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.format_list_bulleted_sharp),
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: backgroundColor1,
        ),
        drawer: DrawerItem(),
        body: SafeArea(
          child: Container(
            color: backgroundColor1,
            margin: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              children: [
                for (var i = 0; i < programProvider.program.length; i++)
                  Consumer<StudentProvider>(
                    builder: (context, student, child) {
                      return GestureDetector(
                        onTap: () async {
                          await Provider.of<SpecializationPivotProvider>(
                                  context,
                                  listen: false)
                              .getSpecializationPivot(
                                  programProvider.program[i].id);
                          await Provider.of<StudentProvider>(context,
                                  listen: false)
                              .getStudentCountProgramSpecialization(
                                  pivotProvider.specializationPivot.length,
                                  programProvider.program[i].id);
                          var proProv = programProvider.program[i];
                          // print(pivotProvider.specializationPivot.length);
                          // print(proProv.id);
                          Navigator.pushNamed(
                            context,
                            '/specialization_page',
                            arguments: {
                              "id": proProv.id,
                              "title": proProv.description,
                              "siswa": student.studentCountProgramList[i],
                            },
                          );
                        },
                        child: Item(
                          title: "Program Pendidikan",
                          abbrev: "${programProvider.program[i].abbrev}",
                          code: "${programProvider.program[i].code}",
                          description:
                              "${programProvider.program[i].description}",
                          percent: student.studentCountProgramList[i] /
                              student.studentCount,
                          siswa: student.studentCount,
                          siswaItem: student.studentCountProgramList[i],
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
