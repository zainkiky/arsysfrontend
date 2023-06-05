import 'package:arsysfrontend/provider/ResearchProvider.dart';
import 'package:arsysfrontend/provider/ResearchReviewProvider.dart';
import 'package:arsysfrontend/theme.dart';
import 'package:arsysfrontend/widget/DrawerItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:arsysfrontend/widget/ResearchItem.dart';

class ResearchPage extends StatelessWidget {
  const ResearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String title = arguments['title'];

    final researchProvider = Provider.of<ResearchProvider>(context);
    final research = researchProvider.research;

    double width = MediaQuery.of(context).size.width;
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
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              for (var i = 0; i < research.length; i++)
                Consumer<ResearchReviewProvider>(
                    builder: (context, review, child) {
                  return GestureDetector(
                    onTap: () async {
                      await review.getResearchReview(research[i].id);
                      // print(research[i].id);
                      // print(review.rReview[0].firstName);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ResearchDialog(
                            width: width,
                            title: title,
                            researchProvider: researchProvider,
                            reviewProvider: review,
                            i: i,
                          );
                        },
                      );
                    },
                    child: ResearchItem(
                      width: width,
                      code: research[i].code,
                      rCode: research[i].researchCode,
                      rId: research[i].researchId == null
                          ? ""
                          : research[i].researchId!,
                      sFirstName: research[i].firstName,
                      sLastName: research[i].lastName,
                      title: research[i].title,
                      researchCode: research[i].researchCode,
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

class ResearchDialog extends StatelessWidget {
  const ResearchDialog({
    super.key,
    required this.width,
    required this.title,
    required this.researchProvider,
    required this.i,
    required this.reviewProvider,
  });

  final double width;
  final String title;
  final ResearchProvider researchProvider;
  final int i;
  final ResearchReviewProvider reviewProvider;

  @override
  Widget build(BuildContext context) {
    final research = researchProvider.research;
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      titlePadding: EdgeInsets.zero,
      title: Container(
        height: 40,
        width: width,
        decoration: BoxDecoration(
          color: redColor1,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: whiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      ),
      content: Container(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Judul",
            style: redTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          Text("${research[i].title}"),
          Text(
            "Peneliti",
            style: redTextStyle.copyWith(fontWeight: semiBold),
          ),
          Row(
            children: [
              Text(
                "${research[i].firstName} ",
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 14,
                ),
              ),
              Text(
                "${research[i].lastName}",
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 14,
                ),
              ),
              Spacer(),
              Text(
                "${research[i].code}",
                style: blackTextStyle.copyWith(
                  fontWeight: light,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Text(
            "Reviewer",
            style: redTextStyle.copyWith(fontWeight: semiBold),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (reviewProvider.rReview.length == 0)
                Text("-")
              else
                for (var i = 0; i < reviewProvider.rReview.length; i++)
                  Row(
                    children: [
                      Text(
                        "${reviewProvider.rReview[0].frontTitle} ",
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "${reviewProvider.rReview[0].firstName} ",
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "${reviewProvider.rReview[0].lastName} ",
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "${reviewProvider.rReview[0].rearTitle}",
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 14,
                        ),
                      ),
                      // Spacer(),
                      // Text(
                      //   "${review.rReview[0].nip}",
                      //   style: blackTextStyle.copyWith(
                      //     fontWeight: light,
                      //     fontSize: 12,
                      //   ),
                      // ),
                    ],
                  )
            ],
          )
        ],
      )),
    );
  }
}
