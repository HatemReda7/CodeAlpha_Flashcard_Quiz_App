import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '/Models/question_model.dart';
import '../../Shared/firebase/firebase_functions.dart';
import 'quiz_item.dart';
import 'quiz_result.dart';

class QuizTab extends StatefulWidget {
  static const String routeName="QuizTab";
  const QuizTab({super.key});

  @override
  State<QuizTab> createState() => _QuizTabState();
}

class _QuizTabState extends State<QuizTab> {
  int numberOfQuestions=0;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      elevation: 0,
      child: Column(
        children: [
          StreamBuilder(stream: FirebaseFunctions.getQuestion(),
            builder: (context, snapshot) {
              List<QuestionModel> questions = snapshot.data?.docs.map((e) => e.data())
                  .toList() ?? [];
              numberOfQuestions=questions.length;
              return Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: QuizItem(question: questions[index],index: index,),
                  );
                }, itemCount: questions.length,),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: () {
              Navigator.pushReplacementNamed(context, QuizResult.routeName,arguments: numberOfQuestions);
            },
                style: const ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(200, 40))),
                child: Text("Finish Quiz",style: GoogleFonts.poppins(
                    color: Theme.of(context).indicatorColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp),)),
          )
        ],
      ),
    );
  }
}
