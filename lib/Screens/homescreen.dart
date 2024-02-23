import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../tabs/FlashCard%20Quiz/add_question_bottomsheet.dart';
import '../tabs/FlashCard Quiz/flashcard_quiz_tab.dart';
import '../tabs/Quiz Score Tab/quiz_score_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home Screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [const FlashCardQuizTab(), const QuizScoreTab()];

  int index=0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: tabs[index],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(onPressed: () {
          showSheet();
        },
          shape: CircleBorder(
            side: BorderSide(color: Theme.of(context).cardColor,width: 3.w)
          ),
        child: Icon(Icons.add,size: 30.sp,),
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 8.r,
          height: 80.h,
          shape: const CircularNotchedRectangle(),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
              onTap: (value) {
                index=value;
                setState(() {

                });
              },
              currentIndex: index,
              items: const [
             BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
             BottomNavigationBarItem(icon: Icon(Icons.bar_chart_outlined), label: "")
          ]),
        ),
      ),
    );
  }
  
  void showSheet(){
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, builder: (context) {
      return Padding(
        padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: const AddQuestionBottomSheet(),
      );
    },);
  }
}
