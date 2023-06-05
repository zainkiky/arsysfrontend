import 'package:arsysfrontend/provider/SupervisorProvider.dart';
import 'package:arsysfrontend/theme.dart';
import 'package:arsysfrontend/widget/DrawerItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupervisorPage extends StatelessWidget {
  const SupervisorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String title = arguments['title'];

    final supervisorProvider = Provider.of<SupervisorProvider>(context);

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
          child: ListView.builder(
            itemCount: supervisorProvider.supervisor.length,
            itemBuilder: (context, index) {
              final supervisor = supervisorProvider.supervisor[index];
              return ListTile(
                title: Row(
                  children: [
                    supervisor.frontTitle == null
                        ? Text("")
                        : Text("${supervisor.frontTitle} "),
                    Text("${supervisor.firstName} "),
                    Text("${supervisor.lastName} "),
                    Text("${supervisor.rearTitle}"),
                  ],
                ),
                subtitle: Text("${supervisor.nip}"),
              );
            },
          ),
        ),
      ),
    );
  }
}
