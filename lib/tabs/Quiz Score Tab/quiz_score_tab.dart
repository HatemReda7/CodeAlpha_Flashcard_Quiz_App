import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '/Models/quiz_model.dart';
import '/tabs/Quiz%20Score%20Tab/quiz_score_item.dart';
import 'package:provider/provider.dart';
import '../../Shared/firebase/firebase_functions.dart';
import '../../providers/my_provider.dart';

class QuizScoreTab extends StatelessWidget {
  static const String routeName = "Quiz Score Tab";

  const QuizScoreTab({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Center(
                    child: Container(
                      height: 80.h,
                      width: 250.w,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                                "Are you sure you want to delete all scores?",
                                textAlign: TextAlign.center),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    FirebaseFunctions.deleteQuizCollection();
                                      pro.totalNumOfQuestions=0;
                                      pro.totalNumOfCorrectAnswers=0;
                                      Navigator.pop(context);
                                  },
                                  child: Container(
                                      height: 25.837.h,
                                      alignment: Alignment.center,
                                      color: Colors.blue,
                                      child: const Text(
                                        "Yes!",
                                        style: TextStyle(color: Colors.black),
                                      )),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      height: 25.837.h,
                                      alignment: Alignment.center,
                                      color: Colors.red,
                                      child: const Text(
                                        "No!",
                                        style: TextStyle(color: Colors.black),
                                      )),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: Container(
            height: 40.h,
            width: 220.w,
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: 20.h,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: Colors.red),
            child: Text(
              "Delete all scores!",
              style: GoogleFonts.poppins(
                  color: Theme.of(context).indicatorColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp),
            ),
          ),
        ),
        Container(
          height: 175.h,
          width: 300.w,
          padding: EdgeInsets.all(10.r),
          margin: EdgeInsets.symmetric(vertical: 25.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Current Score:  ${pro.quizScore}/${pro.numOfQuestions} ",
                  style: GoogleFonts.poppins(
                      color: Theme.of(context).indicatorColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp)),
              SizedBox(
                height: 10.h,
              ),
              Text(
                  "Total Number Of Correct Answers:  ${pro.totalNumOfCorrectAnswers} ",
                  style: GoogleFonts.poppins(
                      color: Theme.of(context).indicatorColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp)),
              SizedBox(
                height: 10.h,
              ),
              Text("Total Number Of Questions:  ${pro.totalNumOfQuestions} ",
                  style: GoogleFonts.poppins(
                      color: Theme.of(context).indicatorColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp)),
            ],
          ),
        ),
        StreamBuilder(
          stream: FirebaseFunctions.getQuizzes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(
                  child: Text(
                "Something went wrong",
                style: TextStyle(color: Colors.white),
              ));
            }
            List<QuizModel> quizzes =
                snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return QuizScoreItem(
                    quizModel: quizzes[index],
                  );
                },
                itemCount: quizzes.length,
              ),
            );
          },
        ),
      ],
    );
  }
}
