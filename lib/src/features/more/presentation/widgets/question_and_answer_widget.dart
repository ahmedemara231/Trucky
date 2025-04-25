part of '../imports/imports.dart';

class QuestionAndAnswerWidget extends StatelessWidget {
  const QuestionAndAnswerWidget({super.key,
    required this.question,
    required this.answer,
  });

  final String question;
  final String answer;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedTextColor: Colors.black87,
      collapsedBackgroundColor: AppColors.fifth,
      collapsedIconColor: Colors.white,
      iconColor: Colors.white,
      childrenPadding: EdgeInsets.all(10.r),

      // coll
      // backgroundColor: AppColors.fifth,
        title: AppText(question, fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.white,),
      children: [
        AppText(answer, fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.white,),
      ],
    );
  }
}