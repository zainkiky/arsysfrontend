import 'package:arsysfrontend/provider/ProgramProvider.dart';
import 'package:arsysfrontend/provider/SpecializationPivotProvider.dart';
import 'package:arsysfrontend/provider/StudentProvider.dart';
import 'package:arsysfrontend/widget/Item.dart';
import 'package:arsysfrontend/theme.dart';
import 'package:flutter/material.dart';
import 'package:arsysfrontend/widget/DrawerItem.dart';
import 'package:provider/provider.dart';

class SpecializationPage extends StatelessWidget {
  const SpecializationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int id = arguments['id'];
    final String title = arguments['title'];
    final int siswa = arguments['siswa'];

    final spivotProvider = Provider.of<SpecializationPivotProvider>(context);

    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          title,
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
              for (var i = 0;
                  i < spivotProvider.specializationPivot.length;
                  i++)
                Consumer<StudentProvider>(builder: (context, student, child) {
                  return GestureDetector(
                    onTap: () async {
                      await Provider.of<StudentProvider>(context, listen: false)
                          .getStudent(
                        id,
                        spivotProvider.specializationPivot[i].specialization.id,
                      );
                      // print(Provider.of<StudentProvider>(context, listen: false)
                      //     .student
                      //     .length);
                      // print(
                      //   spivotProvider.specializationPivot[i].specialization.id,
                      // );
                      Navigator.pushNamed(context, '/student_page');
                    },
                    child: Item(
                      title: "Konsentrasi",
                      code: "",
                      abbrev: spivotProvider
                          .specializationPivot[i].specialization.abbrev,
                      description: spivotProvider
                          .specializationPivot[i].specialization.description,
                      percent: student.studentCountProgramSpList[i] / siswa,
                      siswa: siswa,
                      siswaItem: student.studentCountProgramSpList[i],
                    ),
                  );
                }),
            ],
          ),
        ),
      ),
    );
  }
}
