import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '/Models/quiz_model.dart';

class QuizScoreItem extends StatelessWidget {
  final QuizModel quizModel;
  const QuizScoreItem({required this.quizModel,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 220.w,
      margin: EdgeInsets.symmetric(horizontal: 40.w,vertical: 20.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.circular(12)),
      child: Text("Previous Quiz Score:  ${quizModel.correctAnswersCounter}/${quizModel.numOfQuestions} ",style: GoogleFonts.poppins(
          color: Theme.of(context).indicatorColor,
          fontWeight: FontWeight.w700,
          fontSize: 18.sp)),
    );
  }
}
