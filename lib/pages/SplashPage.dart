import 'dart:async';

import 'package:arsysfrontend/provider/ProgramProvider.dart';
import 'package:arsysfrontend/provider/ResearchTypeProvider.dart';
import 'package:arsysfrontend/provider/StudentProvider.dart';
import 'package:arsysfrontend/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getProgram();
    getResearchType();
    getStudentCount();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, '/signin_page')
          .then((value) => setState(() {})),
    );

    super.initState();
  }

  getStudentCount() async {
    await Provider.of<StudentProvider>(context, listen: false)
        .getStudentCount();
  }

  getProgram() async {
    await Provider.of<ProgramProvider>(context, listen: false).getProgram();
  }

  getResearchType() async {
    await Provider.of<ResearchTypeProvider>(context, listen: false)
        .getResearchType();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 130,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Arsys App",
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                "V 1.0.0",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
