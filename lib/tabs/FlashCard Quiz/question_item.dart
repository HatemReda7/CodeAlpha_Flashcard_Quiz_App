import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../Models/question_model.dart';
import '../../Shared/firebase/firebase_functions.dart';

class QuestionItem extends StatelessWidget {
  final QuestionModel question;

  const QuestionItem({required this.question, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 8.h),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        child: Slidable(
          startActionPane: ActionPane(motion: const ScrollMotion(), children: [
            SlidableAction(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  bottomLeft: Radius.circular(15.r)),
              onPressed: (context) {
                FirebaseFunctions.deleteQuestion(question.id);
              },
              backgroundColor: const Color(0xffEC4B4B),
              icon: Icons.delete,
              label: "Delete",
            ),
          ]),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
            child: Row(
              children: [
                Container(
                  height: 62.h,
                  width: 4.w,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question.question,
                      style: GoogleFonts.poppins(
                          color: Colors.blue,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      question.answer,
                      style: GoogleFonts.poppins(
                          color: Colors.blue,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
