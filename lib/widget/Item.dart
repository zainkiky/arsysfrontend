import 'package:arsysfrontend/theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.title,
    required this.code,
    required this.abbrev,
    required this.description,
    required this.percent,
    required this.siswa,
    required this.siswaItem,
  }) : super(key: key);

  final String title;
  final String code;
  final String abbrev;
  final String description;
  final double percent;
  final int siswa;
  final int siswaItem;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(vertical: 8),
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
            margin: EdgeInsets.only(
              left: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: greyTextStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  abbrev,
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 26,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        description,
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Text(
                        code,
                        style: greyTextStyle.copyWith(
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
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 9, bottom: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "${(siswaItem / siswa) * 100} %".substring(0, 4),
                        style: redTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        " %",
                        style: redTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                LinearPercentIndicator(
                  lineHeight: 7,
                  animation: true,
                  animationDuration: 500,
                  percent: percent,
                  backgroundColor: greyColor,
                  progressColor: redColor2,
                  barRadius: Radius.circular(10),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Text(
                "${siswaItem}",
                style: redTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 12,
                ),
              ),
              Text(
                " dari ",
                style: redTextStyle.copyWith(
                  fontWeight: light,
                  fontSize: 12,
                ),
              ),
              Text(
                "${siswa} ",
                style: redTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 12,
                ),
              ),
              Text(
                "Siswa",
                style: redTextStyle.copyWith(
                  fontWeight: light,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
