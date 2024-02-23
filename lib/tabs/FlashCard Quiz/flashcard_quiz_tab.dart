import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '/tabs/FlashCard%20Quiz/quiz_tab.dart';
import 'package:provider/provider.dart';
import '../../Models/question_model.dart';
import '../../Shared/firebase/firebase_functions.dart';
import '../../Shared/styles/colors.dart';
import '../../providers/my_provider.dart';
import 'question_item.dart';

class FlashCardQuizTab extends StatefulWidget {
  static const String routeName="To DO List Tab";

  const FlashCardQuizTab({super.key});

  @override
  State<FlashCardQuizTab> createState() => _FlashCardQuizTabState();
}

class _FlashCardQuizTabState extends State<FlashCardQuizTab> {

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.w),
          height: 100.h,
          width: double.infinity,
          color: primary,
          child: Column(
            children: [
              Text("Flash Card Quiz", style: GoogleFonts.poppins(color: Theme
                  .of(context)
                  .shadowColor,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,),),
              SizedBox(height: 5.h,),
              ElevatedButton(onPressed: () {
                pro.quizScore=0;
                Navigator.pushNamed(context, QuizTab.routeName);
              },
                  style: const ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(200, 40))),
                  child: Text("Take Quiz!",style: GoogleFonts.poppins(
                  color: Theme.of(context).indicatorColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp),))
            ],
          ),
        ),
        StreamBuilder(stream: FirebaseFunctions.getQuestion(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text("Something went wrong",
                style: TextStyle(color: Colors.white),));
            }
            List<QuestionModel> questions = snapshot.data?.docs.map((e) => e.data())
                .toList() ?? [];
            return Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return QuestionItem(question: questions[index],);
              }, itemCount: questions.length,),
            );
          },
        )
      ],
    );
  }
}
