import 'package:arsysfrontend/provider/StudentProvider.dart';
import 'package:arsysfrontend/theme.dart';
import 'package:flutter/material.dart';

import 'package:arsysfrontend/widget/DrawerItem.dart';
import 'package:provider/provider.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);
    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Student",
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
          child: ListView.builder(
            itemCount: studentProvider.student.length,
            itemBuilder: (context, index) {
              final student = studentProvider.student[index];
              return ListTile(
                title: Row(
                  children: [
                    Text("${student.firstName} "),
                    Text("${student.lastName}"),
                  ],
                ),
                subtitle: Text("${student.code}"),
              );
            },
          ),
        ),
      ),
    );
  }
}
