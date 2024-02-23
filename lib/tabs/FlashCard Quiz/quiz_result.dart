import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Models/quiz_model.dart';
import '../../Shared/firebase/firebase_functions.dart';
import '../../providers/my_provider.dart';

class QuizResult extends StatelessWidget {
  static const String routeName="QuizResult";


  const QuizResult({ super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as int;
    var pro = Provider.of<MyProvider>(context);
    return Container(
      height: 400.h,
      color: Theme.of(context).cardColor,
      child: Card(
        margin: EdgeInsets.only(top: 100.h),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Text(
              "Your Score: ${pro.quizScore}/$args",
              style: GoogleFonts.poppins(
                  color: Theme.of(context).indicatorColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 22.sp),
            ),
            SizedBox(
              height: 50.h,
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(150, 40))),
                onPressed: () {
                  Navigator.pop(context);
                  QuizModel quizModel=QuizModel(correctAnswersCounter: pro.quizScore, numOfQuestions: args);
                  FirebaseFunctions.addScore(quizModel);
                  pro.changeTotalNumOfCorrectAnswers(pro.quizScore);
                  pro.changeTotalNumOfQuestions(args);
                  pro.changeCurrentScore(pro.quizScore);
                  pro.changeCurrentNumOfQuestions(args);

                },
                child: Text(
                  "Done!",
                  style: GoogleFonts.poppins(
                      color: Theme.of(context).indicatorColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp),
                ))
          ],
        ),
      ),
    );
  }
}
