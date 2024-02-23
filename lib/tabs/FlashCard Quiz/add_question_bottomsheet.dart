import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '/Models/question_model.dart';
import '../../Shared/firebase/firebase_functions.dart';
import '../../Shared/styles/colors.dart';

class AddQuestionBottomSheet extends StatefulWidget {
  const AddQuestionBottomSheet({super.key});

  @override
  State<AddQuestionBottomSheet> createState() => _AddQuestionBottomSheetState();
}

class _AddQuestionBottomSheetState extends State<AddQuestionBottomSheet> {
  var questionController = TextEditingController();
  var answerController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 18.w),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Add New Question",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Theme.of(context).indicatorColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Question";
                  }
                  return null;
                },
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp),
                controller: questionController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: primary),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: primary),
                  ),
                  hintText: "Enter Question",
                  hintStyle: GoogleFonts.inter(
                      color: const Color(0xffA9A9A9).withOpacity(.61),
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Answer";
                  }
                  return null;
                },
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp),
                controller: answerController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: primary),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: primary),
                  ),
                  hintText: "Enter Answer",
                  hintStyle: GoogleFonts.inter(
                      color: const Color(0xffA9A9A9).withOpacity(.61),
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      QuestionModel questionModel = QuestionModel(
                          question: questionController.text,
                          answer: answerController.text);
                      FirebaseFunctions.addQuestion(questionModel);
                      Navigator.pop(context, (route) => false);
                    }
                  },
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)))),
                  child: Text(
                    "Add Question",
                    style: TextStyle(fontSize: 16.sp),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
