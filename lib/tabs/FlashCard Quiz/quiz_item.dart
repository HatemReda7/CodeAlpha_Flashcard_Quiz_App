import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '/Models/question_model.dart';
import 'package:provider/provider.dart';
import '../../Shared/styles/colors.dart';
import '../../providers/my_provider.dart';

class QuizItem extends StatefulWidget {
  final QuestionModel question;
  final int index;
  final bool isCorrect;
  const QuizItem({super.key, required this.question,required this.index,this.isCorrect=false});

  @override
  State<QuizItem> createState() => _QuizItemState();
}

class _QuizItemState extends State<QuizItem> {
  var answerController = TextEditingController();
  bool answered=false;
  bool correctAnswer=false;
  bool wrongAnswer=false;

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text("${widget.index+1})  ${widget.question.question}",style: GoogleFonts.poppins(
                  color: Theme.of(context).indicatorColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp),),
              const Spacer(),
              correctAnswer?Icon(Icons.check,color:Colors.green,size: 35.sp,):const SizedBox.shrink(),
              wrongAnswer? Icon(Icons.clear_rounded,color: Colors.red,size: 35.sp,):const SizedBox.shrink()
            ],
          ),
          SizedBox(height: 15.h,),
          answered?Column(
            children: [
              Text("Your Answer:  ${answerController.text}",style: GoogleFonts.poppins(
                  color: correctAnswer? Colors.green: wrongAnswer?Colors.red: Theme.of(context).indicatorColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp)),
              Text("Correct Answer:  ${widget.question.answer}",style: GoogleFonts.poppins(
                  color: Theme.of(context).indicatorColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp)),
            ],
          ): TextFormField(
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (value) {
              if(value.toLowerCase() == widget.question.answer.toLowerCase()){
                correctAnswer=true;
                answered=true;
                wrongAnswer=false;
                pro.quizScore+=1;
              }
              else if(value.toLowerCase() != widget.question.answer.toLowerCase()){
                wrongAnswer=true;
                answered=true;
                correctAnswer=false;
              }
              setState(() {

              });
            },
            style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp),
            controller: answerController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: correctAnswer? Colors.green: wrongAnswer? Colors.red: primary,width: 2.w),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: primary),
              ),
              hintText: "Answer Here",
              hintStyle: GoogleFonts.inter(
                  color: const Color(0xffA9A9A9).withOpacity(.61),
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp),
            ),
          ),
          SizedBox(height: 10.h,)
        ],
      ),
    );
  }
}
