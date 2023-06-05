import 'package:arsysfrontend/provider/ResearchProvider.dart';
import 'package:arsysfrontend/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResearchItem extends StatelessWidget {
  ResearchItem({
    super.key,
    required this.width,
    required this.title,
    required this.researchCode,
    required this.sFirstName,
    required this.sLastName,
    required this.rId,
    required this.rCode,
    required this.code,
  });

  final double width;
  final String title;
  final String researchCode;
  final String sFirstName;
  final String sLastName;
  final String rId;
  final String rCode;
  final String code;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      width: width,
      transformAlignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xff333333),
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            backgroundColor1,
            backgroundColor2,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xff020202),
            offset: Offset(8.7, 8.7),
            blurRadius: 21,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      rCode,
                      style: greyTextStyle.copyWith(fontWeight: semiBold),
                    ),
                    Spacer(),
                    Text(
                      rId,
                      style: greyTextStyle.copyWith(fontWeight: semiBold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        "${title}",
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Visibility(
              visible: false,
              child: Column(
                children: [
                  Text(
                    "Researcher",
                    style: redTextStyle.copyWith(fontWeight: light),
                  ),
                  Row(
                    children: [
                      Text(
                        "${sFirstName} ",
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "${sLastName}",
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 12,
                        ),
                      ),
                      Spacer(),
                      Text(
                        code,
                        style: blackTextStyle.copyWith(
                          fontWeight: light,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Reviewer",
                    style: redTextStyle.copyWith(fontWeight: light),
                  ),
                  Row(
                    children: [
                      Text(
                        "Vena Febrina",
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 12,
                        ),
                      ),
                      Spacer(),
                      Text(
                        researchCode,
                        style: blackTextStyle.copyWith(
                          fontWeight: light,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Vena Febrina",
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 12,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "s1701017",
                        style: blackTextStyle.copyWith(
                          fontWeight: light,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
